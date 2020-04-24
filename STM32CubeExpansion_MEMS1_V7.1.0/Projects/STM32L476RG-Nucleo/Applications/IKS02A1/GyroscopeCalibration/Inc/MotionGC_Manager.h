/**
 ******************************************************************************
 * @file    MotionGC_Manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the MotionGC_Manager.c file.
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
#ifndef MOTIONGC_MANAGER_H
#define MOTIONGC_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
#include "motion_gc.h"
#include "main.h"

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionGC_manager_init(float freq);
void MotionGC_manager_update(MGC_input_t *data_in, MGC_output_t *gyro_bias, int *bias_update);
void MotionGC_manager_get_knobs(MGC_knobs_t *knobs);
void MotionGC_manager_set_knobs(MGC_knobs_t *knobs);
void MotionGC_manager_get_params(MGC_output_t *gyro_bias);
void MotionGC_manager_set_params(MGC_output_t *gyro_bias);
void MotionGC_manager_set_frequency(float freq);
void MotionGC_manager_get_version(char *version, int *length);
void MotionGC_manager_compensate(IKS02A1_MOTION_SENSOR_Axes_t *DataIn, IKS02A1_MOTION_SENSOR_Axes_t *DataOut);

int16_t gyro_bias_to_mdps(float gyro_bias);

#ifdef __cplusplus
}
#endif

#endif /* MOTIONGC_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
