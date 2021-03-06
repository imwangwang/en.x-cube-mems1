[#ftl]

/**
  * @brief  Initialize the LIS2MDL Self Test application
  * @retval None
  */
void MX_LIS2MDL_SelfTest_Init(void)
{
  /* Initialize LED */
  BSP_LED_Init(LED2);

  /* Initialize button */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);

  /* Check what is the Push Button State when the button is not pressed. It can change across families */
  PushButtonState = (BSP_PB_GetState(BUTTON_KEY)) ?  0 : 1;

  /* Initialize Virtual COM Port */
  BSP_COM_Init(COM1);

  (void)CUSTOM_MOTION_SENSOR_Init(CUSTOM_LIS2MDL_0, MOTION_MAGNETO);

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n------ LIS2MDL self-test DEMO ------\r\n");
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
  * @brief  Process of the LIS2MDL Self Test application
  * @retval None
  */
void MX_LIS2MDL_SelfTest_Process(void)
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
    DemoStatus = STATUS_SELFTEST;
  }

  /* Handle DEMO State Machine */
  switch (DemoStatus)
  {
    case STATUS_SELFTEST:
      if (LIS2MDL_SelfTest() != BSP_ERROR_NONE)
      {
        Error_Handler();
      }

      DemoStatus = STATUS_SLEEP;
      break;

    case STATUS_SLEEP:
      (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nPress USER button to start the DEMO ...\r\n");
      printf("%s", dataOut);

      /* Enter sleep mode */
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
  * @brief  Performs LIS2MDL magnetometer self-test
  * @retval BSP status
  */
static int32_t LIS2MDL_SelfTest(void)
{
  int32_t test_result = BSP_ERROR_NONE;
  uint32_t i;
  CUSTOM_MOTION_SENSOR_Axes_t data_nost;
  CUSTOM_MOTION_SENSOR_Axes_t data_st;
  CUSTOM_MOTION_SENSOR_Axes_t data;
  uint8_t prev_reg_values[ST_REG_COUNT];
  int32_t ret;

  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nStarting LIS2MDL magnetometer self-test ...\r\nKeep the device still!!!\r\n");
  printf("%s", dataOut);

  HAL_Delay(INDICATION_DELAY);
  BSP_LED_On(LED2);

  /* Store current settings of the sensor */
  for (i = 0; i < ST_REG_COUNT; i++)
  {
    if ((ret = CUSTOM_MOTION_SENSOR_Read_Register(CUSTOM_LIS2MDL_0, reg_addr[i], &prev_reg_values[i])) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  /* Set the sensor for self-test */
  for (i = 0; i < ST_REG_COUNT; i++)
  {
    if ((ret = CUSTOM_MOTION_SENSOR_Write_Register(CUSTOM_LIS2MDL_0, reg_addr[i], st_reg_values[i])) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  /* Wait defined time for stable output */
  HAL_Delay(POWER_UP_DELAY);

  /* Read first data and discard it */
  if (LIS2MDL_M_Get_Data(&data) != BSP_ERROR_NONE)
  {
    Error_Handler();
  }

  data_nost.x = 0;
  data_nost.y = 0;
  data_nost.z = 0;

  /* Read valid data multiple times and average it */
  for (i = 0; i < (uint32_t)N_SAMPLES; i++)
  {
    if (LIS2MDL_M_Get_Data(&data) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }
    data_nost.x += data.x;
    data_nost.y += data.y;
    data_nost.z += data.z;
  }
  data_nost.x /= N_SAMPLES;
  data_nost.y /= N_SAMPLES;
  data_nost.z /= N_SAMPLES;

  /* Enable self-test */
  if ((ret = CUSTOM_MOTION_SENSOR_Set_SelfTest(CUSTOM_LIS2MDL_0, MOTION_MAGNETO, 1)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  /* Wait defined time for stable output */
  HAL_Delay(ST_ENABLED_DELAY);

  /* Read first data and discard it */
  if (LIS2MDL_M_Get_Data(&data) != BSP_ERROR_NONE)
  {
    Error_Handler();
  }
  data_st.x = 0;
  data_st.y = 0;
  data_st.z = 0;

  /* Read valid data multiple times and average it */
  for (i = 0; i < (uint32_t)N_SAMPLES; i++)
  {
    if (LIS2MDL_M_Get_Data(&data) != BSP_ERROR_NONE)
    {
      Error_Handler();
    }
    data_st.x += data.x;
    data_st.y += data.y;
    data_st.z += data.z;
  }
  data_st.x /= N_SAMPLES;
  data_st.y /= N_SAMPLES;
  data_st.z /= N_SAMPLES;

  /* Restore previous settings of the sensor */
  for (i = 0; i < ST_REG_COUNT; i++)
  {
    if ((ret = CUSTOM_MOTION_SENSOR_Write_Register(CUSTOM_LIS2MDL_0, reg_addr[i], prev_reg_values[i])) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }

  /* Evaluate the test */
  if (abs(data_st.x - data_nost.x) < LO_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }
  if (abs(data_st.x - data_nost.x) > HI_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }
  if (abs(data_st.y - data_nost.y) < LO_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }
  if (abs(data_st.y - data_nost.y) > HI_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }
  if (abs(data_st.z - data_nost.z) < LO_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }
  if (abs(data_st.z - data_nost.z) > HI_LIM)
  {
    test_result = BSP_ERROR_COMPONENT_FAILURE;
  }

  /* Print measured data */
  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nMeasured magnetic field [mgauss]:\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n     AXIS     | PRE-SELFTEST |   SELFTEST\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "--------------|--------------|--------------\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "       X      | %8ld     | %8ld\r\n", data_nost.x, data_st.x);
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "       Y      | %8ld     | %8ld\r\n", data_nost.y, data_st.y);
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "       Z      | %8ld     | %8ld\r\n", data_nost.z, data_st.z);
  printf("%s", dataOut);

  /* Print test limits and data */
  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nTest limits and data [mgauss]:\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\n  LOW LIMIT   |  DIFFERENCE  |  HIGH LIMIT\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "--------------|--------------|--------------\r\n");
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "%8d      | %8d     | %8d\r\n", LO_LIM, (int)abs(data_st.x - data_nost.x), HI_LIM);
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "%8d      | %8d     | %8d\r\n", LO_LIM, (int)abs(data_st.y - data_nost.y), HI_LIM);
  printf("%s", dataOut);
  (void)snprintf(dataOut, MAX_BUF_SIZE, "%8d      | %8d     | %8d\r\n", LO_LIM, (int)abs(data_st.z - data_nost.z), HI_LIM);
  printf("%s", dataOut);

  /* Print the test result */
  if (test_result == BSP_ERROR_NONE)
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nLIS2MDL magnetometer self-test PASSED!\r\n");
  }
  else
  {
    (void)snprintf(dataOut, MAX_BUF_SIZE, "\r\nLIS2MDL magnetometer self-test FAILED!\r\n");
  }
  printf("%s", dataOut);

  BSP_LED_Off(LED2);

  return ret;
}

/**
  * @brief  Wait for data ready and get data
  * @param  data the sensor data
  * @retval BSP status
  */
static int32_t LIS2MDL_M_Get_Data(CUSTOM_MOTION_SENSOR_Axes_t *data)
{
  uint8_t status;
  int32_t ret;

  /* Wait for data ready */
  do
  {
    if ((ret = CUSTOM_MOTION_SENSOR_Get_DRDY_Status(CUSTOM_LIS2MDL_0, MOTION_MAGNETO, &status)) != BSP_ERROR_NONE)
    {
      return ret;
    }
  }
  while (status == 0U);

  /* Read accelero data */
  if ((ret = CUSTOM_MOTION_SENSOR_GetAxes(CUSTOM_LIS2MDL_0, MOTION_MAGNETO, data)) != BSP_ERROR_NONE)
  {
    return ret;
  }

  return ret;
}
