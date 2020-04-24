[#ftl]
/**
 ******************************************************************************
 * @file    motion_vc_manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains Vertical Context interface functions
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

[#assign useCortexM7 = false]

[#if ("${FamilyName}" == "STM32F7" || "${FamilyName}" == "STM32H7")]
[#assign useCortexM7 = true]
[/#if]

/* Includes ------------------------------------------------------------------*/
#include "motion_vc_manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup VERTICAL_CONTEXT VERTICAL CONTEXT
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Exported function prototypes ----------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize the MotionVC engine
 * @param  None
 * @retval None
 */
void MotionVC_manager_init(void)
{
[#if useCortexM7]
  MotionVC_Initialize("${FamilyName[5..6]}");
[#else]
  MotionVC_Initialize();
[/#if]
}

/**
 * @brief  Run Vertical Context algorithm
 * @param  data_in  Structure containing input data
 * @param  data_out Structure containing output data
 * @retval None
 */
void MotionVC_manager_update(MVC_input_t *data_in, MVC_output_t *data_out)
{
  MotionVC_Update(data_in, data_out);
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionVC_manager_get_version(char *version, int *length)
{
  *length = (int)MotionVC_GetLibVersion(version);
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/