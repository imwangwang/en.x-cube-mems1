[#ftl]
/**
 ******************************************************************************
 * @file    motion_fx_manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the motion_fx_manager.c file
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

[#assign useCortexM0 = false]
[#assign useCortexM3 = false]
[#assign useCortexM4 = false]
[#assign useCortexM7 = false]

[#if ("${FamilyName}" == "STM32F0" || "${FamilyName}" == "STM32G0" || "${FamilyName}" == "STM32L0")]
[#assign useCortexM0 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F2" || "${FamilyName}" == "STM32L1")]
[#assign useCortexM3 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F3" || "${FamilyName}" == "STM32F4" || "${FamilyName}" == "STM32G4" || "${FamilyName}" == "STM32L4" || "${FamilyName}" == "STM32WB")]
[#assign useCortexM4 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F7" || "${FamilyName}" == "STM32H7")]
[#assign useCortexM7 = true]
[/#if]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef MOTION_FX_MANAGER_H
#define MOTION_FX_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
#include "motion_fx.h"
[/#if]
[#if useCortexM0]
#include "motion_fx_cm0p.h"
[/#if]
#include "main.h"

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionFX_manager_init(void);
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
void MotionFX_manager_run(MFX_input_t *data_in, MFX_output_t *data_out, float delta_time);
[/#if]
[#if useCortexM0]
void MotionFX_manager_run(MFX_CM0P_input_t *data_in, MFX_CM0P_output_t *data_out, float delta_time);
[/#if]
void MotionFX_manager_start_6X(void);
void MotionFX_manager_stop_6X(void);
void MotionFX_manager_start_9X(void);
void MotionFX_manager_stop_9X(void);
void MotionFX_manager_get_version(char *version, int *length);
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
void MotionFX_manager_MagCal_run(MFX_MagCal_input_t *data_in, MFX_MagCal_output_t *data_out);
[/#if]
[#if useCortexM0]
void MotionFX_manager_MagCal_run(MFX_CM0P_MagCal_input_t *data_in, MFX_CM0P_MagCal_output_t *data_out);
[/#if]
void MotionFX_manager_MagCal_start(int sampletime);
void MotionFX_manager_MagCal_stop(int sampletime);

char MotionFX_LoadMagCalFromNVM(unsigned short int dataSize, unsigned int *data);
char MotionFX_SaveMagCalInNVM(unsigned short int dataSize, unsigned int *data);

#ifdef __cplusplus
}
#endif

#endif /* MOTION_FX_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
