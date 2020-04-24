/**
 ******************************************************************************
 * @file    MotionPE_Manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains Pose Estimation interface functions
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

/* Includes ------------------------------------------------------------------*/
#include "MotionPE_Manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup POSE_ESTIMATION POSE ESTIMATION
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Exported function prototypes ----------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize the MotionPE engine
 * @param  None
 * @retval None
 */
void MotionPE_manager_init(void)
{
  char acc_orientation[3];

  MotionPE_Initialize();

#if (defined (USE_IKS01A2))
  /* LSM6DSL */
  acc_orientation[0] = 'n';
  acc_orientation[1] = 'w';
  acc_orientation[2] = 'u';

#else
#error Not supported platform
#endif

  MotionPE_SetOrientation_Acc(acc_orientation);
}

/**
 * @brief  Run Pose Estimation algorithm
 * @param  data_in  Structure containing input data
 * @param  data_out Structure containing output data
 * @retval None
 */
void MotionPE_manager_run(MPE_input_t *data_in, MPE_output_t *data_out)
{
  MotionPE_Update(data_in, data_out);
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionPE_manager_get_version(char *version, int *length)
{
  *length = (int)MotionPE_GetLibVersion(version);
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
