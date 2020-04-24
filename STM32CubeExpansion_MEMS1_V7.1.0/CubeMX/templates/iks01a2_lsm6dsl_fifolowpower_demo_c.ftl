[#ftl]

/**
  * @brief  Initialize the LSM6DSL FIFO Low Power application
  * @retval None
  */
void MX_IKS01A2_LSM6DSL_FIFOLowPower_Init(void)
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

  (void)IKS01A2_MOTION_SENSOR_Init(IKS01A2_LSM6DSL_0, MOTION_ACCELERO);

  /* Configure LSM6DSL sensor for the DEMO application */
  if (LSM6DSL_FIFO_Demo_Config() != BSP_ERROR_NONE)
  {
    Error_Handler();
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n------ LSM6DSL FIFO Low Power DEMO ------\r\n");
  printf("%s", dataOut);

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nPress USER button to start the DEMO ...\r\n");
  printf("%s", dataOut);

  /* Wait for USER BUTTON push */
  Sleep_Mode();
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
  * @brief  Process of the LSM6DSL FIFO Low Power application
  * @retval None
  */
void MX_IKS01A2_LSM6DSL_FIFOLowPower_Process(void)
{
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

    /* _NOTE_: Pushing button creates interrupt/event and wakes up MCU from sleep mode */
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nNucleo processor is waking up ...\r\n");
    printf("%s", dataOut);
  }

  if (MemsEventDetected == 1U)
  {
    MemsEventDetected = 0;
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n\r\n\r\nReceived FIFO Threshold Interrupt on INT1 pin ...\r\n\r\nNucleo processor is waking up ...\r\n");
    printf("%s", dataOut);
    DemoFifoStatus = STATUS_MEMS_EVENT_DETECTED;
  }

  /* Handle DEMO State Machine */
  switch (DemoFifoStatus)
  {
    case STATUS_MEMS_EVENT_DETECTED:
      /* Check if FIFO is full */
      if (IKS01A2_MOTION_SENSOR_FIFO_Get_Full_Status(IKS01A2_LSM6DSL_0, &fifo_full_status) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      if (fifo_full_status == 1U)
      {
        DemoFifoStatus = STATUS_FIFO_DOWNLOAD;
      }
      else
      {
        DemoFifoStatus = STATUS_SLEEP;
      }
      break;

    case STATUS_FIFO_DOWNLOAD:
      BSP_LED_On(LED2);
      if (LSM6DSL_Read_All_FIFO_Data() != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      BSP_LED_Off(LED2);
      /* Reset FIFO by setting FIFO mode to Bypass */
      if (IKS01A2_MOTION_SENSOR_FIFO_Set_Mode(IKS01A2_LSM6DSL_0, (uint8_t)LSM6DSL_BYPASS_MODE) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      DemoFifoStatus = STATUS_SLEEP;
      break;

    case STATUS_SLEEP:
      (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nNucleo processor is entering sleep mode while LSM6DSL is storing data into FIFO ...\r\n");
      printf("%s", dataOut);
      /* Set FIFO mode to FIFO */
      if (IKS01A2_MOTION_SENSOR_FIFO_Set_Mode(IKS01A2_LSM6DSL_0, (uint8_t)LSM6DSL_FIFO_MODE) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      Sleep_Mode();
      break;

    default:
      Error_Handler();
      break;
  }
}

/**
  * @brief  Enter sleep mode and wait for interrupt
  * @retval None
  */
static void Sleep_Mode(void)
{
  SysTick->CTRL &= ~SysTick_CTRL_TICKINT_Msk; /* Systick IRQ OFF */
  HAL_PWR_EnterSLEEPMode(PWR_MAINREGULATOR_ON, PWR_SLEEPENTRY_WFI);
  SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk; /* Systick IRQ ON */
}

/**
  * @brief  Configure FIFO
  * @retval BSP status
  */
static int32_t LSM6DSL_FIFO_Demo_Config(void)
{
  int32_t ret;

  if ((ret = IKS01A2_MOTION_SENSOR_SetOutputDataRate(IKS01A2_LSM6DSL_0, MOTION_ACCELERO, LSM6DSL_SAMPLE_ODR)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set accelero FIFO decimation */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Set_Decimation(IKS01A2_LSM6DSL_0, MOTION_ACCELERO, (uint8_t)LSM6DSL_FIFO_XL_NO_DEC)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO ODR to highest value */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Set_ODR_Value(IKS01A2_LSM6DSL_0, LSM6DSL_FIFO_MAX_ODR)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO_FULL on INT1 */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Set_INT1_FIFO_Full(IKS01A2_LSM6DSL_0, ENABLE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO watermark */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Set_Watermark_Level(IKS01A2_LSM6DSL_0, FIFO_WATERMARK)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO depth to be limited to watermark threshold level  */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Set_Stop_On_Fth(IKS01A2_LSM6DSL_0, ENABLE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  return ret;
}

/**
  * @brief  Read all unread FIFO data in cycle
  * @retval BSP status
  */
static int32_t LSM6DSL_Read_All_FIFO_Data(void)
{
  uint16_t samples_to_read = 0;
  uint16_t i;
  int32_t ret;

  /* Get num of unread FIFO samples before reading data */
  if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Get_Num_Samples(IKS01A2_LSM6DSL_0, &samples_to_read)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* 'samples_to_read' actually contains number of words in FIFO but each FIFO sample (data set) consists of 3 words
  so the 'samples_to_read' has to be divided by 3 */
  samples_to_read /= 3U;

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n%d samples in FIFO.\r\n\r\nStarted downloading data from FIFO...\r\n", samples_to_read);
  printf("%s", dataOut);

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n[DATA ##]  ACC_X  ACC_Y  ACC_Z  [mg]\r\n");
  printf("%s", dataOut);

  for (i = 0; i < samples_to_read; i++)
  {
    if ((ret = LSM6DSL_Read_Single_FIFO_Pattern_Cycle(i)) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  if (samples_to_read > SAMPLE_LIST_MAX)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nSample list limited to: %d\r\n", SAMPLE_LIST_MAX);
    printf("%s", dataOut);
  }

  return ret;
}

/**
  * @brief  Read single FIFO pattern cycle
  * @param  SampleIndex Current sample index.
  * @retval BSP status
  */
static int32_t LSM6DSL_Read_Single_FIFO_Pattern_Cycle(uint16_t SampleIndex)
{
  uint16_t pattern = 0;
  int32_t acceleration = 0;
  int32_t acc_x = 0, acc_y = 0, acc_z = 0;
  int32_t ret = BSP_ERROR_NONE;
  int i;

  /* Read one whole FIFO pattern cycle. Pattern: XLx, XLy, XLz */
  for (i = 0; i <= 2; i++)
  {
    /* Read FIFO pattern number */
    if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Get_Pattern(IKS01A2_LSM6DSL_0, &pattern)) != BSP_ERROR_NONE)
    {
      return ret;
    }

    /* Read single FIFO data (acceleration in one axis) */
    if ((ret = IKS01A2_MOTION_SENSOR_FIFO_Get_Axis(IKS01A2_LSM6DSL_0, MOTION_ACCELERO, &acceleration)) != BSP_ERROR_NONE)
    {
      return ret;
    }

    /* Decide which axis has been read from FIFO based on pattern number */
    switch (pattern)
    {
      case PATTERN_ACC_X_AXIS:
        acc_x = acceleration;
        break;

      case PATTERN_ACC_Y_AXIS:
        acc_y = acceleration;
        break;

      case PATTERN_ACC_Z_AXIS:
        acc_z = acceleration;
        break;

      default:
        ret = BSP_ERROR_UNKNOWN_FAILURE;
        break;
    }
  }

  if (ret != BSP_ERROR_NONE)
  {
    return ret;
  }

  if (SampleIndex < SAMPLE_LIST_MAX)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "[DATA %02d]  %5ld  %5ld  %5ld\r\n", SampleIndex + 1U, acc_x, acc_y, acc_z);
    printf("%s", dataOut);
  }

  return ret;
}
