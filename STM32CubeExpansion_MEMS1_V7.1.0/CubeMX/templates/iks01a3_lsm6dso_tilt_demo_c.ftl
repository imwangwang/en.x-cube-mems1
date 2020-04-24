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
  * @brief  Initialize the LSM6DSO Tilt Detection application
  * @retval None
  */
void MX_IKS01A3_LSM6DSO_Tilt_Init(void)
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

  IKS01A3_MOTION_SENSOR_Init(IKS01A3_LSM6DSO_0, MOTION_ACCELERO | MOTION_GYRO);
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
  * @brief  Process of the LSM6DSO Tilt Detection application
  * @retval None
  */
void MX_IKS01A3_LSM6DSO_Tilt_Process(void)
{
  IKS01A3_MOTION_SENSOR_Event_Status_t status;

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

    /* Toggle enable/disable tilt detection */
    if (TiltEnabled != 0U)
    {
      TiltDisableRequest = 1;
    }
    else
    {
      TiltEnableRequest = 1;
    }
  }

  if (MemsEventDetected != 0U)
  {
    MemsEventDetected = 0;

    if (IKS01A3_MOTION_SENSOR_Get_Event_Status(IKS01A3_LSM6DSO_0, &status) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

    if (status.TiltStatus != 0U)
    {
      BSP_LED_On(LED2);
      HAL_Delay(INDICATION_DELAY);
      BSP_LED_Off(LED2);
    }
  }

  if (TiltEnableRequest != 0U)
  {
[#if LSM6DSO_EVENT1_value == "INT1"][#-- ####################################### --]
    if (IKS01A3_MOTION_SENSOR_Enable_Tilt_Detection(IKS01A3_LSM6DSO_0, IKS01A3_MOTION_SENSOR_INT1_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
[#if LSM6DSO_EVENT1_value == "INT2"][#-- ####################################### --]
    if (IKS01A3_MOTION_SENSOR_Enable_Tilt_Detection(IKS01A3_LSM6DSO_0, IKS01A3_MOTION_SENSOR_INT2_PIN) != BSP_ERROR_NONE)
[/#if][#-- ################################################################# --]
    {
      Error_Handler();
    }

    TiltEnabled = 1;
    TiltEnableRequest = 0;
  }

  if (TiltDisableRequest != 0U)
  {
    if (IKS01A3_MOTION_SENSOR_Disable_Tilt_Detection(IKS01A3_LSM6DSO_0) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }

    TiltEnabled = 0;
    TiltDisableRequest = 0;
  }
}
