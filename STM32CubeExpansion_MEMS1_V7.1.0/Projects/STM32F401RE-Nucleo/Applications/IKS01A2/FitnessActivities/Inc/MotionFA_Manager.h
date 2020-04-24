/**
 ******************************************************************************
 * @file    MotionFA_Manager.h
 * @author  MEMS Software Solutions Team
 * @brief   This file contains definitions for the MotionFA_Manager.c file.
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
#ifndef MOTIONFA_MANAGER_H
#define MOTIONFA_MANAGER_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "string.h"
#include "motion_fa.h"
#include "main.h"

/* Extern variables ----------------------------------------------------------*/
/* Exported Macros -----------------------------------------------------------*/
/* Exported Types ------------------------------------------------------------*/
/* Imported Variables --------------------------------------------------------*/
/* Exported Functions Prototypes ---------------------------------------------*/
void MotionFA_manager_init(void);
void MotionFA_manager_run(MFA_input_t *data_in, MFA_output_t *data_out);
void MotionFA_manager_get_version(char *version, int *length);
void MotionFA_manager_reset_counter(void);
void MotionFA_manager_set_activity(MFA_activity_t activity);
void MotionFA_manager_get_activity(MFA_activity_t *activity);

#ifdef __cplusplus
}
#endif

#endif /* MOTIONFA_MANAGER_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
