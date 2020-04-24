/**
 *******************************************************************************
 * @file    cube_hal_l1.c
 * @author  MEMS Software Solutions Team
 * @brief   Specific Cube settings for STM32L1 Nucleo boards
 *******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed under Software License Agreement
 * SLA0077, (the "License"). You may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *     www.st.com/content/st_com/en/search.html#q=SLA0077-t=keywords-page=1
 *
 *******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "cube_hal.h"
#include "com.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup MAGNETOMETER_CALIBRATION MAGNETOMETER CALIBRATION
 * @{
 */

/**
 * @brief  System Clock Configuration
 * @param  None
 * @retval None
 */
void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};

  /* Enable Power Control clock */
  __PWR_CLK_ENABLE();

  /* The voltage scaling allows optimizing the power consumption when the device is
  clocked below the maximum system frequency, to update the voltage scaling value
  regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /* Enable HSI Oscillator and activate PLL with HSI as source */
  RCC_OscInitStruct.OscillatorType      = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState            = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState        = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource       = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL          = RCC_PLL_MUL6;
  RCC_OscInitStruct.PLL.PLLDIV          = RCC_PLL_DIV3;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }

  /* Poll VOSF bit of in PWR_CSR. Wait until it is reset to 0 */
  while (__HAL_PWR_GET_FLAG(PWR_FLAG_VOS) != RESET) {};

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  RCC_ClkInitStruct.ClockType      = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 |
                                      RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource   = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider  = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}

/**
 * @brief  Get the DMA Stream pending flags
 * @param  handle_dma DMA handle
 * @retval The state of FLAG (SET or RESET)
 */
uint32_t Get_DMA_Flag_Status(DMA_HandleTypeDef *handle_dma)
{
  return (__HAL_DMA_GET_FLAG(handle_dma, __HAL_DMA_GET_TE_FLAG_INDEX(handle_dma)));
}

/**
 * @brief  Returns the number of remaining data units in the current DMAy Streamx transfer
 * @param  handle_dma DMA handle
 * @retval The number of remaining data units in the current DMA Stream transfer
 */
uint32_t Get_DMA_Counter(DMA_HandleTypeDef *handle_dma)
{
  return (handle_dma->Instance->CNDTR);
}

/**
 * @brief  Configure the DMA handler for transmission process
 * @param  handle_dma DMA handle
 * @retval None
 */
void Config_DMA_Handler(DMA_HandleTypeDef *handle_dma)
{
  handle_dma->Instance                 = DMA1_Channel6;
  handle_dma->Init.Direction           = DMA_PERIPH_TO_MEMORY;
  handle_dma->Init.PeriphInc           = DMA_PINC_DISABLE;
  handle_dma->Init.MemInc              = DMA_MINC_ENABLE;
  handle_dma->Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
  handle_dma->Init.MemDataAlignment    = DMA_MDATAALIGN_BYTE;
  handle_dma->Init.Mode                = DMA_CIRCULAR;
  handle_dma->Init.Priority            = DMA_PRIORITY_VERY_HIGH;
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
