[#ftl]

/**
  * @brief  Initialize the LIS2DW12 6D Orientation application
  * @retval None
  */
void MX_LIS2DW12_6DOrientation_Init(void)
{
  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);

  /* Check what is the Push Button State when the button is not pressed. It can change across families */
  PushButtonState = (BSP_PB_GetState(BUTTON_KEY)) ?  0 : 1;

  /* Set EXTI settings for Interrupt A */
  set_mems_int_pin_a_exti();

  /* Initialize Virtual COM Port */
  BSP_COM_Init(COM1);

  (void)CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS2DW12_0, MOTION_ACCELERO);

  (void)CUSTOM_MOTION_SENSOR_Enable_6D_Orientation(CUSTOM_LIS2DW12_0, CUSTOM_MOTION_SENSOR_INT1_PIN);
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
  * @brief  Process of the LIS2DW12 6D Orientation application
  * @retval None
  */
void MX_LIS2DW12_6DOrientation_Process(void)
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

    /* Request to send actual 6D orientation */
    SendOrientationRequest  = 1;
  }

  if (SendOrientationRequest != 0U)
  {
    SendOrientationRequest = 0;

    Send_Orientation();
  }

  if (MemsEventDetected != 0U)
  {
    MemsEventDetected = 0;

    if (CUSTOM_MOTION_SENSOR_Get_Event_Status(CUSTOM_LIS2DW12_0, &status) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

    if (status.D6DOrientationStatus != 0U)
    {
      Send_Orientation();
    }
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

  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XL(CUSTOM_LIS2DW12_0, &xl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation XL axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XH(CUSTOM_LIS2DW12_0, &xh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation XH axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YL(CUSTOM_LIS2DW12_0, &yl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation YL axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YH(CUSTOM_LIS2DW12_0, &yh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation YH axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZL(CUSTOM_LIS2DW12_0, &zl) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation ZL axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }
  if (CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZH(CUSTOM_LIS2DW12_0, &zh) != BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "Error getting 6D orientation ZH axis from LIS2DW12 - accelerometer.\r\n");
    printf("%s", dataOut);
    return;
  }

  if (xl == 1U && yl == 0U && zl == 0U && xh == 0U && yh == 0U && zh == 0U)
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

  else if (xl == 0U && yl == 1U && zl == 0U && xh == 0U && yh == 0U && zh == 0U)
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

  else if (xl == 0U && yl == 0U && zl == 0U && xh == 0U && yh == 1U && zh == 0U)
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

  else if (xl == 0U && yl == 0U && zl == 0U && xh == 1U && yh == 0U && zh == 0U)
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
    (void)snprintf(dataOut, MAX_BUF_SIZE, "None of the 6D orientation axes is set in LIS2DW12 - accelerometer.\r\n");
  }

  printf("%s", dataOut);
}
