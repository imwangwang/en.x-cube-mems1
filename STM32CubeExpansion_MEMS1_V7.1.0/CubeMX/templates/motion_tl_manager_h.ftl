[#ftl]
/**
 ******************************************************************************
 * @file    motion_tl_manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the motion_tl_manager.c file
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

[#assign useIKS01A3TILTSENSINGDEMO = false]
[#assign useIKS01A2TILTSENSINGDEMO = false]
[#assign useCUSTOMTILTSENSINGDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_TILTSENSING_DEMO")]
[#assign useIKS01A3TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A2_TILTSENSING_DEMO")]
[#assign useIKS01A2TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("CUSTOM_TILTSENSING_DEMO")]
[#assign useCUSTOMTILTSENSINGDEMO = true]
[/#if]

[/#list]
[/#if]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef MOTION_TL_MANAGER_H
#define MOTION_TL_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
#include "motion_tl.h"
#include "main.h"
[#if useIKS01A3TILTSENSINGDEMO]
#include "iks01a3_mems_control.h"
#include "iks01a3_mems_control_ex.h"
[/#if]
[#if useIKS01A2TILTSENSINGDEMO]
#include "iks01a2_mems_control.h"
#include "iks01a2_mems_control_ex.h"
[/#if]
[#if useCUSTOMTILTSENSINGDEMO]
#include "custom_mems_control.h"
#include "custom_mems_control_ex.h"
[/#if]

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionTL_manager_init(void);
void MotionTL_manager_run(MTL_input_t *data_in);
void MotionTL_manager_getAngles(MTL_output_t *data_out, MTL_angle_mode_t angle_mode);
void MotionTL_manager_get_version(char *version, int *length);
void MotionTL_manager_calibratePosition(MTL_cal_position_t cal_position);
MTL_cal_result_t MotionTL_manager_getCalibrationValues(MTL_acc_cal_t *acc_cal);
void MotionTL_manager_setCalibrationValues(MTL_acc_cal_t *acc_cal);
void MotionTL_manager_getEstimatedMeasTime(float *time_s);
uint8_t CollectData(float cal_data[][3], uint32_t num_records);
void GetEstimatedMeasTime(float *time_s, uint32_t num_records);

char MotionTL_LoadMagCalFromNVM(unsigned short int dataSize, unsigned int *data);
char MotionTL_SaveMagCalInNVM(unsigned short int dataSize, unsigned int *data);

#ifdef __cplusplus
}
#endif

#endif /* MOTION_TL_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
