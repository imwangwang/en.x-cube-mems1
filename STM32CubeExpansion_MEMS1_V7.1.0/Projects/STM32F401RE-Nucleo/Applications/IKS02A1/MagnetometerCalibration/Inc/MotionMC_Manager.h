/**
 ******************************************************************************
 * @file    MotionMC_Manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the MotionMC_Manager.c file.
 ******************************************************************************
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef MOTIONMC_MANAGER_H
#define MOTIONMC_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
#include "main.h"

#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
#include "motion_mc.h"
#elif (defined (USE_STM32L0XX_NUCLEO))
#include "motion_mc_cm0p.h"
#endif
/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionMC_manager_init(int sampletime, unsigned short int enable);
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
void MotionMC_manager_update(MMC_Input_t *data_in);
void MotionMC_manager_get_params(MMC_Output_t *data_out);
#elif (defined (USE_STM32L0XX_NUCLEO))
void MotionMC_manager_update(MMC_CM0P_Input_t *data_in);
void MotionMC_manager_get_params(MMC_CM0P_Output_t *data_out);
#endif
void MotionMC_manager_get_version(char *version, int *length);
void MotionMC_manager_compensate(IKS02A1_MOTION_SENSOR_Axes_t *DataIn, IKS02A1_MOTION_SENSOR_Axes_t *DataOut);

int32_t mag_val_to_mGauss(float mag_val_uT);

#ifdef __cplusplus
}
#endif

#endif /* MOTIONMC_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
