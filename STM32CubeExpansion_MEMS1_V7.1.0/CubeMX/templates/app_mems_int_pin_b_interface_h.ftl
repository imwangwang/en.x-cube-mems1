[#ftl]
/**
 ******************************************************************************
 * @file    app_mems_int_pin_b_interface.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the MEMS INT pin B interface
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APP_MEMS_INT_PIN_B_INTERFACE_H__
#define __APP_MEMS_INT_PIN_B_INTERFACE_H__

#ifdef __cplusplus
extern "C" {
#endif

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign ExtiLine = ""]
[#assign IrqNumber = ""]
[#assign MEMS_INT_PIN_B_EXTI_LINE = ""]
[#assign MEMS_INT_PIN_B_EXTI_PORT = ""]
[#assign MEMS_INT_PIN_B_EXTI_PIN = ""]
[#assign MEMS_INT_PIN_B_EXTI_IRQn = ""]

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
      [#if variables.value?contains("MEMS_INT_PIN_B")]
        [#assign MEMS_INT_PIN_B_EXTI_LINE = ExtiLine]
        [#assign MEMS_INT_PIN_B_EXTI_PORT = IpName]
        [#assign MEMS_INT_PIN_B_EXTI_PIN = IpInstance]
        [#assign MEMS_INT_PIN_B_EXTI_IRQn = IrqNumber]
      [/#if]
    [/#list]
  [/#if]
[/#list]

/* Includes ------------------------------------------------------------------*/
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"

/* Exported variables --------------------------------------------------------*/
extern EXTI_HandleTypeDef hexti${MEMS_INT_PIN_B_EXTI_LINE};
#define H_EXTI_${MEMS_INT_PIN_B_EXTI_LINE} hexti${MEMS_INT_PIN_B_EXTI_LINE}

/* Exported Functions --------------------------------------------------------*/
void set_mems_int_pin_b_exti(void);

#ifdef __cplusplus
}
#endif

#endif /* __APP_MEMS_INT_PIN_B_INTERFACE_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

