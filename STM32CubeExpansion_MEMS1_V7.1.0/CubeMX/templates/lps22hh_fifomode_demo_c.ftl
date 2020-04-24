[#ftl]

/**
  * @brief  Initialize the LPS22HH FIFO Mode application
  * @retval None
  */
void MX_LPS22HH_FIFOMode_Init(void)
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

  /* Sensor init */
  (void)CUSTOM_ENV_SENSOR_Init(CUSTOM_LPS22HH_0, ENV_PRESSURE | ENV_TEMPERATURE);

  /* Configure LPS22HH sensor for the DEMO application */
  if (LPS22HH_FIFO_Demo_Config() != BSP_ERROR_NONE)
  {
    Error_Handler();
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n------ LPS22HH FIFO Mode DEMO ------\r\n\r\n");
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
  * @brief  Process of the LPS22HH FIFO Mode application
  * @retval None
  */
void MX_LPS22HH_FIFOMode_Process(void)
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

    /* Change this variable only if DemoFifoStatus is STATUS_IDLE */
    if (DemoFifoStatus == STATUS_IDLE)
    {
      DemoFifoStatus = STATUS_SET_FIFO_MODE;
    }
  }

  /* Handle DEMO State Machine */
  switch (DemoFifoStatus)
  {
    case STATUS_IDLE:
      break;

    case STATUS_SET_FIFO_MODE:
      Print_Configuration();
      if (LPS22HH_FIFO_Set_FIFO_Mode() != BSP_ERROR_NONE)
      {
        Error_Handler();
      }
      DemoFifoStatus = STATUS_FIFO_RUN;
      break;

    case STATUS_FIFO_RUN:
      /* Get num of unread FIFO samples before reading data */
      if (CUSTOM_ENV_SENSOR_FIFO_Get_Num_Samples(CUSTOM_LPS22HH_0, &num_samples) != BSP_ERROR_NONE)
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
      }
      break;

    case STATUS_FIFO_DOWNLOAD:
      /* Go to Error Handler if INT1 and FIFO STATUS Register aren't coherent */

     /* Read FIFO_STATUS1 to update FIFO_STATUS2 */
     if (CUSTOM_ENV_SENSOR_FIFO_Get_Num_Samples(CUSTOM_LPS22HH_0, &num_samples) != BSP_ERROR_NONE)
     {
       Error_Handler();
     }

     if (((FIFO_INTERRUPT == FIFO_INTERRUPT_FULL)
           && (CUSTOM_ENV_SENSOR_FIFO_Get_Full_Status(CUSTOM_LPS22HH_0, &fifo_flag) != BSP_ERROR_NONE)) ||
          ((FIFO_INTERRUPT == FIFO_INTERRUPT_THRESHOLD)
           && (CUSTOM_ENV_SENSOR_FIFO_Get_Fth_Status(CUSTOM_LPS22HH_0, &fifo_flag) != BSP_ERROR_NONE)))
      {
        Error_Handler();
      }

      /* fifo_flag is 1 only if the flag in LPS22HH status register and the selected FIFO_INTERRUPT event
      are coherent */
      if (fifo_flag == 1U)
      {
        BSP_LED_On(LED2);
        if (LPS22HH_Read_All_FIFO_Data() != BSP_ERROR_NONE)
        {
          Error_Handler();
        }
        BSP_LED_Off(LED2);
        DemoFifoStatus = STATUS_SET_FIFO_BYPASS_MODE;
      }
      break;

    case STATUS_SET_FIFO_BYPASS_MODE:
      if (LPS22HH_FIFO_Set_Bypass_Mode() != BSP_ERROR_NONE)
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
static int32_t LPS22HH_FIFO_Demo_Config(void)
{
  int32_t ret;

  if ((ret = CUSTOM_ENV_SENSOR_SetOutputDataRate(CUSTOM_LPS22HH_0, ENV_PRESSURE, SAMPLE_ODR)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Reset FIFO MODE register (in order to avoid multiple event interrupt configured) */
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Reset_Interrupt(CUSTOM_LPS22HH_0, (uint8_t)FIFO_INTERRUPT_THRESHOLD)) != BSP_ERROR_NONE)
  {
    return ret;
  }
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Reset_Interrupt(CUSTOM_LPS22HH_0, (uint8_t)FIFO_INTERRUPT_FULL)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Enable FIFO stop on watermark */
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Stop_On_Watermark(CUSTOM_LPS22HH_0, PROPERTY_DISABLE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Set FIFO INTERRUPT on INT1 */
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Set_Interrupt(CUSTOM_LPS22HH_0, (uint8_t)FIFO_INTERRUPT)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  if (FIFO_INTERRUPT == FIFO_INTERRUPT_THRESHOLD)
  {
    /* Set FIFO watermark */
    if ((ret = CUSTOM_ENV_SENSOR_FIFO_Set_Watermark_Level(CUSTOM_LPS22HH_0, FIFO_WATERMARK)) != BSP_ERROR_NONE)
    {
      return ret;
    }

    /* Enable FIFO stop on watermark */
    if ((ret = CUSTOM_ENV_SENSOR_FIFO_Stop_On_Watermark(CUSTOM_LPS22HH_0, PROPERTY_ENABLE)) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }
  else
  {
    /* Reset FIFO watermark */
    if ((ret = CUSTOM_ENV_SENSOR_FIFO_Set_Watermark_Level(CUSTOM_LPS22HH_0, 0)) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  return ret;
}

/**
  * @brief  Set FIFO bypass mode
  * @retval BSP status
  */
static int32_t LPS22HH_FIFO_Set_Bypass_Mode(void)
{
  int32_t ret;

  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Set_Mode(CUSTOM_LPS22HH_0, (uint8_t)LPS22HH_BYPASS_MODE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "Press USER button to start the DEMO...\r\n");
  printf("%s", dataOut);

  return ret;
}

/**
  * @brief  Set FIFO to FIFO mode
  * @retval BSP status
  */
static int32_t LPS22HH_FIFO_Set_FIFO_Mode(void)
{
  int32_t ret;

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nLPS22HH starts to store the data into FIFO...\r\n\r\n");
  printf("%s", dataOut);

  HAL_Delay(1000);

  /* Set FIFO mode to FIFO */
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Set_Mode(CUSTOM_LPS22HH_0, (uint8_t)LPS22HH_FIFO_MODE)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  return ret;
}

/**
  * @brief  Read all unread FIFO data in cycle
  * @retval BSP status
  */
static int32_t LPS22HH_Read_All_FIFO_Data(void)
{
  uint8_t samples_to_read = 0;
  uint8_t i;
  int32_t ret;
  float pressure = 0.0f;
  float temperature = 0.0f;
  displayFloatToInt_t out_value;

  /* Get num of unread FIFO samples before reading data */
  if ((ret = CUSTOM_ENV_SENSOR_FIFO_Get_Num_Samples(CUSTOM_LPS22HH_0, &samples_to_read)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n\r\n%d samples in FIFO.\r\n\r\nStarted downloading data from FIFO...\r\n\r\n", samples_to_read);
  printf("%s", dataOut);

  HAL_Delay(1000);

   (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n[DATA ###]  PRESS    TEMP\r\n");
  printf("%s", dataOut);

  for (i = 0; i < samples_to_read; i++)
  {
    /* Read single FIFO data (pressure and temperature) */
    if ((ret = CUSTOM_ENV_SENSOR_FIFO_Get_Data(CUSTOM_LPS22HH_0, &pressure, &temperature)) != BSP_ERROR_NONE)
    {
      return ret;
    }

    floatToInt(pressure, &out_value, 2);
    (void)snprintf(dataOut, MAX_BUF_SIZE, "[DATA %3d]  %d.%02d", i + 1U, (int)out_value.out_int, (int)out_value.out_dec);
    printf("%s", dataOut);
    fflush(stdout);

    floatToInt(temperature, &out_value, 2);
    (void)snprintf(dataOut, MAX_BUF_SIZE, "  %c%d.%02d\r\n", ((out_value.sign > 0) ? '-' : '+'), (int)out_value.out_int, (int)out_value.out_dec);
    printf("%s", dataOut);
  }

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nFIFO download completed.\r\n\r\n");
  printf("%s", dataOut);

  return ret;
}

/**
  * @brief  Print current configuration
  * @retval None
  */
static void Print_Configuration(void)
{
  switch (FIFO_INTERRUPT)
  {
    /* MISRA C-2012 rule 2.1a says this case is unreachable but it depends on interrupt selected from FIFO_INTERRUPT_t
       enum by the user */
    case FIFO_INTERRUPT_FULL:
      (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nFIFO INTERRUPT: FULL\r\n");
      break;

    case FIFO_INTERRUPT_THRESHOLD:
      (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nFIFO INTERRUPT: THRESHOLD\r\n");
      break;

    default:
      break;
  }
  printf("%s", dataOut);
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

  in = in + (0.5 / pow(10, dec_prec));
  out_value->out_int = (int32_t)in;
  in = in - (float)(out_value->out_int);
  out_value->out_dec = (int32_t)trunc(in * pow(10, dec_prec));
}
