[#ftl]
/**
 ******************************************************************************
 * @file    motion_mc_manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the motion_mc_manager.c file
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

[#if ("${FamilyName}" == "STM32F0" || "${FamilyName}" == "STM32G0" || "${FamilyName}" == "STM32L0")]
[#assign useCortexM0 = true]
[/#if]

[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3ECOMPASSDEMO = false]
[#assign useIKS01A2ECOMPASSDEMO = false]
[#assign useCUSTOMECOMPASSDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ECOMPASS_DEMO")]
[#assign useIKS01A3ECOMPASSDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ECOMPASS_DEMO")]
[#assign useIKS01A2ECOMPASSDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ECOMPASS_DEMO")]
[#assign useCUSTOMECOMPASSDEMO = true]
[/#if]

[/#list]
[/#if]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef MOTION_MC_MANAGER_H
#define MOTION_MC_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include <string.h>
[#if useCortexM0]
#include "motion_mc_cm0p.h"
[#else]
#include "motion_mc.h"
[/#if]
#include "main.h"
[#if (useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A3ECOMPASSDEMO)]
#include "iks01a3_mems_control.h"
[/#if]
[#if (useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useIKS01A2ECOMPASSDEMO)]
#include "iks01a2_mems_control.h"
[/#if]
[#if (useCUSTOMMAGNETOMETERCALIBRATIONDEMO || useCUSTOMECOMPASSDEMO)]
#include "custom_mems_control.h"
[/#if]

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionMC_manager_init(int sampletime, unsigned short int enable);
[#if useCortexM0]
void MotionMC_manager_update(MMC_CM0P_Input_t *data_in);
void MotionMC_manager_get_params(MMC_CM0P_Output_t *data_out);
[#else]
void MotionMC_manager_update(MMC_Input_t *data_in);
void MotionMC_manager_get_params(MMC_Output_t *data_out);
[/#if]
void MotionMC_manager_get_version(char *version, int *length);
void MotionMC_manager_compensate(MOTION_SENSOR_Axes_t *data_raw, MOTION_SENSOR_Axes_t *data_comp);

int32_t mag_val_to_mGauss(float mag_val_uT);

#ifdef __cplusplus
}
#endif

#endif /* MOTION_MC_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
