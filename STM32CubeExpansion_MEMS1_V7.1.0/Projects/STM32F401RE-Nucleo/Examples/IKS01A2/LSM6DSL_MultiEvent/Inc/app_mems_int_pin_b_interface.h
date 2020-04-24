/**
 ******************************************************************************
 * @file    app_mems_int_pin_b_interface.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the MEMS INT pin B interface
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
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

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal_exti.h"

/* Exported variables --------------------------------------------------------*/
extern EXTI_HandleTypeDef hexti4;
#define H_EXTI_4 hexti4

/* Exported Functions --------------------------------------------------------*/
void set_mems_int_pin_b_exti(void);

#ifdef __cplusplus
}
#endif

#endif /* __APP_MEMS_INT_PIN_B_INTERFACE_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

