[#ftl]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LSM6DSO_EVENT1")]
      [#assign LSM6DSO_EVENT1_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]

/**
  * @brief  Initialize the LSM6DSO Single and Double Tap Detection application
  * @retval None
  */
void MX_LSM6DSO_SingleDoubleTap_Init(void)
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

  (void)CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSO_0, MOTION_ACCELERO | MOTION_GYRO);
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
  * @brief  Process of the LSM6DSO Single and Double Tap Detection application
  * @retval None
  */
void MX_LSM6DSO_SingleDoubleTap_Process(void)
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

    /* Enable/Disable single and double tap detection */
    if (mode == MODE_DEFAULT)
    {
      SingleTapModeRequest = 1;
    }
    else if (mode == MODE_SINGLE_TAP)
    {
      DoubleTapModeRequest = 1;
    }
    else
    {
      DefaultModeRequest = 1;
    }
  }

  if (MemsEventDetected != 0U)
  {
    MemsEventDetected = 0;

    if (mode == MODE_SINGLE_TAP)
    {
      if (CUSTOM_MOTION_SENSOR_Get_Event_Status(CUSTOM_LSM6DSO_0, &status) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }

      if (status.TapStatus != 0U)
      {
        BSP_LED_On(LED2);
        HAL_Delay(SINGLE_TAP_INDICATION_DELAY);
        BSP_LED_Off(LED2);
        HAL_Delay(INDICATION_WAIT_DELAY);
      }
    }
    else if (mode == MODE_DOUBLE_TAP)
    {
      if (CUSTOM_MOTION_SENSOR_Get_Event_Status(CUSTOM_LSM6DSO_0, &status) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }

      if (status.DoubleTapStatus != 0U)
      {
        BSP_LED_On(LED2);
        HAL_Delay(DOUBLE_TAP_INDICATION_DELAY);
        BSP_LED_Off(LED2);
        HAL_Delay(INDICATION_WAIT_DELAY);
        BSP_LED_On(LED2);
        HAL_Delay(DOUBLE_TAP_INDICATION_DELAY);
        BSP_LED_Off(LED2);
        HAL_Delay(INDICATION_WAIT_DELAY);
      }
    }
    else
    {
      /* Do nothing */
    }
  }

  if (SingleTapModeRequest != 0U)
  {
[#if LSM6DSO_EVENT1_value == "INT1"][#-- ####################################### --]
    if (CUSTOM_MOTION_SENSOR_Enable_Single_Tap_Detection(CUSTOM_LSM6DSO_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSO_EVENT1_value == "INT2"][#-- ####################################### --]
    if (CUSTOM_MOTION_SENSOR_Enable_Single_Tap_Detection(CUSTOM_LSM6DSO_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
    {
      Error_Handler();
    }

    mode = MODE_SINGLE_TAP;
    SingleTapModeRequest = 0;
  }

  if (DoubleTapModeRequest != 0U)
  {
    if (CUSTOM_MOTION_SENSOR_Disable_Single_Tap_Detection(CUSTOM_LSM6DSO_0) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

[#if LSM6DSO_EVENT1_value == "INT1"][#-- ####################################### --]
    if (CUSTOM_MOTION_SENSOR_Enable_Double_Tap_Detection(CUSTOM_LSM6DSO_0, CUSTOM_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSO_EVENT1_value == "INT2"][#-- ####################################### --]
    if (CUSTOM_MOTION_SENSOR_Enable_Double_Tap_Detection(CUSTOM_LSM6DSO_0, CUSTOM_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
    {
      Error_Handler();
    }

    mode = MODE_DOUBLE_TAP;
    DoubleTapModeRequest = 0;
  }

  if (DefaultModeRequest != 0U)
  {
    if (CUSTOM_MOTION_SENSOR_Disable_Double_Tap_Detection(CUSTOM_LSM6DSO_0) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

    mode = MODE_DEFAULT;
    DefaultModeRequest = 0;
  }
}