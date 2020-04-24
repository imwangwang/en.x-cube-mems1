/**
 ******************************************************************************
 * @file    MotionAW_Manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the MotionAW_Manager.c file.
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
#ifndef MOTIONAW_MANAGER_H
#define MOTIONAW_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
#include "motion_aw.h"
#include "main.h"

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionAW_manager_init(void);
void MotionAW_manager_run(MAW_input_t *data_in, MAW_activity_t *data_out, int64_t timestamp);
void MotionAW_manager_get_version(char *version, int *length);

#ifdef __cplusplus
}
#endif

#endif /* MOTIONAW_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
