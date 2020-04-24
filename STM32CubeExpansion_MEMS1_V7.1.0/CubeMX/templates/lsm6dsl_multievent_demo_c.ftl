[#ftl]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LSM6DSL_EVENT1")]
      [#assign LSM6DSL_EVENT1_value = value]
    [/#if]

    [#if name.contains("LSM6DSL_EVENT2")]
      [#assign LSM6DSL_EVENT2_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]

/**
  * @brief  Initialize the LSM6DSL Multi Event application
  * @retval None
  */
void MX_LSM6DSL_MultiEvent_Init(void)
{
  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);

  /* Check what is the Push Button State when the button is not pressed. It can change across families */
  PushButtonState = (BSP_PB_GetState(BUTTON_KEY)) ?  0 : 1;

  /* Set EXTI settings for Interrupt A */
  set_mems_int_pin_a_exti();

  /* Set EXTI settings for Interrupt B */
  set_mems_int_pin_b_exti();

  /* Initialize Virtual COM Port */
  BSP_COM_Init(COM1);

  (void)CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSL_0, MOTION_ACCELERO | MOTION_GYRO);
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
  * @brief  Process of the LSM6DSL Multi Event application
  * @retval None
  */
void MX_LSM6DSL_MultiEvent_Process(void)
{
  CUSTOM_MOTION_SENSOR_Event_Status_t status;

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

    /* Toggle enable/disable hardware events */
    if (HwEventEnabled != 0U)
    {
      HwEventDisableRequest = 1;
    }
    else
    {
      HwEventEnableRequest = 1;
    }
  }

  if (MemsEventDetected != 0U)
  {
    MemsEventDetected = 0;

    if (CUSTOM_MOTION_SENSOR_Get_Event_Status(CUSTOM_LSM6DSL_0, &status) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

    if (status.StepStatus != 0U)
    {
      Send_Step_Count();
    }

    if (status.FreeFallStatus != 0U)
    {
      (void)snprintf(dataOut, MAX_BUF_SIZE, "Free fall detected!!!\r\n");
      printf("%s", dataOut);
    }

    if (status.TapStatus != 0U)
    {
      (void)snprintf(dataOut, MAX_BUF_SIZE, "Single Tap detected!!!\r\n");
      printf("%s", dataOut);
    }

    if (status.DoubleTapStatus != 0U)
    {
      (void)snprintf(dataOut, MAX_BUF_SIZE, "Double Tap detected!!!\r\n");
      printf("%s", dataOut);
    }

    if (status.TiltStatus != 0U)
    {
      (void)snprintf(dataOut, MAX_BUF_SIZE, "Tilt detected!!!\r\n");
      printf("%s", dataOut);
    }

    if (status.D6DOrientationStatus != 0U)
    {
      Send_Orientation();
    }

    if (status.WakeUpStatus != 0U)
    {
      (void)snprintf(dataOut, MAX_BUF_SIZE, "Wake Up detected!!!\r\n");
      printf("%s", dataOut);
    }
  }

  if (HwEventEnableRequest != 0U)
  {
    if (
           (CUSTOM_MOTION_SENSOR_Enable_Pedometer(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
[#if LSM6DSL_EVENT1_value == "INT1"][#-- ####################################### --]
        || (CUSTOM_MOTION_SENSOR_Enable_Tilt_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Free_Fall_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Single_Tap_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Double_Tap_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_6D_Orientation(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSL_EVENT1_value == "INT2"][#-- ####################################### --]
        || (CUSTOM_MOTION_SENSOR_Enable_Tilt_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Free_Fall_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Single_Tap_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_Double_Tap_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Enable_6D_Orientation(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSL_EVENT2_value == "INT1"][#-- ####################################### --]
        || (CUSTOM_MOTION_SENSOR_Enable_Wake_Up_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSL_EVENT2_value == "INT2"][#-- ####################################### --]
        || (CUSTOM_MOTION_SENSOR_Enable_Wake_Up_Detection(CUSTOM_LSM6DSL_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
       )
    {
      Error_Handler();
    }

    HwEventEnabled = 1;
    HwEventEnableRequest = 0;
  }

  if (HwEventDisableRequest != 0U)
  {
    if ((CUSTOM_MOTION_SENSOR_Disable_Pedometer(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_Tilt_Detection(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_Free_Fall_Detection(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_Single_Tap_Detection(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_Double_Tap_Detection(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_6D_Orientation(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE)
        || (CUSTOM_MOTION_SENSOR_Disable_Wake_Up_Detection(CUSTOM_LSM6DSL_0) != BSP_ERROR_NONE))
    {
      Error_Handler();
    }

    HwEventEnabled = 0;
    HwEventDisableRequest = 0;
  }
}

/**
  * @brief  Send actual 6D orientation to UART
  * @retval None
  */
static void Send_Orientation(void)
{
  uint8_t xl = 0;
  uint8_t xh = 0;
  uint8_t yl = 0;
  uint8_t yh = 0;
  uint8_t zl = 0;
  uint8_t zh = 0;

  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XL(CUSTOM_LSM6DSL_0, &xl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation XL axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XH(CUSTOM_LSM6DSL_0, &xh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation XH axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YL(CUSTOM_LSM6DSL_0, &yl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation YL axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YH(CUSTOM_LSM6DSL_0, &yh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation YH axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZL(CUSTOM_LSM6DSL_0, &zl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation ZL axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZH(CUSTOM_LSM6DSL_0, &zh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation ZH axis from LSM6DSL - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }

  if (xl == 0U && yl == 0U && zl == 0U && xh == 0U && yh == 1U && zh == 0U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  ________________  " \
                   "\r\n |                | " \
                   "\r\n |  *             | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |________________| \r\n");
  }

  else if (xl == 1U && yl == 0U && zl == 0U && xh == 0U && yh == 0U && zh == 0U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  ________________  " \
                   "\r\n |                | " \
                   "\r\n |             *  | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |________________| \r\n");
  }

  else if (xl == 0U && yl == 0U && zl == 0U && xh == 1U && yh == 0U && zh == 0U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  ________________  " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |  *             | " \
                   "\r\n |________________| \r\n");
  }

  else if (xl == 0U && yl == 1U && zl == 0U && xh == 0U && yh == 0U && zh == 0U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  ________________  " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |                | " \
                   "\r\n |             *  | " \
                   "\r\n |________________| \r\n");
  }

  else if (xl == 0U && yl == 0U && zl == 0U && xh == 0U && yh == 0U && zh == 1U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  __*_____________  " \
                   "\r\n |________________| \r\n");
  }

  else if (xl == 0U && yl == 0U && zl == 1U && xh == 0U && yh == 0U && zh == 0U)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  ________________  " \
                   "\r\n |________________| " \
                   "\r\n    *               \r\n");
  }

  else
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "None of the 6D orientation axes is set in LSM6DSL - accelerometer.\r\n");
  }

  printf("%s", dataOut);
}

/**
  * @brief  Send time stamp and step count to UART
  * @retval None
  */
static void Send_Step_Count(void)
{
  if (CUSTOM_MOTION_SENSOR_Get_Step_Count(CUSTOM_LSM6DSL_0, &StepCount) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting step count from LSM6DSL - accelerometer.\r\n");
  }
  else
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Step count: %d\r\n", StepCount);
  }

  printf("%s", dataOut);
}
