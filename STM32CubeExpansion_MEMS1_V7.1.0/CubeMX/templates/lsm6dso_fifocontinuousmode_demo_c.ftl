[#ftl]

/**
  * @brief  Initialize the LSM6DSO FIFO Continuous Mode application
  * @retval None
  */
void MX_LSM6DSO_FIFOContinuousMode_Init(void)
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

  (void)CUSTOM_MOTION_SENSOR_Init(CUSTOM_LSM6DSO_0, MOTION_GYRO);

  /* Configure LSM6DSO sensor for the DEMO application */
  if (LSM6DSO_FIFO_Demo_Config() != BSP_ERROR_NONE)
  {
    Error_Handler();
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n------ LSM6DSO FIFO Continuous Mode DEMO ------\r\n");
  printf("%s", dataOut);
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
  * @brief  Process of the LSM6DSO FIFO Continuous Mode application
  * @retval None
  */
void MX_LSM6DSO_FIFOContinuousMode_Process(void)
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

    switch (DemoFifoStatus)
    {
      /* If FIFO is in Bypass mode switch to Continuous mode */
      case STATUS_IDLE:
        DemoFifoStatus = STATUS_SET_FIFO_CONTINUOUS_MODE;
        break;
      /* If FIFO is in Continuous mode switch to Bypass mode */
      case STATUS_FIFO_RUN:
        DemoFifoStatus = STATUS_SET_FIFO_BYPASS_MODE;
        break;
      /* Otherwise do nothing */
      case STATUS_SET_FIFO_CONTINUOUS_MODE:
      case STATUS_FIFO_DOWNLOAD:
      case STATUS_SET_FIFO_BYPASS_MODE:
        break;
      default:
        Error_Handler();
        break;
    }
  }

  /* Handle DEMO State Machine */
  switch (DemoFifoStatus)
  {
    case STATUS_IDLE:
      break;

    case STATUS_SET_FIFO_CONTINUOUS_MODE:
      if (LSM6DSO_FIFO_Set_Continuous_Mode() != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      DemoFifoStatus = STATUS_FIFO_RUN;
      break;

    case STATUS_FIFO_RUN:
      /* Get num of unread FIFO samples before reading data */
      if (CUSTOM_MOTION_SENSOR_FIFO_Get_Num_Samples(CUSTOM_LSM6DSO_0, &num_samples) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }

      /* Print dot realtime whenever new data is stored in FIFO */
      if (num_samples != prev_num_samples)
      {
        prev_num_samples = num_samples;
        (void)snprintf(dataOut, MAX_BUF_SIZE, ".");
        printf("%s", dataOut);
        fflush(stdout);
      }
      if (MemsEventDetected == 1U)
      {
        DemoFifoStatus = STATUS_FIFO_DOWNLOAD;
        MemsEventDetected = 0;
      }
      break;

    case STATUS_FIFO_DOWNLOAD:
      /* Print data if FIFO is full */
      if (CUSTOM_MOTION_SENSOR_FIFO_Get_Full_Status(CUSTOM_LSM6DSO_0, &fifo_full_status) != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      if (fifo_full_status == 1U)
      {
        BSP_LED_On(LED2);
        if (LSM6DSO_Read_All_FIFO_Data() != BSP_ERROR_NONE)
        {
          Error_Handler();
        }
        BSP_LED_Off(LED2);
        DemoFifoStatus = STATUS_FIFO_RUN;
      }
      break;

    case STATUS_SET_FIFO_BYPASS_MODE:
      if (LSM6DSO_FIFO_Set_Bypass_Mode() != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      MemsEventDetected = 0;
      num_samples = 0;
      prev_num_samples = 0;
      DemoFifoStatus = STATUS_IDLE;
      break;

    default:
      Error_Handler();
      break;
  }
}

/**
  * @brief  Configure FIFO
  * @retval BSP status
  */
static int32_t LSM6DSO_FIFO_Demo_Config(void)
{
  int32_t ret;

  if ((ret = CUSTOM_MOTION_SENSOR_SetOutputDataRate(CUSTOM_LSM6DSO_0, MOTION_GYRO, LSM6DSO_SAMPLE_ODR)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO gyro batch data rate to equal or higher value than gyro ODR */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_BDR(CUSTOM_LSM6DSO_0, MOTION_GYRO, LSM6DSO_XL_BATCHED_AT_6667Hz)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO_FULL on INT1 */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_INT1_FIFO_Full(CUSTOM_LSM6DSO_0, ENABLE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO watermark */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_Watermark_Level(CUSTOM_LSM6DSO_0, FIFO_WATERMARK)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO depth to be limited to watermark threshold level  */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_Stop_On_Fth(CUSTOM_LSM6DSO_0, ENABLE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  return ret;
}

/**
  * @brief  Set FIFO bypass mode
  * @retval BSP status
  */
static int32_t LSM6DSO_FIFO_Set_Bypass_Mode(void)
{
  int32_t ret;

  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_Mode(CUSTOM_LSM6DSO_0, (uint8_t)LSM6DSO_BYPASS_MODE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nFIFO is stopped in Bypass mode.\r\n");
  printf("%s", dataOut);

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nPress USER button to start the DEMO...\r\n");
  printf("%s", dataOut);

  return ret;
}

/**
  * @brief  Set FIFO to Continuous mode
  * @retval BSP status
  */
static int32_t LSM6DSO_FIFO_Set_Continuous_Mode(void)
{
  int32_t ret;

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nLSM6DSO starts to store the data into FIFO...\r\n\r\n");
  printf("%s", dataOut);

  HAL_Delay(1000);

  /* Set FIFO mode to Continuous */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Set_Mode(CUSTOM_LSM6DSO_0, (uint8_t)LSM6DSO_STREAM_MODE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  return ret;
}

/**
  * @brief  Read all unread FIFO data in cycle
  * @retval BSP status
  */
static int32_t LSM6DSO_Read_All_FIFO_Data(void)
{
  uint16_t samples_to_read = 0;
  uint16_t i;
  int32_t ret;

  /* Get num of unread FIFO samples before reading data */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Get_Num_Samples(CUSTOM_LSM6DSO_0, &samples_to_read)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n\r\n%d samples in FIFO.\r\n\r\nStarted downloading data from FIFO...\r\n\r\n", samples_to_read);
  printf("%s", dataOut);

  (void)snprintf(dataOut, MAX_BUF_SIZE, "[DATA ##]     GYR_X     GYR_Y     GYR_Z\r\n");
  printf("%s", dataOut);

  for (i = 0; i < samples_to_read; i++)
  {
    if ((ret = LSM6DSO_Read_Single_FIFO_Data(i)) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  if (samples_to_read > SAMPLE_LIST_MAX)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nSample list limited to: %d\r\n\r\n", SAMPLE_LIST_MAX);
    printf("%s", dataOut);
  }

  return ret;
}

/**
  * @brief  Read single FIFO data
  * @param  SampleIndex Current sample index.
  * @retval BSP status
  */
static int32_t LSM6DSO_Read_Single_FIFO_Data(uint16_t SampleIndex)
{
  CUSTOM_MOTION_SENSOR_Axes_t angular_velocity;
  int32_t ret = BSP_ERROR_NONE;

  /* Read single FIFO data (angular velocity in all 3 axes) */
  if ((ret = CUSTOM_MOTION_SENSOR_FIFO_Get_Axes(CUSTOM_LSM6DSO_0, MOTION_GYRO, &angular_velocity)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  if (ret != BSP_ERROR_NONE)
  {
    return ret;
  }

  if (SampleIndex < SAMPLE_LIST_MAX)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "[DATA %02d]  %8ld  %8ld  %8ld\r\n", SampleIndex + 1U, angular_velocity.x, angular_velocity.y, angular_velocity.z);
    printf("%s", dataOut);
  }

  return ret;
}
