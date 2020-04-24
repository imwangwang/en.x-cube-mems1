[#ftl]
/**
 ******************************************************************************
 * @file    app_mems_int_pin_a_interface.c
 * @author  MEMS Application Team
 * @brief   This file contains the MEMS INT pin A interface
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) ${year} STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign ExtiLine = ""]
[#assign IrqNumber = ""]
[#assign MEMS_INT_PIN_A_EXTI_LINE = ""]
[#assign MEMS_INT_PIN_A_EXTI_PORT = ""]
[#assign MEMS_INT_PIN_A_EXTI_PIN = ""]
[#assign MEMS_INT_PIN_A_EXTI_IRQn = ""]

[#list BspIpDatas as SWIP]
  [#if SWIP.variables??]
    [#list SWIP.variables as variables]
      [#if variables.name?contains("IpName")]
        [#assign IpName = variables.value]
      [/#if]
      [#if variables.name?contains("IpInstance")]
        [#assign IpInstance = variables.value]
      [/#if]
      [#if variables.name?contains("GPIO_INT_NUM")]
        [#assign IrqNumber = variables.value]
      [/#if]
      [#if variables.name?contains("EXTI_LINE_NUMBER")]
        [#assign ExtiLine = variables.value]
      [/#if]
      [#if variables.value?contains("MEMS_INT_PIN_A")]
        [#assign MEMS_INT_PIN_A_EXTI_LINE = ExtiLine]
        [#assign MEMS_INT_PIN_A_EXTI_PORT = IpName]
        [#assign MEMS_INT_PIN_A_EXTI_PIN = IpInstance]
        [#assign MEMS_INT_PIN_A_EXTI_IRQn = IrqNumber]
      [/#if]
    [/#list]
  [/#if]
[/#list]

/* Includes ------------------------------------------------------------------*/
#include "app_mems_int_pin_a_interface.h"

EXTI_HandleTypeDef hexti${MEMS_INT_PIN_A_EXTI_LINE} = {.Line = EXTI_LINE_${MEMS_INT_PIN_A_EXTI_LINE}};
extern volatile uint8_t MemsEventDetected;

static void mems_int_pin_a_hardware_event_isr(void);

void set_mems_int_pin_a_exti(void)
{
  /* register event irq handler */
  HAL_EXTI_GetHandle(&hexti${MEMS_INT_PIN_A_EXTI_LINE}, EXTI_LINE_${MEMS_INT_PIN_A_EXTI_LINE});
  HAL_EXTI_RegisterCallback(&hexti${MEMS_INT_PIN_A_EXTI_LINE}, HAL_EXTI_COMMON_CB_ID, mems_int_pin_a_hardware_event_isr);
  HAL_NVIC_SetPriority(${MEMS_INT_PIN_A_EXTI_IRQn}, 0, 0);
  HAL_NVIC_EnableIRQ(${MEMS_INT_PIN_A_EXTI_IRQn});
}

static void mems_int_pin_a_hardware_event_isr(void)
{
  MemsEventDetected = 1;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/