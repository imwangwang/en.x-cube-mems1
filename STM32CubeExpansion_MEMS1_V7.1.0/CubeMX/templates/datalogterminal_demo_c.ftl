[#ftl]

[#assign useBSPMotion = false]
[#assign useBSPEnv = false]
[#assign useLSM6DSL = false]
[#assign useLSM303AGR = false]
[#assign useLIS3MDL = false]
[#assign useHTS221 = false]
[#assign useLPS22HB = false]
[#assign useLSM6DSO = false]
[#assign useLIS2DW12 = false]
[#assign useLIS2MDL = false]
[#assign useLPS22HH = false]
[#assign useSTTS751 = false]
[#assign useLSM6DSOX = false]
[#assign useLPS33HW = false]
[#assign useLIS2DH12 = false]
[#assign useASM330LHH = false]
[#assign useISM330DLC = false]
[#assign useISM303DAC = false]
[#assign useIIS2DLPC = false]
[#assign useIIS2MDC = false]
[#assign useISM330DHCX = false]
[#assign useLSM6DSR = false]
[#assign useAIS2DW12 = false]
[#assign useSTTS22H = false]
[#assign useA3G4250D = false]
[#assign useAIS328DQ = false]
[#assign useAIS3624DQ = false]
[#assign useH3LIS331DL = false]
[#assign useLSM6DSRX = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("BSP_MOTION_SENSORS")]
[#assign useBSPMotion = true]
[/#if]

[#if define?contains("BSP_ENV_SENSORS")]
[#assign useBSPEnv = true]
[/#if]

[#if define?contains("LSM6DSL_ACCGYR")]
[#assign useLSM6DSL = true]
[/#if]

[#if define?contains("LSM303AGR_ACCMAG")]
[#assign useLSM303AGR = true]
[/#if]

[#if define?contains("LIS3MDL_MAG")]
[#assign useLIS3MDL = true]
[/#if]

[#if define?contains("HTS221_HUMTEMP")]
[#assign useHTS221 = true]
[/#if]

[#if define?contains("LPS22HB_PRESSTEMP")]
[#assign useLPS22HB = true]
[/#if]

[#if define?contains("LSM6DSO_ACCGYR")]
[#assign useLSM6DSO = true]
[/#if]

[#if define?contains("LIS2DW12_ACC")]
[#assign useLIS2DW12 = true]
[/#if]

[#if define?contains("LIS2MDL_MAG")]
[#assign useLIS2MDL = true]
[/#if]

[#if define?contains("LPS22HH_PRESSTEMP")]
[#assign useLPS22HH = true]
[/#if]

[#if define?contains("STTS751_TEMP")]
[#assign useSTTS751 = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR")]
[#assign useLSM6DSOX = true]
[/#if]

[#if define?contains("LPS33HW_PRESSTEMP")]
[#assign useLPS33HW = true]
[/#if]

[#if define?contains("LIS2DH12_ACC")]
[#assign useLIS2DH12 = true]
[/#if]

[#if define?contains("ASM330LHH_ACCGYR")]
[#assign useASM330LHH = true]
[/#if]

[#if define?contains("ISM330DLC_ACCGYR")]
[#assign useISM330DLC = true]
[/#if]

[#if define?contains("ISM303DAC_ACCMAG")]
[#assign useISM303DAC = true]
[/#if]

[#if define?contains("IIS2DLPC_ACC")]
[#assign useIIS2DLPC = true]
[/#if]

[#if define?contains("IIS2MDC_MAG")]
[#assign useIIS2MDC = true]
[/#if]

[#if define?contains("ISM330DHCX_ACCGYR")]
[#assign useISM330DHCX = true]
[/#if]

[#if define?contains("LSM6DSR_ACCGYR")]
[#assign useLSM6DSR = true]
[/#if]

[#if define?contains("AIS2DW12_ACC")]
[#assign useAIS2DW12 = true]
[/#if]

[#if define?contains("STTS22H_TEMP")]
[#assign useSTTS22H = true]
[/#if]

[#if define?contains("A3G4250D_GYR")]
[#assign useA3G4250D = true]
[/#if]

[#if define?contains("AIS328DQ_ACC")]
[#assign useAIS328DQ = true]
[/#if]

[#if define?contains("AIS3624DQ_ACC")]
[#assign useAIS3624DQ = true]
[/#if]

[#if define?contains("H3LIS331DL_ACC")]
[#assign useH3LIS331DL = true]
[/#if]

[#if define?contains("LSM6DSRX_ACCGYR")]
[#assign useLSM6DSRX = true]
[/#if]

[/#list]
[/#if]

/**
  * @brief  Initialize the DataLogTerminal application
  * @retval None
  */
void MX_DataLogTerminal_Init(void)
{
  displayFloatToInt_t out_value_odr;
  int i;

  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);

  /* Check what is the Push Button State when the button is not pressed. It can change across families */
  PushButtonState = (BSP_PB_GetState(BUTTON_KEY)) ?  0 : 1;

  /* Initialize Virtual COM Port */
  BSP_COM_Init(COM1);

[#if useBSPMotion]
[#if useLSM6DSL]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSL_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSL_0, MOTION_ACCELERO, LSM6DSL_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSL_0, MOTION_ACCELERO, LSM6DSL_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSL_0, MOTION_GYRO, LSM6DSL_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSL_0, MOTION_GYRO, LSM6DSL_GYRO_FS);
[/#if]

[#if useLSM303AGR]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM303AGR_ACC_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM303AGR_ACC_0, MOTION_ACCELERO, LSM303AGR_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM303AGR_ACC_0, MOTION_ACCELERO, LSM303AGR_ACC_FS);

  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM303AGR_MAG_0, MOTION_MAGNETO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM303AGR_MAG_0, MOTION_MAGNETO, LSM303AGR_MAG_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM303AGR_MAG_0, MOTION_MAGNETO, LSM303AGR_MAG_FS);
[/#if]

[#if useLIS3MDL]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS3MDL_0, MOTION_MAGNETO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LIS3MDL_0, MOTION_MAGNETO, LIS3MDL_MAG_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LIS3MDL_0, MOTION_MAGNETO, LIS3MDL_MAG_FS);
[/#if]

[#if useLSM6DSO]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSO_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSO_0, MOTION_ACCELERO, LSM6DSO_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSO_0, MOTION_ACCELERO, LSM6DSO_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSO_0, MOTION_GYRO, LSM6DSO_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSO_0, MOTION_GYRO, LSM6DSO_GYRO_FS);
[/#if]

[#if useLIS2DW12]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS2DW12_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LIS2DW12_0, MOTION_ACCELERO, LIS2DW12_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LIS2DW12_0, MOTION_ACCELERO, LIS2DW12_ACC_FS);
[/#if]

[#if useLIS2MDL]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS2MDL_0, MOTION_MAGNETO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LIS2MDL_0, MOTION_MAGNETO, LIS2MDL_MAG_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LIS2MDL_0, MOTION_MAGNETO, LIS2MDL_MAG_FS);
[/#if]

[#if useLSM6DSOX]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSOX_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSOX_0, MOTION_ACCELERO, LSM6DSOX_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSOX_0, MOTION_ACCELERO, LSM6DSOX_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSOX_0, MOTION_GYRO, LSM6DSOX_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSOX_0, MOTION_GYRO, LSM6DSOX_GYRO_FS);
[/#if]

[#if useLIS2DH12]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS2DH12_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LIS2DH12_0, MOTION_ACCELERO, LIS2DH12_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LIS2DH12_0, MOTION_ACCELERO, LIS2DH12_ACC_FS);
[/#if]

[#if useASM330LHH]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_ASM330LHH_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ASM330LHH_0, MOTION_ACCELERO, ASM330LHH_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ASM330LHH_0, MOTION_ACCELERO, ASM330LHH_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ASM330LHH_0, MOTION_GYRO, ASM330LHH_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ASM330LHH_0, MOTION_GYRO, ASM330LHH_GYRO_FS);
[/#if]

[#if useISM330DLC]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_ISM330DLC_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM330DLC_0, MOTION_ACCELERO, ISM330DLC_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM330DLC_0, MOTION_ACCELERO, ISM330DLC_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM330DLC_0, MOTION_GYRO, ISM330DLC_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM330DLC_0, MOTION_GYRO, ISM330DLC_GYRO_FS);
[/#if]

[#if useISM303DAC]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_ISM303DAC_ACC_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM303DAC_ACC_0, MOTION_ACCELERO, ISM303DAC_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM303DAC_ACC_0, MOTION_ACCELERO, ISM303DAC_ACC_FS);

  CUSTOM_MOTION_SENSOR_Init(CUSTOM_ISM303DAC_MAG_0, MOTION_MAGNETO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM303DAC_MAG_0, MOTION_MAGNETO, ISM303DAC_MAG_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM303DAC_MAG_0, MOTION_MAGNETO, ISM303DAC_MAG_FS);
[/#if]

[#if useIIS2DLPC]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_IIS2DLPC_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_IIS2DLPC_0, MOTION_ACCELERO, IIS2DLPC_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_IIS2DLPC_0, MOTION_ACCELERO, IIS2DLPC_ACC_FS);
[/#if]

[#if useIIS2MDC]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_IIS2MDC_0, MOTION_MAGNETO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_IIS2MDC_0, MOTION_MAGNETO, IIS2MDC_MAG_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_IIS2MDC_0, MOTION_MAGNETO, IIS2MDC_MAG_FS);
[/#if]

[#if useISM330DHCX]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_ISM330DHCX_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM330DHCX_0, MOTION_ACCELERO, ISM330DHCX_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM330DHCX_0, MOTION_ACCELERO, ISM330DHCX_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_ISM330DHCX_0, MOTION_GYRO, ISM330DHCX_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_ISM330DHCX_0, MOTION_GYRO, ISM330DHCX_GYRO_FS);
[/#if]

[#if useLSM6DSR]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSR_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSR_0, MOTION_ACCELERO, LSM6DSR_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSR_0, MOTION_ACCELERO, LSM6DSR_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSR_0, MOTION_GYRO, LSM6DSR_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSR_0, MOTION_GYRO, LSM6DSR_GYRO_FS);
[/#if]

[#if useAIS2DW12]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_AIS2DW12_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_AIS2DW12_0, MOTION_ACCELERO, AIS2DW12_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_AIS2DW12_0, MOTION_ACCELERO, AIS2DW12_ACC_FS);
[/#if]

[#if useA3G4250D]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_A3G4250D_0, MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_A3G4250D_0, MOTION_GYRO, A3G4250D_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_A3G4250D_0, MOTION_GYRO, A3G4250D_GYRO_FS);
[/#if]

[#if useAIS328DQ]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_AIS328DQ_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_AIS328DQ_0, MOTION_ACCELERO, AIS328DQ_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_AIS328DQ_0, MOTION_ACCELERO, AIS328DQ_ACC_FS);
[/#if]

[#if useAIS3624DQ]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_AIS3624DQ_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_AIS3624DQ_0, MOTION_ACCELERO, AIS3624DQ_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_AIS3624DQ_0, MOTION_ACCELERO, AIS3624DQ_ACC_FS);
[/#if]

[#if useH3LIS331DL]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_H3LIS331DL_0, MOTION_ACCELERO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_H3LIS331DL_0, MOTION_ACCELERO, H3LIS331DL_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_H3LIS331DL_0, MOTION_ACCELERO, H3LIS331DL_ACC_FS);
[/#if]

[#if useLSM6DSRX]
  CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSRX_0, MOTION_ACCELERO | MOTION_GYRO);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSRX_0, MOTION_ACCELERO, LSM6DSRX_ACC_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSRX_0, MOTION_ACCELERO, LSM6DSRX_ACC_FS);

  CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSRX_0, MOTION_GYRO, LSM6DSRX_GYRO_ODR);

  CUSTOM_MOTION_SENSOR_SetFullScale(CUSTOM_LSM6DSRX_0, MOTION_GYRO, LSM6DSRX_GYRO_FS);
[/#if]

  for(i = 0; i < CUSTOM_MOTION_INSTANCES_NBR; i++)
  {
    CUSTOM_MOTION_SENSOR_GetCapabilities(i, &MotionCapabilities[i]);
    snprintf(dataOut, MAX_BUF_SIZE,
             "\r\nMotion Sensor Instance %d capabilities: \r\n ACCELEROMETER: %d\r\n GYROSCOPE: %d\r\n MAGNETOMETER: %d\r\n LOW POWER: %d\r\n",
             i, MotionCapabilities[i].Acc, MotionCapabilities[i].Gyro, MotionCapabilities[i].Magneto, MotionCapabilities[i].LowPower);
    printf("%s", dataOut);
    floatToInt(MotionCapabilities[i].AccMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX ACC ODR: %d.%03d Hz, MAX ACC FS: %d\r\n", (int)out_value_odr.out_int,
             (int)out_value_odr.out_dec, (int)MotionCapabilities[i].AccMaxFS);
    printf("%s", dataOut);
    floatToInt(MotionCapabilities[i].GyroMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX GYRO ODR: %d.%03d Hz, MAX GYRO FS: %d\r\n", (int)out_value_odr.out_int,
             (int)out_value_odr.out_dec, (int)MotionCapabilities[i].GyroMaxFS);
    printf("%s", dataOut);
    floatToInt(MotionCapabilities[i].MagMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX MAG ODR: %d.%03d Hz, MAX MAG FS: %d\r\n", (int)out_value_odr.out_int,
             (int)out_value_odr.out_dec, (int)MotionCapabilities[i].MagMaxFS);
    printf("%s", dataOut);
  }
[/#if]

[#if useBSPEnv]
[#if useHTS221]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_HTS221_0, ENV_TEMPERATURE | ENV_HUMIDITY);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_HTS221_0, ENV_TEMPERATURE, HTS221_ODR);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_HTS221_0, ENV_HUMIDITY, HTS221_ODR);
[/#if]

[#if useLPS22HB]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_LPS22HB_0, ENV_TEMPERATURE | ENV_PRESSURE);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS22HB_0, ENV_TEMPERATURE, LPS22HB_ODR);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS22HB_0, ENV_PRESSURE, LPS22HB_ODR);
[/#if]

[#if useLPS22HH]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_LPS22HH_0, ENV_TEMPERATURE | ENV_PRESSURE);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS22HH_0, ENV_TEMPERATURE, LPS22HH_ODR);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS22HH_0, ENV_PRESSURE, LPS22HH_ODR);
[/#if]

[#if useSTTS751]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_STTS751_0, ENV_TEMPERATURE);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_STTS751_0, ENV_TEMPERATURE, STTS751_ODR);
[/#if]

[#if useLPS33HW]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_LPS33HW_0, ENV_TEMPERATURE | ENV_PRESSURE);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS33HW_0, ENV_TEMPERATURE, LPS33HW_ODR);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS33HW_0, ENV_PRESSURE, LPS33HW_ODR);
[/#if]

[#if useSTTS22H]
  CUSTOM_ENV_SENSOR_Init(CUSTOM_STTS22H_0, ENV_TEMPERATURE);

  CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_STTS22H_0, ENV_TEMPERATURE, STTS22H_ODR);
[/#if]

  for(i = 0; i < CUSTOM_ENV_INSTANCES_NBR; i++)
  {
    CUSTOM_ENV_SENSOR_GetCapabilities(i, &EnvCapabilities[i]);
    snprintf(dataOut, MAX_BUF_SIZE,
             "\r\nEnvironmental Sensor Instance %d capabilities: \r\n TEMPERATURE: %d\r\n PRESSURE: %d\r\n HUMIDITY: %d\r\n LOW POWER: %d\r\n",
             i, EnvCapabilities[i].Temperature, EnvCapabilities[i].Pressure, EnvCapabilities[i].Humidity, EnvCapabilities[i].LowPower);
    printf("%s", dataOut);
    floatToInt(EnvCapabilities[i].TempMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX TEMP ODR: %d.%03d Hz\r\n", (int)out_value_odr.out_int,
             (int)out_value_odr.out_dec);
    printf("%s", dataOut);
    floatToInt(EnvCapabilities[i].PressMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX PRESS ODR: %d.%03d Hz\r\n", (int)out_value_odr.out_int,
             (int)out_value_odr.out_dec);
    printf("%s", dataOut);
    floatToInt(EnvCapabilities[i].HumMaxOdr, &out_value_odr, 3);
    snprintf(dataOut, MAX_BUF_SIZE, " MAX HUM ODR: %d.%03d Hz\r\n", (int)out_value_odr.out_int, (int)out_value_odr.out_dec);
    printf("%s", dataOut);
  }
[/#if]
}

/**
  * @brief  BSP Push Button callback
  * @param  Button Specifies the pin connected EXTI line
  * @retval None.
  */
void BSP_PB_Callback(Button_TypeDef Button)
{
  PushButtonDetected = 1;
}

/**
  * @brief  Process of the DataLogTerminal application
  * @retval None
  */
void MX_DataLogTerminal_Process(void)
{
  int i;

  if (PushButtonDetected != 0U)
  {
    /* Debouncing */
    HAL_Delay(50);

    /* Wait until the button is released */
    while ((BSP_PB_GetState( BUTTON_KEY ) == PushButtonState));

    /* Debouncing */
    HAL_Delay(50);

    /* Reset Interrupt flag */
    PushButtonDetected = 0;

    /* Do nothing */
  }

[#if useBSPMotion]
  for(i = 0; i < CUSTOM_MOTION_INSTANCES_NBR; i++)
  {
    if(MotionCapabilities[i].Acc)
    {
      Accelero_Sensor_Handler(i);
    }
    if(MotionCapabilities[i].Gyro)
    {
      Gyro_Sensor_Handler(i);
    }
    if(MotionCapabilities[i].Magneto)
    {
      Magneto_Sensor_Handler(i);
    }
  }
[/#if]

[#if useBSPEnv]
  for(i = 0; i < CUSTOM_ENV_INSTANCES_NBR; i++)
  {
    if(EnvCapabilities[i].Humidity)
    {
      Hum_Sensor_Handler(i);
    }
    if(EnvCapabilities[i].Temperature)
    {
      Temp_Sensor_Handler(i);
    }
    if(EnvCapabilities[i].Pressure)
    {
      Press_Sensor_Handler(i);
    }
  }
[/#if]

  HAL_Delay( 1000 );
}

/**
  * @brief  Splits a float into two integer values.
  * @param  in the float value as input
  * @param  out_value the pointer to the output integer structure
  * @param  dec_prec the decimal precision to be used
  * @retval None
  */
static void floatToInt(float in, displayFloatToInt_t *out_value, int32_t dec_prec)
{
  if(in >= 0.0f)
  {
    out_value->sign = 0;
  }else
  {
    out_value->sign = 1;
    in = -in;
  }

  in = in + (0.5f / pow(10, dec_prec));
  out_value->out_int = (int32_t)in;
  in = in - (float)(out_value->out_int);
  out_value->out_dec = (int32_t)trunc(in * pow(10, dec_prec));
}

[#if useBSPMotion]
/**
  * @brief  Handles the accelerometer axes data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Accelero_Sensor_Handler(uint32_t Instance)
{
  float odr;
  int32_t fullScale;
  CUSTOM_MOTION_SENSOR_Axes_t acceleration;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_MOTION_SENSOR_GetAxes(Instance, MOTION_ACCELERO, &acceleration))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nACC[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nACC_X[%d]: %d, ACC_Y[%d]: %d, ACC_Z[%d]: %d\r\n", (int)Instance,
             (int)acceleration.x, (int)Instance, (int)acceleration.y, (int)Instance, (int)acceleration.z);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_MOTION_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetOutputDataRate(Instance, MOTION_ACCELERO, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetFullScale(Instance, MOTION_ACCELERO, &fullScale))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: %d g\r\n", (int)Instance, (int)fullScale);
    }

    printf("%s", dataOut);
  }
}

/**
  * @brief  Handles the gyroscope axes data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Gyro_Sensor_Handler(uint32_t Instance)
{
  float odr;
  int32_t fullScale;
  CUSTOM_MOTION_SENSOR_Axes_t angular_velocity;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_MOTION_SENSOR_GetAxes(Instance, MOTION_GYRO, &angular_velocity))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nGYR[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nGYR_X[%d]: %d, GYR_Y[%d]: %d, GYR_Z[%d]: %d\r\n", (int)Instance,
             (int)angular_velocity.x, (int)Instance, (int)angular_velocity.y, (int)Instance, (int)angular_velocity.z);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_MOTION_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetOutputDataRate(Instance, MOTION_GYRO, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetFullScale(Instance, MOTION_GYRO, &fullScale))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: %d dps\r\n", (int)Instance, (int)fullScale);
    }

    printf("%s", dataOut);
  }
}

/**
  * @brief  Handles the magneto axes data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Magneto_Sensor_Handler(uint32_t Instance)
{
  float odr;
  int32_t fullScale;
  CUSTOM_MOTION_SENSOR_Axes_t magnetic_field;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_MOTION_SENSOR_GetAxes(Instance, MOTION_MAGNETO, &magnetic_field))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nMAG[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nMAG_X[%d]: %d, MAG_Y[%d]: %d, MAG_Z[%d]: %d\r\n", (int)Instance,
             (int)magnetic_field.x, (int)Instance, (int)magnetic_field.y, (int)Instance, (int)magnetic_field.z);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_MOTION_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetOutputDataRate(Instance, MOTION_MAGNETO, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);

    if (CUSTOM_MOTION_SENSOR_GetFullScale(Instance, MOTION_MAGNETO, &fullScale))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: ERROR\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "FS[%d]: %d gauss\r\n", (int)Instance, (int)fullScale);
    }

    printf("%s", dataOut);
  }
}
[/#if]

[#if useBSPEnv]
/**
  * @brief  Handles the temperature data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Temp_Sensor_Handler(uint32_t Instance)
{
  float odr;
  float temperature;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_ENV_SENSOR_GetValue(Instance, ENV_TEMPERATURE, &temperature))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nTemp[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    floatToInt(temperature, &out_value, 2);
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nTemp[%d]: %c%d.%02d degC\r\n", (int)Instance, ((out_value.sign) ? '-' : '+'), (int)out_value.out_int,
             (int)out_value.out_dec);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_ENV_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_ENV_SENSOR_GetOutputDataRate(Instance, ENV_TEMPERATURE, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);
  }
}

/**
  * @brief  Handles the pressure sensor data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Press_Sensor_Handler(uint32_t Instance)
{
  float odr;
  float pressure;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_ENV_SENSOR_GetValue(Instance, ENV_PRESSURE, &pressure))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nPress[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    floatToInt(pressure, &out_value, 2);
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nPress[%d]: %d.%02d hPa\r\n", (int)Instance, (int)out_value.out_int,
             (int)out_value.out_dec);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_ENV_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_ENV_SENSOR_GetOutputDataRate(Instance, ENV_PRESSURE, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);
  }
}

/**
  * @brief  Handles the humidity data getting/sending
  * @param  Instance the device instance
  * @retval None
  */
static void Hum_Sensor_Handler(uint32_t Instance)
{
  float odr;
  float humidity;
  displayFloatToInt_t out_value;
  uint8_t whoami;

  if (CUSTOM_ENV_SENSOR_GetValue(Instance, ENV_HUMIDITY, &humidity))
  {
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nHum[%d]: Error\r\n", (int)Instance);
  }
  else
  {
    floatToInt(humidity, &out_value, 2);
    snprintf(dataOut, MAX_BUF_SIZE, "\r\nHum[%d]: %d.%02d %%\r\n", (int)Instance, (int)out_value.out_int,
             (int)out_value.out_dec);
  }

  printf("%s", dataOut);

  if (verbose == 1)
  {
    if (CUSTOM_ENV_SENSOR_ReadID(Instance, &whoami))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      snprintf(dataOut, MAX_BUF_SIZE, "WHOAMI[%d]: 0x%x\r\n", (int)Instance, (int)whoami);
    }

    printf("%s", dataOut);

    if (CUSTOM_ENV_SENSOR_GetOutputDataRate(Instance, ENV_HUMIDITY, &odr))
    {
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: Error\r\n", (int)Instance);
    }
    else
    {
      floatToInt(odr, &out_value, 3);
      snprintf(dataOut, MAX_BUF_SIZE, "ODR[%d]: %d.%03d Hz\r\n", (int)Instance, (int)out_value.out_int,
               (int)out_value.out_dec);
    }

    printf("%s", dataOut);
  }
}
[/#if]
