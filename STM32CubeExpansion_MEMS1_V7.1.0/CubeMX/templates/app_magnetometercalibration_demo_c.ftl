[#ftl]

[#assign useCortexM0 = false]
[#assign useCortexM3 = false]
[#assign useCortexM4 = false]
[#assign useCortexM7 = false]

[#if ("${FamilyName}" == "STM32F0" || "${FamilyName}" == "STM32G0" || "${FamilyName}" == "STM32L0")]
  [#assign useCortexM0 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F2" || "${FamilyName}" == "STM32L1")]
  [#assign useCortexM3 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F3" || "${FamilyName}" == "STM32F4" || "${FamilyName}" == "STM32G4" || "${FamilyName}" == "STM32L4" || "${FamilyName}" == "STM32WB")]
  [#assign useCortexM4 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F7" || "${FamilyName}" == "STM32H7")]
  [#assign useCortexM7 = true]
[/#if]

/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Period elapsed callback
 * @param  htim pointer to a TIM_HandleTypeDef structure that contains
 *              the configuration information for TIM module.
 * @retval None
 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  if (htim->Instance == BSP_IP_TIM_Handle.Instance)
  {
    SensorReadRequest = 1;
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
    TimeStamp++;
[/#if]
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

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F3")]
  if (HAL_RTC_SetDate(&hrtc, &sdatestructure, RTC_FORMAT_BIN) != HAL_OK)
[#else]
  if (HAL_RTC_SetDate(&hrtc, &sdatestructure, FORMAT_BIN) != HAL_OK)
[/#if]
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

  stimestructure.Hours          = hh;
  stimestructure.Minutes        = mm;
  stimestructure.Seconds        = ss;
[#if ("${FamilyName}" != "STM32F1" && "${FamilyName}" != "STM32F2")]
[#if ("${FamilyName}" == "STM32L1")]
#if defined(STM32L100xBA) || defined (STM32L151xBA) || defined (STM32L152xBA) || defined(STM32L100xC) || defined (STM32L151xC) || defined (STM32L152xC) || defined (STM32L162xC) || defined(STM32L151xCA) || defined (STM32L151xD) || defined (STM32L152xCA) || defined (STM32L152xD) || defined (STM32L162xCA) || defined (STM32L162xD) || defined(STM32L151xE) || defined(STM32L151xDX) || defined (STM32L152xE) || defined (STM32L152xDX) || defined (STM32L162xE) || defined (STM32L162xDX)
  stimestructure.SubSeconds     = 0;
#endif
[#else]
  stimestructure.SubSeconds     = 0;
[/#if]
[/#if]
[#if ("${FamilyName}" != "STM32F1")]
  stimestructure.TimeFormat     = RTC_HOURFORMAT12_AM;
  stimestructure.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  stimestructure.StoreOperation = RTC_STOREOPERATION_RESET;
[/#if]

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F3")]
  if (HAL_RTC_SetTime(&hrtc, &stimestructure, RTC_FORMAT_BIN) != HAL_OK)
[#else]
  if (HAL_RTC_SetTime(&hrtc, &stimestructure, FORMAT_BIN) != HAL_OK)
[/#if]
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  Gets Presentation string
 * @param  PresentationString the Presentation string
 * @param  Length the length of Presentation string
 * @retval None
 */
void Get_PresentationString(char *PresentationString, uint32_t *Length)
{
  char fw_id[] = {"5"}; /* FW ID for Unicleo-GUI */
  const uint8_t string_pointer_shift = strlen("ST MotionXX v"); /* Shift string pointer by this amount */
  char *lib_version_num;
  char lib_version_string[64];
  int lib_version_len = 0;

  MotionMC_manager_get_version(lib_version_string, &lib_version_len);

  /* Shorten library version string (e.g.: ST MotionXX v1.0.0) to contain version number only (e.g.: 1.0.0) */
  if (lib_version_len > string_pointer_shift)
  {
    lib_version_num = lib_version_string + string_pointer_shift;
  }
  else
  {
    lib_version_num = lib_version_string;
  }

  *Length = snprintf(PresentationString, 64, "MEMS shield demo,%s,%s,%s,%s", fw_id, FW_VERSION, lib_version_num, BOARD_NAME);
}

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Initialize the MagnetometerCalibration application
  * @retval None
  */
static void MX_MagnetometerCalibration_Init(void)
{
#ifdef BSP_IP_MEMS_INT1_PIN_NUM
  /* Force MEMS INT1 pin of the sensor low during startup in order to disable I3C and enable I2C. This function needs
   * to be called only if user wants to disable I3C / enable I2C and didn't put the pull-down resistor to MEMS INT1 pin
   * on his HW setup. This is also the case of usage X-NUCLEO-IKS01A2 or X-NUCLEO-IKS01A3 expansion board together with
   * sensor in DIL24 adapter board where the LDO with internal pull-up is used.
   */
  MEMS_INT1_Force_Low();
#endif

  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize Virtual COM Port */
  BSP_COM_Init(COM1);

  /* Initialize Timer */
  BSP_IP_TIM_Init();

  /* Configure Timer to run with desired algorithm frequency */
  TIM_Config(ALGO_FREQ);

  /* Initialize (disabled) sensors */
  Init_Sensors();

#ifdef BSP_IP_MEMS_INT1_PIN_NUM
  /* Initialize MEMS INT1 pin back to it's default state after I3C disable / I2C enable */
  MEMS_INT1_Init();
#endif

  /* Magnetometer Calibration API initialization function */
  MotionMC_manager_init(ReportInterval, 1);

  /* OPTIONAL */
  /* Get library version */
  MotionMC_manager_get_version(lib_version, &lib_version_len);

  BSP_LED_On(LED2);
  HAL_Delay(500);
  BSP_LED_Off(LED2);

  /* Start receiving messages via DMA */
  UART_StartReceiveMsg();
}

/**
  * @brief  Process of the MagnetometerCalibration application
  * @retval None
  */
static void MX_MagnetometerCalibration_Process(void)
{
  static TMsg msg_dat;
  static TMsg msg_cmd;

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
    Accelero_Sensor_Handler(&msg_dat);
    Gyro_Sensor_Handler(&msg_dat);
    Magneto_Sensor_Handler(&msg_dat);
    Humidity_Sensor_Handler(&msg_dat);
    Temperature_Sensor_Handler(&msg_dat);
    Pressure_Sensor_Handler(&msg_dat);

    /* Magnetometer Calibration specific part */
    MC_Data_Handler(&msg_dat);

    /* Send data stream */
    INIT_STREAMING_HEADER(&msg_dat);
    msg_dat.Len = STREAMING_MSG_LENGTH;
    UART_SendMsg(&msg_dat);
  }
}

/**
 * @brief  Initialize all sensors
 * @param  None
 * @retval None
 */
static void Init_Sensors(void)
{
  BSP_SENSOR_ACC_Init();
  BSP_SENSOR_GYR_Init();
  BSP_SENSOR_MAG_Init();
  BSP_SENSOR_PRESS_Init();
  BSP_SENSOR_TEMP_Init();
  BSP_SENSOR_HUM_Init();

  /* Set accelerometer:
   *   - ODR >= 50Hz
   *   - FS   = <-4g, 4g>
   */
  BSP_SENSOR_ACC_SetOutputDataRate(50.0f);
  BSP_SENSOR_ACC_SetFullScale(4);
}

/**
 * @brief  Handles the time+date getting/sending
 * @param  Msg the time+date part of the stream
 * @retval None
 */
static void RTC_Handler(TMsg *Msg)
{
  uint8_t sub_sec = 0;
  RTC_DateTypeDef sdatestructureget;
  RTC_TimeTypeDef stimestructure;
[#if ("${FamilyName}" != "STM32F1" && "${FamilyName}" != "STM32F2")]
[#if ("${FamilyName}" == "STM32L1")]
#if defined(STM32L100xBA) || defined (STM32L151xBA) || defined (STM32L152xBA) || defined(STM32L100xC) || defined (STM32L151xC) || defined (STM32L152xC) || defined (STM32L162xC) || defined(STM32L151xCA) || defined (STM32L151xD) || defined (STM32L152xCA) || defined (STM32L152xD) || defined (STM32L162xCA) || defined (STM32L162xD) || defined(STM32L151xE) || defined(STM32L151xDX) || defined (STM32L152xE) || defined (STM32L152xDX) || defined (STM32L162xE) || defined (STM32L162xDX)
  uint32_t ans_uint32;
  int32_t ans_int32;
  uint32_t RtcSynchPrediv = hrtc.Init.SynchPrediv;
#endif
[#else]
  uint32_t ans_uint32;
  int32_t ans_int32;
  uint32_t RtcSynchPrediv = hrtc.Init.SynchPrediv;
[/#if]
[/#if]

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F3")]
  (void)HAL_RTC_GetTime(&hrtc, &stimestructure, RTC_FORMAT_BIN);
  (void)HAL_RTC_GetDate(&hrtc, &sdatestructureget, RTC_FORMAT_BIN);
[#else]
  (void)HAL_RTC_GetTime(&hrtc, &stimestructure, FORMAT_BIN);
  (void)HAL_RTC_GetDate(&hrtc, &sdatestructureget, FORMAT_BIN);
[/#if]

[#if ("${FamilyName}" != "STM32F1" && "${FamilyName}" != "STM32F2")]
[#if ("${FamilyName}" == "STM32L1")]
#if defined(STM32L100xBA) || defined (STM32L151xBA) || defined (STM32L152xBA) || defined(STM32L100xC) || defined (STM32L151xC) || defined (STM32L152xC) || defined (STM32L162xC) || defined(STM32L151xCA) || defined (STM32L151xD) || defined (STM32L152xCA) || defined (STM32L152xD) || defined (STM32L162xCA) || defined (STM32L162xD) || defined(STM32L151xE) || defined(STM32L151xDX) || defined (STM32L152xE) || defined (STM32L152xDX) || defined (STM32L162xE) || defined (STM32L162xDX)
  /* To be MISRA C-2012 compliant the original calculation:
     sub_sec = ((((((int)RtcSynchPrediv) - ((int)stimestructure.SubSeconds)) * 100) / (RtcSynchPrediv + 1)) & 0xFF);
     has been split to separate expressions */
  ans_int32 = (RtcSynchPrediv - (int32_t)stimestructure.SubSeconds) * 100;
  ans_int32 /= RtcSynchPrediv + 1;
  ans_uint32 = (uint32_t)ans_int32 & 0xFFU;
  sub_sec = (uint8_t)ans_uint32;
#endif
[#else]
  /* To be MISRA C-2012 compliant the original calculation:
     sub_sec = ((((((int)RtcSynchPrediv) - ((int)stimestructure.SubSeconds)) * 100) / (RtcSynchPrediv + 1)) & 0xFF);
     has been split to separate expressions */
  ans_int32 = (RtcSynchPrediv - (int32_t)stimestructure.SubSeconds) * 100;
  ans_int32 /= RtcSynchPrediv + 1;
  ans_uint32 = (uint32_t)ans_int32 & 0xFFU;
  sub_sec = (uint8_t)ans_uint32;
[/#if]
[/#if]

  Msg->Data[3] = (uint8_t)stimestructure.Hours;
  Msg->Data[4] = (uint8_t)stimestructure.Minutes;
  Msg->Data[5] = (uint8_t)stimestructure.Seconds;
  Msg->Data[6] = sub_sec;
}

/**
 * @brief  Magnetometer Calibration data handler
 * @param  Msg the Magnetometer Calibration data part of the stream
 * @retval None
 */
static void MC_Data_Handler(TMsg *Msg)
{
  uint32_t elapsed_time_us = 0U;
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MMC_Input_t data_in;
  MMC_Output_t data_out;
[/#if]
[#if useCortexM0]
  uint32_t prev_tick = 0U;
  MMC_CM0P_Input_t data_in;
  MMC_CM0P_Output_t data_out;
[/#if]

  MOTION_SENSOR_Axes_t MagComp;

  if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
  {
    /* Convert magnetometer data from [mGauss] to [uT] */
    data_in.Mag[0] = (float)MagValue.x / 10.0f;
    data_in.Mag[1] = (float)MagValue.y / 10.0f;
    data_in.Mag[2] = (float)MagValue.z / 10.0f;

[#if (useCortexM7 || useCortexM4 || useCortexM3)]
    data_in.TimeStamp = TimeStamp * ReportInterval;
[/#if]

    /* Run Magnetometer Calibration algorithm */
    BSP_LED_On(LED2);
[#if useCortexM0]
    prev_tick = HAL_GetTick();
    MotionMC_manager_update(&data_in);
    elapsed_time_us = (HAL_GetTick() - prev_tick) * 1000;
[#else]
    DWT_Start();
    MotionMC_manager_update(&data_in);
    elapsed_time_us = DWT_Stop();
[/#if]
    BSP_LED_Off(LED2);

    /* Get the magnetometer compensation for hard/soft iron */
    MotionMC_manager_get_params(&data_out);

    /* Do hard & soft iron calibration */
    MotionMC_manager_compensate(&MagValue, &MagComp);

    /* Hard iron coefficients */
    Serialize_s32(&Msg->Data[55], (int32_t)mag_val_to_mGauss(data_out.HI_Bias[0]), 4);
    Serialize_s32(&Msg->Data[59], (int32_t)mag_val_to_mGauss(data_out.HI_Bias[1]), 4);
    Serialize_s32(&Msg->Data[63], (int32_t)mag_val_to_mGauss(data_out.HI_Bias[2]), 4);

    /* Soft iron coeficients */
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
    FloatToArray(&Msg->Data[67], data_out.SF_Matrix[0][0]);
    FloatToArray(&Msg->Data[71], data_out.SF_Matrix[0][1]);
    FloatToArray(&Msg->Data[75], data_out.SF_Matrix[0][2]);

    FloatToArray(&Msg->Data[79], data_out.SF_Matrix[1][0]);
    FloatToArray(&Msg->Data[83], data_out.SF_Matrix[1][1]);
    FloatToArray(&Msg->Data[87], data_out.SF_Matrix[1][2]);

    FloatToArray(&Msg->Data[91], data_out.SF_Matrix[2][0]);
    FloatToArray(&Msg->Data[95], data_out.SF_Matrix[2][1]);
    FloatToArray(&Msg->Data[99], data_out.SF_Matrix[2][2]);
[/#if]
[#if useCortexM0]
    FloatToArray(&Msg->Data[67], data_out.SI_Matrix[0][0]);
    FloatToArray(&Msg->Data[71], data_out.SI_Matrix[0][1]);
    FloatToArray(&Msg->Data[75], data_out.SI_Matrix[0][2]);

    FloatToArray(&Msg->Data[79], data_out.SI_Matrix[1][0]);
    FloatToArray(&Msg->Data[83], data_out.SI_Matrix[1][1]);
    FloatToArray(&Msg->Data[87], data_out.SI_Matrix[1][2]);

    FloatToArray(&Msg->Data[91], data_out.SI_Matrix[2][0]);
    FloatToArray(&Msg->Data[95], data_out.SI_Matrix[2][1]);
    FloatToArray(&Msg->Data[99], data_out.SI_Matrix[2][2]);
[/#if]

    /* Calibrated data */
    /* NOTE: Magnetometer data unit is [mGauss] */
    Serialize_s32(&Msg->Data[103], (int32_t)MagComp.x, 4);
    Serialize_s32(&Msg->Data[107], (int32_t)MagComp.y, 4);
    Serialize_s32(&Msg->Data[111], (int32_t)MagComp.z, 4);

    /* Calibration quality */
    Serialize_s32(&Msg->Data[115], (int32_t)data_out.CalQuality, 4);

    Serialize_s32(&Msg->Data[119], (int32_t)elapsed_time_us, 4);
  }
}

/**
 * @brief  Handles the ACC axes data getting/sending
 * @param  Msg the ACC part of the stream
 * @retval None
 */
static void Accelero_Sensor_Handler(TMsg *Msg)
{
  MOTION_SENSOR_Axes_t acc_value;

  if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
  {
    BSP_SENSOR_ACC_GetAxes(&acc_value);
    Serialize_s32(&Msg->Data[19], (int32_t)acc_value.x, 4);
    Serialize_s32(&Msg->Data[23], (int32_t)acc_value.y, 4);
    Serialize_s32(&Msg->Data[27], (int32_t)acc_value.z, 4);
  }
}

/**
 * @brief  Handles the GYR axes data getting/sending
 * @param  Msg the GYR part of the stream
 * @retval None
 */
static void Gyro_Sensor_Handler(TMsg *Msg)
{
  MOTION_SENSOR_Axes_t gyr_value;

  if ((SensorsEnabled & GYROSCOPE_SENSOR) == GYROSCOPE_SENSOR)
  {
    BSP_SENSOR_GYR_GetAxes(&gyr_value);
    Serialize_s32(&Msg->Data[31], gyr_value.x, 4);
    Serialize_s32(&Msg->Data[35], gyr_value.y, 4);
    Serialize_s32(&Msg->Data[39], gyr_value.z, 4);
  }
}

/**
 * @brief  Handles the MAG axes data getting/sending
 * @param  Msg the MAG part of the stream
 * @retval None
 */
static void Magneto_Sensor_Handler(TMsg *Msg)
{
  if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
  {
    BSP_SENSOR_MAG_GetAxes(&MagValue);
    Serialize_s32(&Msg->Data[43], MagValue.x, 4);
    Serialize_s32(&Msg->Data[47], MagValue.y, 4);
    Serialize_s32(&Msg->Data[51], MagValue.z, 4);
  }
}

/**
 * @brief  Handles the PRESS sensor data getting/sending.
 * @param  Msg the PRESS part of the stream
 * @retval None
 */
static void Pressure_Sensor_Handler(TMsg *Msg)
{
  float press_value;

  if ((SensorsEnabled & PRESSURE_SENSOR) == PRESSURE_SENSOR)
  {
    BSP_SENSOR_PRESS_GetValue(&press_value);
    (void)memcpy(&Msg->Data[7], (void *)&press_value, sizeof(float));
  }
}

/**
 * @brief  Handles the TEMP axes data getting/sending
 * @param  Msg the TEMP part of the stream
 * @retval None
 */
static void Temperature_Sensor_Handler(TMsg *Msg)
{
  float temp_value;

  if ((SensorsEnabled & TEMPERATURE_SENSOR) == TEMPERATURE_SENSOR)
  {
    BSP_SENSOR_TEMP_GetValue(&temp_value);
    (void)memcpy(&Msg->Data[11], (void *)&temp_value, sizeof(float));
  }
}

/**
 * @brief  Handles the HUM axes data getting/sending
 * @param  Msg the HUM part of the stream
 * @retval None
 */
static void Humidity_Sensor_Handler(TMsg *Msg)
{
  float hum_value;

  if ((SensorsEnabled & HUMIDITY_SENSOR) == HUMIDITY_SENSOR)
  {
    BSP_SENSOR_HUM_GetValue(&hum_value);
    (void)memcpy(&Msg->Data[15], (void *)&hum_value, sizeof(float));;
  }
}

/**
 * @brief  Timer configuration
 * @param  Freq the desired Timer frequency
 * @retval None
 */
static void TIM_Config(uint32_t Freq)
{
  const uint32_t tim_counter_clock = 2000; /* TIM counter clock 2 kHz */
  uint32_t prescaler_value = (uint32_t)((SystemCoreClock / tim_counter_clock) - 1);
  uint32_t period = (tim_counter_clock / Freq) - 1;

  BSP_IP_TIM_Handle.Init.Prescaler         = prescaler_value;
  BSP_IP_TIM_Handle.Init.CounterMode       = TIM_COUNTERMODE_UP;
  BSP_IP_TIM_Handle.Init.Period            = period;
  BSP_IP_TIM_Handle.Init.ClockDivision     = TIM_CLOCKDIVISION_DIV1;
  BSP_IP_TIM_Handle.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;

  if (HAL_TIM_Base_Init(&BSP_IP_TIM_Handle) != HAL_OK)
  {
    Error_Handler();
  }
}

#ifdef BSP_IP_MEMS_INT1_PIN_NUM
/**
 * @brief  Force MEMS INT1 pin low
 * @param  None
 * @retval None
 */
static void MEMS_INT1_Force_Low(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  GPIO_InitStruct.Pin = BSP_IP_MEMS_INT1_PIN_NUM;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(BSP_IP_MEMS_INT1_GPIOX, &GPIO_InitStruct);

  HAL_GPIO_WritePin(BSP_IP_MEMS_INT1_GPIOX, BSP_IP_MEMS_INT1_PIN_NUM, GPIO_PIN_RESET);
}

/**
 * @brief  Configure MEMS INT1 pin to the default state
 * @param  None
 * @retval None
 */
static void MEMS_INT1_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  GPIO_InitStruct.Pin = BSP_IP_MEMS_INT1_PIN_NUM;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(BSP_IP_MEMS_INT1_GPIOX, &GPIO_InitStruct);
}
#endif

[#if !useCortexM0]
/**
 * @brief  Start counting clock cycles
 * @param  None
 * @retval None
 */
static void DWT_Start(void)
{
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  DWT->CYCCNT = 0; /* Clear count of clock cycles */
  DWT->CTRL |= 1;  /* Enable counter */
}

/**
 * @brief  Stop counting clock cycles and calculate elapsed time in [us]
 * @param  None
 * @retval Elapsed time in [us]
 */
static uint32_t DWT_Stop(void)
{
  volatile uint32_t cycles_count = 0U;
  uint32_t system_core_clock_mhz = 0U;

  DWT->CTRL = DWT->CTRL ^ 1;  /* Disable counter */
  cycles_count = DWT->CYCCNT; /* Read count of clock cycles */

  /* Calculate elapsed time in [us] */
  system_core_clock_mhz = SystemCoreClock / 1000000U;
  return cycles_count / system_core_clock_mhz;
}
[/#if]
