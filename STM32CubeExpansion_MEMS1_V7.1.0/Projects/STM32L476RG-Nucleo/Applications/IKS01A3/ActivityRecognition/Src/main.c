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
 * @mainpage Documentation for MotionAR package of X-CUBE-MEMS1 Software for
 * X-NUCLEO-IKS01A3 expansion board
 *
 * @image html st_logo.png
 *
 * <b>Introduction</b>
 *
 * MotionAR software is an add-on for the X-CUBE-MEMS1 software and provides
 * the real-time activity recognition data.
 * The expansion is built on top of STM32Cube software technology that eases
 * portability across different STM32 microcontrollers.
 */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include "main.h"
#include "com.h"
#include "DemoDatalog.h"
#include "DemoSerial.h"
#include "MotionAR_Manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup ACTIVITY_RECOGNITION ACTIVITY RECOGNITION
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define ALGO_FREQ       16U               /* Algorithm frequency [Hz] */
#define ALGO_PERIOD  (1000U / ALGO_FREQ)  /* Algorithm period [ms] */

#define SESSION_COUNTER_MAX  ((uint32_t)(5U * 60U * ALGO_FREQ)) /* Equals to 5 min */

/* Extern variables ----------------------------------------------------------*/
volatile uint8_t FlashEraseRequest = 0;

uint8_t DataLoggerActive = 0;
uint32_t SensorsEnabled = 0;
TIM_HandleTypeDef AlgoTimHandle;
flash_state_t FlashState = FLASH_READY;
int UseLSI = 0;

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t SensorReadRequest     = 0;
static volatile uint8_t GuiModeRequest        = 0;
static volatile uint8_t StandaloneModeRequest = 0;

static volatile int64_t TimeStamp = 0;

static program_state_t ProgramState = GUI_MODE;

static uint8_t SessionNew = 0;
static uint8_t DataIndex  = 0;

static int RtcSynchPrediv;
static RTC_HandleTypeDef RtcHandle;

static IKS01A3_MOTION_SENSOR_Axes_t AccValue;

/* Private function prototypes -----------------------------------------------*/
static void RTC_Config(void);
static void RTC_TimeStampConfig(void);
static void Init_Sensors(void);
static void MX_GPIO_Init(void);
static void MX_CRC_Init(void);
static void MX_TIM_ALGO_Init(void);
static void RTC_Handler(TMsg *Msg);
static void RTC_Handler_DataStamp(DateTime_t *Stamp);
static void AR_Data_Handler(TMsg *Msg);
static void Accelero_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Gyro_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Magneto_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Pressure_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Humidity_Sensor_Handler(TMsg *Msg, uint32_t Instance);
static void Temperature_Sensor_Handler(TMsg *Msg, uint32_t Instance);

/* Public functions ----------------------------------------------------------*/
/**
 * @brief  Main function is to show how to use X_NUCLEO_IKS01A3
 *         expansion board to recognize activity data and send it from a Nucleo
 *         board to a connected PC, using UART, displaying it on Unicleo-GUI
 *         application, developed by STMicroelectronics.
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
   *   - Configure the Flash prefetch, instruction and Data caches
   *   - Configure the Systick to generate an interrupt each 1 msec
   *   - Set NVIC Group Priority to 4
   *   - Global MSP (MCU Support Package) initialization
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

  /* Activity Recognition API initialization function */
  MotionAR_manager_init();

  /* OPTIONAL */
  /* Get library version */
  MotionAR_manager_get_version(lib_version, &lib_version_len);

  /* Initialize Communication Peripheral for data log */
  USARTConfig();

  /* RTC Initialization */
  RTC_Config();
  RTC_TimeStampConfig();

  /* Timer for algorithm synchronization initialization */
  MX_TIM_ALGO_Init();

  /* Set current data storage address to the first free address in flash memory */
  FlashState = Datalog_SetAddress();
  if (FlashState == FLASH_FULL)
  {
    BSP_LED_On(LED2);
  }
  else
  {
    BSP_LED_On(LED2);
    HAL_Delay(500);
    BSP_LED_Off(LED2);
  }

  for (;;)
  {
    if (UART_ReceivedMSG((TMsg *)&msg_cmd) != 1)
    {
      if (msg_cmd.Data[0] == DEV_ADDR)
      {
        if (ProgramState == GUI_MODE)
        {
          (void)HandleMSG((TMsg *)&msg_cmd);
        }
      }
    }

    if (FlashEraseRequest == 1U)
    {
      FlashEraseRequest = 0;

      BSP_LED_Off(LED2);

      (void)Datalog_FlashErase();

      for (int i = 0; i < 3; i++)
      {
        BSP_LED_Toggle(LED2);
        HAL_Delay(500);
        BSP_LED_Toggle(LED2);
        HAL_Delay(1000);
      }

      FlashState = FLASH_READY;
    }

    if (GuiModeRequest == 1U)
    {
      GuiModeRequest = 0;

      (void)HAL_TIM_Base_Stop_IT(&AlgoTimHandle);
      (void)IKS01A3_MOTION_SENSOR_Disable(IKS01A3_LSM6DSO_0, MOTION_ACCELERO);
      SensorsEnabled &= ~ACCELEROMETER_SENSOR;

      /* Store in FLASH any data collected during STANDALONE mode
         remaining in buffer */
      (void)Datalog_SaveData2Mem(DataIndex);

      ProgramState = GUI_MODE;
    }

    if (StandaloneModeRequest == 1U)
    {
      StandaloneModeRequest = 0;

      SessionNew = 1;

      (void)IKS01A3_MOTION_SENSOR_Enable(IKS01A3_LSM6DSO_0, MOTION_ACCELERO);
      SensorsEnabled |= ACCELEROMETER_SENSOR;
      (void)HAL_TIM_Base_Start_IT(&AlgoTimHandle);

      ProgramState = STANDALONE_MODE;
    }

    if (SensorReadRequest == 1U)
    {
      SensorReadRequest = 0;

      switch (ProgramState)
      {
        case GUI_MODE:
          /* Acquire data from enabled sensors and fill Msg stream */
          RTC_Handler(&msg_dat);
          Accelero_Sensor_Handler(&msg_dat, IKS01A3_LSM6DSO_0);
          Gyro_Sensor_Handler(&msg_dat, IKS01A3_LSM6DSO_0);
          Magneto_Sensor_Handler(&msg_dat, IKS01A3_LIS2MDL_0);
          Humidity_Sensor_Handler(&msg_dat, IKS01A3_HTS221_0);
          Temperature_Sensor_Handler(&msg_dat, IKS01A3_HTS221_0);
          Pressure_Sensor_Handler(&msg_dat, IKS01A3_LPS22HH_0);

          /* Activity Recognition specific part */
          AR_Data_Handler(&msg_dat);

          /* Send data stream */
          INIT_STREAMING_HEADER(&msg_dat);
          msg_dat.Len = STREAMING_MSG_LENGTH;
          UART_SendMsg(&msg_dat);
          break;

        case STANDALONE_MODE:
          Accelero_Sensor_Handler(&msg_dat, IKS01A3_LSM6DSO_0);
          AR_Data_Handler(&msg_dat);
          break;

        default:
          Error_Handler();
          break;
      }
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
  (void)IKS01A3_MOTION_SENSOR_Init(IKS01A3_LSM6DSO_0, MOTION_ACCELERO | MOTION_GYRO);
  (void)IKS01A3_MOTION_SENSOR_Init(IKS01A3_LIS2MDL_0, MOTION_MAGNETO);
  (void)IKS01A3_ENV_SENSOR_Init(IKS01A3_HTS221_0, ENV_TEMPERATURE | ENV_HUMIDITY);
  (void)IKS01A3_ENV_SENSOR_Init(IKS01A3_LPS22HH_0, ENV_PRESSURE);

  /* Set accelerometer:
   *   - ODR >= 16Hz
   *   - FS   = <-4g, 4g>
   */
  (void)IKS01A3_MOTION_SENSOR_SetOutputDataRate(IKS01A3_LSM6DSO_0, MOTION_ACCELERO, 16.0f);
  (void)IKS01A3_MOTION_SENSOR_SetFullScale(IKS01A3_LSM6DSO_0, MOTION_ACCELERO, 4);
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

#elif (defined (USE_STM32L0XX_NUCLEO))
#define CPU_CLOCK  32000000U

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
 * @brief  Handles the data timestamp
 * @param  Stamp the stamp (time + date)
 * @retval None
 */
static void RTC_Handler_DataStamp(DateTime_t *Stamp)
{
  RTC_DateTypeDef date;
  RTC_TimeTypeDef time;

  (void)HAL_RTC_GetTime(&RtcHandle, &time, FORMAT_BIN);
  (void)HAL_RTC_GetDate(&RtcHandle, &date, FORMAT_BIN);

  Stamp->date[0] = (uint8_t)date.Month;
  Stamp->date[1] = (uint8_t)date.Date;
  Stamp->date[2] = (uint8_t)date.Year;
  Stamp->time[0] = (uint8_t)time.Hours;
  Stamp->time[1] = (uint8_t)time.Minutes;
  Stamp->time[2] = (uint8_t)time.Seconds;
}

/**
 * @brief  Activity Recognition data handler
 * @param  Msg the Activity Recognition data part of the stream
 * @retval None
 */
static void AR_Data_Handler(TMsg *Msg)
{
  MAR_input_t data_in = {.acc_x = 0.0f, .acc_y = 0.0f, .acc_z = 0.0f};
  static MAR_output_t activity_prev = MAR_NOACTIVITY;
  static MAR_output_t activity;
  static uint32_t session_counter = 0;

  if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
  {
    /* Convert acceleration from [mg] to [g] */
    data_in.acc_x = (float)AccValue.x / 1000.0f;
    data_in.acc_y = (float)AccValue.y / 1000.0f;
    data_in.acc_z = (float)AccValue.z / 1000.0f;

    /* Run Activity Recognition algorithm */
    BSP_LED_On(LED2);
    MotionAR_manager_run(&data_in, &activity, TimeStamp);
    BSP_LED_Off(LED2);

    if (ProgramState == GUI_MODE)
    {
      Serialize_s32(&Msg->Data[55], (int32_t)activity, 4);
    }
    else if (ProgramState == STANDALONE_MODE)
    {
      /* New session */
      if (SessionNew == 1U)
      {
        SessionNew = 0;
        session_counter = 0;
        DataIndex = 0;

        /* Create new session record with only date and time */
        RTC_Handler_DataStamp(&DataByte[DataIndex].date_time);
        DataByte[DataIndex].data_valid = 0; /* 0 if new session */
        DataByte[DataIndex].activity_type = (uint8_t)MAR_NOACTIVITY;
        DataIndex++;

        activity_prev = MAR_NOACTIVITY;
        return;
      }

      /* Buffer full */
      if (DataIndex >= DATABYTE_LEN)
      {
        /* Data are stored in FLASH */
        if (Datalog_SaveData2Mem(DataIndex) == 0U)
        {
          GuiModeRequest = 1;
        }

        DataIndex = 0;
      }

      /* Data changed */
      if (activity_prev != activity)
      {
        /* Store new data in buffer */
        RTC_Handler_DataStamp(&DataByte[DataIndex].date_time);
        DataByte[DataIndex].data_valid = 1; /* 0 if new session */
        DataByte[DataIndex].activity_type = (uint8_t)activity;
        DataIndex++;

        activity_prev = activity;
      }

      /* Periodic data save */
      if (session_counter >= SESSION_COUNTER_MAX)
      {
        /* Data are stored in FLASH */
        if (Datalog_SaveData2Mem(DataIndex) == 0U)
        {
          GuiModeRequest = 1;
        }

        session_counter = 0;
        DataIndex = 0;
      }
      else
      {
        session_counter++;
      }
    }
    else
    {
      Error_Handler();
    }
  }
}

/**
 * @brief  Handles the ACC axes data getting/sending
 * @param  Msg the ACC part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Accelero_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
  {
    (void)IKS01A3_MOTION_SENSOR_GetAxes(Instance, MOTION_ACCELERO, &AccValue);
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
  IKS01A3_MOTION_SENSOR_Axes_t gyr_value;

  if ((SensorsEnabled & GYROSCOPE_SENSOR) == GYROSCOPE_SENSOR)
  {
    (void)IKS01A3_MOTION_SENSOR_GetAxes(Instance, MOTION_GYRO, &gyr_value);
    Serialize_s32(&Msg->Data[31], gyr_value.x, 4);
    Serialize_s32(&Msg->Data[35], gyr_value.y, 4);
    Serialize_s32(&Msg->Data[39], gyr_value.z, 4);
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
  IKS01A3_MOTION_SENSOR_Axes_t mag_value;

  if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
  {
    (void)IKS01A3_MOTION_SENSOR_GetAxes(Instance, MOTION_MAGNETO, &mag_value);
    Serialize_s32(&Msg->Data[43], mag_value.x, 4);
    Serialize_s32(&Msg->Data[47], mag_value.y, 4);
    Serialize_s32(&Msg->Data[51], mag_value.z, 4);
  }
}

/**
 * @brief  Handles the PRESS sensor data getting/sending.
 * @param  Msg the PRESS part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Pressure_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  float pres_value;

  if ((SensorsEnabled & PRESSURE_SENSOR) == PRESSURE_SENSOR)
  {
    (void)IKS01A3_ENV_SENSOR_GetValue(Instance, ENV_PRESSURE, &pres_value);
    (void)memcpy(&Msg->Data[7], (void *)&pres_value, sizeof(float));
  }
}

/**
 * @brief  Handles the TEMP axes data getting/sending
 * @param  Msg the TEMP part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Temperature_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  float temp_value;

  if ((SensorsEnabled & TEMPERATURE_SENSOR) == TEMPERATURE_SENSOR)
  {
    (void)IKS01A3_ENV_SENSOR_GetValue(Instance, ENV_TEMPERATURE, &temp_value);
    (void)memcpy(&Msg->Data[11], (void *)&temp_value, sizeof(float));
  }
}

/**
 * @brief  Handles the HUM axes data getting/sending
 * @param  Msg the HUM part of the stream
 * @param  Instance the device instance
 * @retval None
 */
static void Humidity_Sensor_Handler(TMsg *Msg, uint32_t Instance)
{
  float hum_value;

  if ((SensorsEnabled & HUMIDITY_SENSOR) == HUMIDITY_SENSOR)
  {
    (void)IKS01A3_ENV_SENSOR_GetValue(Instance, ENV_HUMIDITY, &hum_value);
    (void)memcpy(&Msg->Data[15], (void *)&hum_value, sizeof(float));;
  }
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
  rcc_osc_init_struct.OscillatorType = RCC_OSCILLATORTYPE_LSI | RCC_OSCILLATORTYPE_LSE;
  rcc_osc_init_struct.PLL.PLLState   = RCC_PLL_NONE;
  rcc_osc_init_struct.LSEState       = RCC_LSE_ON;
  rcc_osc_init_struct.LSIState       = RCC_LSI_OFF;

  if (HAL_RCC_OscConfig(&rcc_osc_init_struct) != HAL_OK)
  {
    /* LSE not available, we use LSI */
    UseLSI = 1;
    RtcHandle.Init.AsynchPrediv = RTC_ASYNCH_PREDIV_LSI;
    RtcHandle.Init.SynchPrediv  = RTC_SYNCH_PREDIV_LSI;
    RtcSynchPrediv = RTC_SYNCH_PREDIV_LSI;
  }
  else
  {
    /* We use LSE */
    UseLSI = 0;
    RtcHandle.Init.AsynchPrediv = RTC_ASYNCH_PREDIV_LSE;
    RtcHandle.Init.SynchPrediv  = RTC_SYNCH_PREDIV_LSE;
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
  sdatestructure.Year    = 0x01;
  sdatestructure.Month   = RTC_MONTH_JANUARY;
  sdatestructure.Date    = 0x01;
  sdatestructure.WeekDay = RTC_WEEKDAY_MONDAY;

  if (HAL_RTC_SetDate(&RtcHandle, &sdatestructure, FORMAT_BCD) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }

  /* Configure the Time */
  /* Set Time: 00:00:00 */
  stimestructure.Hours          = 0x00;
  stimestructure.Minutes        = 0x00;
  stimestructure.Seconds        = 0x00;
  stimestructure.TimeFormat     = RTC_HOURFORMAT12_AM;
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

  sdatestructure.Year    = y;
  sdatestructure.Month   = m;
  sdatestructure.Date    = d;
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

  stimestructure.TimeFormat     = RTC_HOURFORMAT12_AM;
  stimestructure.Hours          = hh;
  stimestructure.Minutes        = mm;
  stimestructure.Seconds        = ss;
  stimestructure.SubSeconds     = 0;
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
 * @param  GpioPin the pin connected to EXTI line
 * @retval None
 */
void HAL_GPIO_EXTI_Callback(uint16_t GpioPin)
{
  if (GpioPin == KEY_BUTTON_PIN)
  {
    if (BSP_PB_GetState(BUTTON_KEY) == (uint32_t)GPIO_PIN_RESET)
    {
      if (ProgramState == GUI_MODE)
      {
        StandaloneModeRequest = 1;
      }
      else if (ProgramState == STANDALONE_MODE)
      {
        GuiModeRequest = 1;
      }
      else
      {
        Error_Handler();
      }
    }
  }
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
    TimeStamp += ALGO_PERIOD;
  }
}

#ifdef  USE_FULL_ASSERT
/**
 * @brief  Reports the name of the source file and the source line number
 *         where the assert_param error has occurred
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
