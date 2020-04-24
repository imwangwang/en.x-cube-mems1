/**
 ******************************************************************************
 * @file    main.c
 * @author  MEMS Software Solutions Team
 * @brief   Main program body
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed under Software License Agreement
 * SLA0077, (the "License"). You may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *     www.st.com/content/st_com/en/search.html#q=SLA0077-t=keywords-page=1
 *
 *******************************************************************************
 */

/**
 * @mainpage Documentation for MotionMC package of X-CUBE-MEMS1 Software for X-NUCLEO-IKS01Ax expansion boards
 *
 * @image html st_logo.png
 *
 * <b>Introduction</b>
 *
 * MotionMC software is an add-on for the X-CUBE-MEMS1 software and provides
 * magnetometer calibration.
 * The expansion is built on top of STM32Cube software technology that eases
 * portability across different STM32 microcontrollers.
 */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include "main.h"
#include "com.h"
#include "DemoSerial.h"
#include "MotionMC_Manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup MAGNETOMETER_CALIBRATION MAGNETOMETER CALIBRATION
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define ALGO_FREQ   50U     /* Algorithm frequency [Hz] */

/* Extern variables ----------------------------------------------------------*/
extern int UseLSI;
uint8_t DataLoggerActive = 0;
extern volatile uint32_t SensorsEnabled; /* This "redundant" line is here to fulfil MISRA C-2012 rule 8.4 */
volatile uint32_t SensorsEnabled = 0;
TIM_HandleTypeDef AlgoTimHandle;

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static const uint32_t ReportInterval = 1000 / (float)ALGO_FREQ; /* Algorithm report interval [ms]
                                                            Note: Must be between 10 and 50 ms */
static int RtcSynchPrediv;
static RTC_HandleTypeDef RtcHandle;
static volatile uint32_t TimeStamp = 0;
static volatile uint8_t SensorReadRequest = 0;
static IKS02A1_MOTION_SENSOR_Axes_t MagValue;

/* Private function prototypes -----------------------------------------------*/
static void RTC_Config(void);
static void RTC_TimeStampConfig(void);
static void Init_Sensors(void);
static void MX_GPIO_Init(void);
static void MX_CRC_Init(void);
static void MX_TIM_ALGO_Init(void);
static void RTC_Handler(TMsg *Msg);
static void MC_Data_Handler(TMsg *Msg);
static void Accelero_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Gyro_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Magneto_Sensor_Handler(TMsg *Msg, uint32_t Instance);

/* Public functions ----------------------------------------------------------*/
/**
 * @brief  Main function is to show how to use X_NUCLEO_IKS01Ax
 *         expansion board to perform magnetometer sensor calibration and send
 *         data from a Nucleo board to a connected PC, using UART, displaying
 *         it on Unicleo-GUI application, developed by STMicroelectronics.
 *         After connection has been established with GUI, the user can visualize
 *         the data and save datalog for offline analysis.
 *         See User Manual for details.
 * @param  None
 * @retval None
 */
int main(void); /* This "redundant" line is here to fulfil MISRA C-2012 rule 8.4 */
int main(void)
{
  char lib_version[35];
  int lib_version_len;
  TMsg msg_dat;
  TMsg msg_cmd;

  /* STM32xxxx HAL library initialization:
  - Configure the Flash prefetch, instruction and Data caches
  - Configure the Systick to generate an interrupt each 1 msec
  - Set NVIC Group Priority to 4
  - Global MSP (MCU Support Package) initialization
  */
  (void)HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Configure the SysTick IRQ priority - set the second lowest priority */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0x0E, 0);

  /* Initialize GPIOs */
  MX_GPIO_Init();

  /* Initialize CRC */
  MX_CRC_Init();

  /* Initialize (disabled) Sensors */
  Init_Sensors();

  /* Magnetometer Calibration API initialization function */
  /* Use default settings */
  MotionMC_manager_init(ReportInterval, 1);

  /* OPTIONAL */
  /* Get library version */
  MotionMC_manager_get_version(lib_version, &lib_version_len);

  /* Initialize Communication Peripheral for data log */
  USARTConfig();

  /* RTC Initialization */
  RTC_Config();
  RTC_TimeStampConfig();

  /* Timer for algorithm synchronization initialization */
  MX_TIM_ALGO_Init();

  /* LED Blink */
  BSP_LED_On(LED2);
  HAL_Delay(500);
  BSP_LED_Off(LED2);

  for (;;)
  {
    if (UART_ReceivedMSG((TMsg *)&msg_cmd) != 1)
    {
      if (msg_cmd.Data[0] == DEV_ADDR)
      {
        (void)HandleMSG((TMsg *)&msg_cmd);
      }
    }

    if (SensorReadRequest == 1U)
    {
      SensorReadRequest = 0;

      /* Acquire data from enabled sensors and fill Msg stream */
      RTC_Handler(&msg_dat);
      Accelero_Sensor_Handler(&msg_dat, IKS02A1_ISM330DHCX_0);
      Gyro_Sensor_Handler(&msg_dat, IKS02A1_ISM330DHCX_0);
      Magneto_Sensor_Handler(&msg_dat, IKS02A1_IIS2MDC_0);

      /* Magnetometer Calibration specific part */
      MC_Data_Handler(&msg_dat);

      /* Send data stream */
      INIT_STREAMING_HEADER(&msg_dat);
      msg_dat.Len = STREAMING_MSG_LENGTH;
      UART_SendMsg(&msg_dat);
    }
  }
}

/* Private functions ---------------------------------------------------------*/
/**
 * @brief  Initialize all sensors
 * @param  None
 * @retval None
 */
static void Init_Sensors(void)
{
  (void)IKS02A1_MOTION_SENSOR_Init(IKS02A1_ISM330DHCX_0, MOTION_ACCELERO | MOTION_GYRO);
  (void)IKS02A1_MOTION_SENSOR_Init(IKS02A1_IIS2MDC_0, MOTION_MAGNETO);

  /* Set accelerometer:
   *   - ODR >= 50 Hz
   *   - FS   = <-4g, 4g>
   */
  (void)IKS02A1_MOTION_SENSOR_SetOutputDataRate(IKS02A1_ISM330DHCX_0, MOTION_ACCELERO, 50.0f);
  (void)IKS02A1_MOTION_SENSOR_SetFullScale(IKS02A1_ISM330DHCX_0, MOTION_ACCELERO, 4);
}

/**
 * @brief  GPIO init function.
 * @param  None
 * @retval None
 * @details GPIOs initialized are User LED(PA5) and User Push Button(PC1)
 */
static void MX_GPIO_Init(void)
{
  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize push button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);
}

/**
 * @brief  CRC init function.
 * @param  None
 * @retval None
 */
static void MX_CRC_Init(void)
{
  __CRC_CLK_ENABLE();
}

/**
 * @brief  TIM_ALGO init function.
 * @param  None
 * @retval None
 * @details This function intializes the Timer used to synchronize the algorithm.
 */
static void MX_TIM_ALGO_Init(void)
{
#if (defined (USE_STM32F4XX_NUCLEO))
#define CPU_CLOCK  84000000U

#elif (defined (USE_STM32L1XX_NUCLEO))
#define CPU_CLOCK  32000000U

#elif (defined (USE_STM32L4XX_NUCLEO))
#define CPU_CLOCK  80000000U

#else
#error Not supported platform
#endif

#define TIM_CLOCK  2000U

  const uint32_t prescaler = CPU_CLOCK / TIM_CLOCK - 1U;
  const uint32_t tim_period = TIM_CLOCK / ALGO_FREQ - 1U;

  TIM_ClockConfigTypeDef s_clock_source_config;
  TIM_MasterConfigTypeDef s_master_config;

  AlgoTimHandle.Instance           = TIM_ALGO;
  AlgoTimHandle.Init.Prescaler     = prescaler;
  AlgoTimHandle.Init.CounterMode   = TIM_COUNTERMODE_UP;
  AlgoTimHandle.Init.Period        = tim_period;
  AlgoTimHandle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  (void)HAL_TIM_Base_Init(&AlgoTimHandle);

  s_clock_source_config.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  (void)HAL_TIM_ConfigClockSource(&AlgoTimHandle, &s_clock_source_config);

  s_master_config.MasterOutputTrigger = TIM_TRGO_RESET;
  s_master_config.MasterSlaveMode     = TIM_MASTERSLAVEMODE_DISABLE;
  (void)HAL_TIMEx_MasterConfigSynchronization(&AlgoTimHandle, &s_master_config);
}

/**
 * @brief  Handles the time+date getting/sending
 * @param  Msg the time+date part of the stream
 * @retval None
 */
static void RTC_Handler(TMsg *Msg)
{
  uint8_t sub_sec;
  uint32_t ans_uint32;
  int32_t ans_int32;
  RTC_DateTypeDef sdatestructureget;
  RTC_TimeTypeDef stimestructure;

  (void)HAL_RTC_GetTime(&RtcHandle, &stimestructure, FORMAT_BIN);
  (void)HAL_RTC_GetDate(&RtcHandle, &sdatestructureget, FORMAT_BIN);

  /* To be MISRA C-2012 compliant the original calculation:
     sub_sec = ((((((int)RtcSynchPrediv) - ((int)stimestructure.SubSeconds)) * 100) / (RtcSynchPrediv + 1)) & 0xFF);
     has been split to separate expressions */
  ans_int32 = (RtcSynchPrediv - (int32_t)stimestructure.SubSeconds) * 100;
  ans_int32 /= RtcSynchPrediv + 1;
  ans_uint32 = (uint32_t)ans_int32 & 0xFFU;
  sub_sec = (uint8_t)ans_uint32;

  Msg->Data[3] = (uint8_t)stimestructure.Hours;
  Msg->Data[4] = (uint8_t)stimestructure.Minutes;
  Msg->Data[5] = (uint8_t)stimestructure.Seconds;
  Msg->Data[6] = sub_sec;
}

/**
 * @brief  Handles the ACC axes data getting/sending
 * @param  Msg the ACC part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Accelero_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  IKS02A1_MOTION_SENSOR_Axes_t AccValue;

  if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
  {
    (void)IKS02A1_MOTION_SENSOR_GetAxes(Instance, MOTION_ACCELERO, &AccValue);
    Serialize_s32(&Msg->Data[19], (int32_t)AccValue.x, 4);
    Serialize_s32(&Msg->Data[23], (int32_t)AccValue.y, 4);
    Serialize_s32(&Msg->Data[27], (int32_t)AccValue.z, 4);
  }
}

/**
 * @brief  Handles the GYR axes data getting/sending
 * @param  Msg the GYR part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Gyro_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  IKS02A1_MOTION_SENSOR_Axes_t GyrValue;

  if ((SensorsEnabled & GYROSCOPE_SENSOR) == GYROSCOPE_SENSOR)
  {
    (void)IKS02A1_MOTION_SENSOR_GetAxes(Instance, MOTION_GYRO, &GyrValue);
    Serialize_s32(&Msg->Data[31], GyrValue.x, 4);
    Serialize_s32(&Msg->Data[35], GyrValue.y, 4);
    Serialize_s32(&Msg->Data[39], GyrValue.z, 4);
  }
}

/**
 * @brief  Handles the MAG axes data getting/sending
 * @param  Msg the MAG part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Magneto_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
  {
    (void)IKS02A1_MOTION_SENSOR_GetAxes(Instance, MOTION_MAGNETO, &MagValue);
    Serialize_s32(&Msg->Data[43], MagValue.x, 4);
    Serialize_s32(&Msg->Data[47], MagValue.y, 4);
    Serialize_s32(&Msg->Data[51], MagValue.z, 4);
  }
}

/**
 * @brief  Magnetometer calibration data sending
 * @param  Msg the Magnetometer calibration part of the stream
 * @retval None
 */
static void MC_Data_Handler(TMsg *Msg)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  MMC_Input_t data_in;
  MMC_Output_t data_out;
#elif (defined (USE_STM32L0XX_NUCLEO))
  MMC_CM0P_Input_t data_in;
  MMC_CM0P_Output_t data_out;
#else
#error Not supported platform
#endif

  IKS02A1_MOTION_SENSOR_Axes_t MagComp;

  /* Convert magnetometer data from [mGauss] to [uT] */
  data_in.Mag[0] = (float)MagValue.x / 10.0f;
  data_in.Mag[1] = (float)MagValue.y / 10.0f;
  data_in.Mag[2] = (float)MagValue.z / 10.0f;

#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  data_in.TimeStamp = TimeStamp * ReportInterval;
#endif

  BSP_LED_On(LED2);

  /* Run Magnetometer Calibration algorithm */
  MotionMC_manager_update(&data_in);

  /* Get the magnetometer compensation for hard/soft iron */
  MotionMC_manager_get_params(&data_out);

  /* Do hard & soft iron calibration */
  MotionMC_manager_compensate(&MagValue, &MagComp);

  BSP_LED_Off(LED2);

  /* Hard iron coefficients */
  Serialize_s32(&Msg->Data[55], mag_val_to_mGauss(data_out.HI_Bias[0]), 4);
  Serialize_s32(&Msg->Data[59], mag_val_to_mGauss(data_out.HI_Bias[1]), 4);
  Serialize_s32(&Msg->Data[63], mag_val_to_mGauss(data_out.HI_Bias[2]), 4);

  /* Soft iron coeficients */
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  FloatToArray(&Msg->Data[67], data_out.SF_Matrix[0][0]);
  FloatToArray(&Msg->Data[71], data_out.SF_Matrix[0][1]);
  FloatToArray(&Msg->Data[75], data_out.SF_Matrix[0][2]);

  FloatToArray(&Msg->Data[79], data_out.SF_Matrix[1][0]);
  FloatToArray(&Msg->Data[83], data_out.SF_Matrix[1][1]);
  FloatToArray(&Msg->Data[87], data_out.SF_Matrix[1][2]);

  FloatToArray(&Msg->Data[91], data_out.SF_Matrix[2][0]);
  FloatToArray(&Msg->Data[95], data_out.SF_Matrix[2][1]);
  FloatToArray(&Msg->Data[99], data_out.SF_Matrix[2][2]);
#elif (defined (USE_STM32L0XX_NUCLEO))
  FloatToArray(&Msg->Data[67], data_out.SI_Matrix[0][0]);
  FloatToArray(&Msg->Data[71], data_out.SI_Matrix[0][1]);
  FloatToArray(&Msg->Data[75], data_out.SI_Matrix[0][2]);

  FloatToArray(&Msg->Data[79], data_out.SI_Matrix[1][0]);
  FloatToArray(&Msg->Data[83], data_out.SI_Matrix[1][1]);
  FloatToArray(&Msg->Data[87], data_out.SI_Matrix[1][2]);

  FloatToArray(&Msg->Data[91], data_out.SI_Matrix[2][0]);
  FloatToArray(&Msg->Data[95], data_out.SI_Matrix[2][1]);
  FloatToArray(&Msg->Data[99], data_out.SI_Matrix[2][2]);
#else
#error Not supported platform
#endif

  /* Calibrated data */
  /* NOTE: Magnetometer data unit is [mGauss] */
  Serialize_s32(&Msg->Data[103], MagComp.x, 4);
  Serialize_s32(&Msg->Data[107], MagComp.y, 4);
  Serialize_s32(&Msg->Data[111], MagComp.z, 4);

  /* Calibration quality */
  Serialize_s32(&Msg->Data[115], (int32_t) data_out.CalQuality, 4);
}

/**
 * @brief  Configures the RTC
 * @param  None
 * @retval None
 */
static void RTC_Config(void)
{
  /*##-1- Configure the RTC peripheral #######################################*/
  /* Check if LSE can be used */
  RCC_OscInitTypeDef rcc_osc_init_struct;

  /*##-2- Configure LSE as RTC clock soucre ###################################*/
  rcc_osc_init_struct.OscillatorType =  RCC_OSCILLATORTYPE_LSI | RCC_OSCILLATORTYPE_LSE;
  rcc_osc_init_struct.PLL.PLLState = RCC_PLL_NONE;
  rcc_osc_init_struct.LSEState = RCC_LSE_ON;
  rcc_osc_init_struct.LSIState = RCC_LSI_OFF;
  if (HAL_RCC_OscConfig(&rcc_osc_init_struct) != HAL_OK)
  {
    /* LSE not available, we use LSI */
    UseLSI = 1;
    RtcHandle.Init.AsynchPrediv = RTC_ASYNCH_PREDIV_LSI;
    RtcHandle.Init.SynchPrediv = RTC_SYNCH_PREDIV_LSI;
    RtcSynchPrediv = RTC_SYNCH_PREDIV_LSI;
  }
  else
  {
    /* We use LSE */
    UseLSI = 0;
    RtcHandle.Init.AsynchPrediv = RTC_ASYNCH_PREDIV_LSE;
    RtcHandle.Init.SynchPrediv = RTC_SYNCH_PREDIV_LSE;
    RtcSynchPrediv = RTC_SYNCH_PREDIV_LSE;
  }
  RtcHandle.Instance = RTC;

  /* Configure RTC prescaler and RTC data registers */
  /* RTC configured as follow:
       - Hour Format    = Format 12
       - Asynch Prediv  = Value according to source clock
       - Synch Prediv   = Value according to source clock
       - OutPut         = Output Disable
       - OutPutPolarity = High Polarity
       - OutPutType     = Open Drain
   */
  RtcHandle.Init.HourFormat     = RTC_HOURFORMAT_12;
  RtcHandle.Init.OutPut         = RTC_OUTPUT_DISABLE;
  RtcHandle.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  RtcHandle.Init.OutPutType     = RTC_OUTPUT_TYPE_OPENDRAIN;

  if (HAL_RTC_Init(&RtcHandle) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  Configures the current time and date
 * @param  None
 * @retval None
 */
static void RTC_TimeStampConfig(void)
{
  RTC_DateTypeDef sdatestructure;
  RTC_TimeTypeDef stimestructure;

  /* Configure the Date */
  /* Set Date: Monday January 1st 2001 */
  sdatestructure.Year = 0x01;
  sdatestructure.Month = RTC_MONTH_JANUARY;
  sdatestructure.Date = 0x01;
  sdatestructure.WeekDay = RTC_WEEKDAY_MONDAY;

  if (HAL_RTC_SetDate(&RtcHandle, &sdatestructure, FORMAT_BCD) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }

  /* Configure the Time */
  /* Set Time: 00:00:00 */
  stimestructure.Hours = 0x00;
  stimestructure.Minutes = 0x00;
  stimestructure.Seconds = 0x00;
  stimestructure.TimeFormat = RTC_HOURFORMAT12_AM;
  stimestructure.DayLightSaving = RTC_DAYLIGHTSAVING_NONE ;
  stimestructure.StoreOperation = RTC_STOREOPERATION_RESET;

  if (HAL_RTC_SetTime(&RtcHandle, &stimestructure, FORMAT_BCD) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  Configures the current date
 * @param  y the year value to be set
 * @param  m the month value to be set
 * @param  d the day value to be set
 * @param  dw the day-week value to be set
 * @retval None
 */
void RTC_DateRegulate(uint8_t y, uint8_t m, uint8_t d, uint8_t dw)
{
  RTC_DateTypeDef sdatestructure;

  sdatestructure.Year = y;
  sdatestructure.Month = m;
  sdatestructure.Date = d;
  sdatestructure.WeekDay = dw;

  if (HAL_RTC_SetDate(&RtcHandle, &sdatestructure, FORMAT_BIN) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  Configures the current time
 * @param  hh the hour value to be set
 * @param  mm the minute value to be set
 * @param  ss the second value to be set
 * @retval None
 */
void RTC_TimeRegulate(uint8_t hh, uint8_t mm, uint8_t ss)
{
  RTC_TimeTypeDef stimestructure;

  stimestructure.TimeFormat = RTC_HOURFORMAT12_AM;
  stimestructure.Hours = hh;
  stimestructure.Minutes = mm;
  stimestructure.Seconds = ss;
  stimestructure.SubSeconds = 0;
  stimestructure.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  stimestructure.StoreOperation = RTC_STOREOPERATION_RESET;

  if (HAL_RTC_SetTime(&RtcHandle, &stimestructure, FORMAT_BIN) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  This function is executed in case of error occurrence
 * @param  None
 * @retval None
 */
void Error_Handler(void)
{
  for (;;)
  {
    BSP_LED_On(LED2);
    HAL_Delay(100);
    BSP_LED_Off(LED2);
    HAL_Delay(100);
  }
}

/**
 * @brief  EXTI line detection callbacks
 * @param  GPIOPin the pin connected to EXTI line
 * @retval None
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIOPin)
{
}

/**
 * @brief  Period elapsed callback
 * @param  htim pointer to a TIM_HandleTypeDef structure that contains
 *              the configuration information for TIM module.
 * @retval None
 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  if (htim->Instance == TIM_ALGO)
  {
    SensorReadRequest = 1;
    TimeStamp++;
  }
}

#ifdef  USE_FULL_ASSERT
/**
 * @brief  Reports the name of the source file and the source line number where the assert_param error has occurred
 * @param  file pointer to the source file name
 * @param  line assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  for (;;)
  {}
}
#endif

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/