[#ftl]
/**
 ******************************************************************************
 * @file    motion_fx_manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains Datalog Fusion interface functions
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

[#assign useIKS01A3DATALOGFUSIONDEMO = false]
[#assign useIKS01A2DATALOGFUSIONDEMO = false]
[#assign useCUSTOMDATALOGFUSIONDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_DATALOGFUSION_DEMO")]
[#assign useIKS01A3DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_DATALOGFUSION_DEMO")]
[#assign useIKS01A2DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_DATALOGFUSION_DEMO")]
[#assign useCUSTOMDATALOGFUSIONDEMO = true]
[/#if]

[/#list]
[/#if]

/* Includes ------------------------------------------------------------------*/
#include "motion_fx_manager.h"
[#if useIKS01A3DATALOGFUSIONDEMO]
#include "iks01a3_mems_control_ex.h"
[/#if]
[#if useIKS01A2DATALOGFUSIONDEMO]
#include "iks01a2_mems_control_ex.h"
[/#if]
[#if useCUSTOMDATALOGFUSIONDEMO]
#include "custom_mems_control_ex.h"
[/#if]

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup DATALOG_FUSION DATALOG FUSION
 * @{
 */

/* Extern variables ----------------------------------------------------------*/
/* Private defines -----------------------------------------------------------*/
#define SAMPLETODISCARD                 15

#define GBIAS_ACC_TH_SC_6X              (2.0f*0.000765f)
#define GBIAS_GYRO_TH_SC_6X             (2.0f*0.002f)
#define GBIAS_MAG_TH_SC_6X              (2.0f*0.001500f)
#define GBIAS_ACC_TH_SC_9X              (2.0f*0.000765f)
#define GBIAS_GYRO_TH_SC_9X             (2.0f*0.002f)
#define GBIAS_MAG_TH_SC_9X              (2.0f*0.001500f)

[#if (useCortexM7 || useCortexM4 || useCortexM0)]
#define DECIMATION                      1U
[/#if]
[#if useCortexM3]
#define DECIMATION                      4U
[/#if]

/* Private variables ---------------------------------------------------------*/
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
static MFX_knobs_t iKnobs;
static MFX_knobs_t *ipKnobs = &iKnobs;

[/#if]
static volatile int sampleToDiscard = SAMPLETODISCARD;
static int discardedCount = 0;

/* Private typedef -----------------------------------------------------------*/
/* Exported function prototypes ----------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize the MotionFX engine
 * @param  None
 * @retval None
 */
void MotionFX_manager_init(void)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_initialize();

  MotionFX_getKnobs(ipKnobs);

  BSP_SENSOR_ACC_GetOrientation(ipKnobs->acc_orientation);
  BSP_SENSOR_GYR_GetOrientation(ipKnobs->gyro_orientation);
  BSP_SENSOR_MAG_GetOrientation(ipKnobs->mag_orientation);

  ipKnobs->gbias_acc_th_sc_6X = GBIAS_ACC_TH_SC_6X;
  ipKnobs->gbias_gyro_th_sc_6X = GBIAS_GYRO_TH_SC_6X;
  ipKnobs->gbias_mag_th_sc_6X = GBIAS_MAG_TH_SC_6X;

  ipKnobs->gbias_acc_th_sc_9X = GBIAS_ACC_TH_SC_9X;
  ipKnobs->gbias_gyro_th_sc_9X = GBIAS_GYRO_TH_SC_9X;
  ipKnobs->gbias_mag_th_sc_9X = GBIAS_MAG_TH_SC_9X;

  ipKnobs->output_type = MFX_ENGINE_OUTPUT_ENU;
  ipKnobs->LMode = 1;
  ipKnobs->modx = DECIMATION;

  MotionFX_setKnobs(ipKnobs);

  MotionFX_enable_6X(MFX_ENGINE_DISABLE);
  MotionFX_enable_9X(MFX_ENGINE_DISABLE);
[/#if]
[#if useCortexM0]
  char acc_orientation[4];
  char gyro_orientation[4];
  char mag_orientation[4];

  BSP_SENSOR_ACC_GetOrientation(acc_orientation);
  BSP_SENSOR_GYR_GetOrientation(gyro_orientation);
  BSP_SENSOR_MAG_GetOrientation(mag_orientation);

  MotionFX_CM0P_initialize();

  MotionFX_CM0P_setOrientation(acc_orientation, gyro_orientation, mag_orientation);

  MotionFX_CM0P_enable_gbias(MFX_CM0P_ENGINE_ENABLE);
  MotionFX_CM0P_enable_euler(MFX_CM0P_ENGINE_ENABLE);
  MotionFX_CM0P_enable_6X(MFX_CM0P_ENGINE_DISABLE);
  MotionFX_CM0P_enable_9X(MFX_CM0P_ENGINE_DISABLE);
[/#if]
}

/**
 * @brief  Run Motion Sensor Data Fusion algorithm
 * @param  data_in  Structure containing input data
 * @param  data_out Structure containing output data
 * @param  delta_time Delta time
 * @retval None
 */
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
void MotionFX_manager_run(MFX_input_t *data_in, MFX_output_t *data_out, float delta_time)
{
  if (discardedCount == sampleToDiscard)
  {
    MotionFX_propagate(data_out, data_in, &delta_time);
    MotionFX_update(data_out, data_in, &delta_time, NULL);
  }
  else
  {
    discardedCount++;
  }
}
[/#if]
[#if useCortexM0]
void MotionFX_manager_run(MFX_CM0P_input_t *data_in, MFX_CM0P_output_t *data_out, float delta_time)
{
  if (discardedCount == sampleToDiscard)
  {
    MotionFX_CM0P_update(data_out, data_in, delta_time);
  }
  else
  {
    discardedCount++;
  }
}
[/#if]

/**
 * @brief  Start 6 axes MotionFX engine
 * @param  None
 * @retval None
 */
void MotionFX_manager_start_6X(void)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_enable_6X(MFX_ENGINE_ENABLE);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_enable_6X(MFX_CM0P_ENGINE_ENABLE);
[/#if]
}

/**
 * @brief  Stop 6 axes MotionFX engine
 * @param  None
 * @retval None
 */
void MotionFX_manager_stop_6X(void)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_enable_6X(MFX_ENGINE_DISABLE);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_enable_6X(MFX_CM0P_ENGINE_DISABLE);
[/#if]
}

/**
 * @brief  Start 9 axes MotionFX engine
 * @param  None
 * @retval None
 */
void MotionFX_manager_start_9X(void)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_enable_9X(MFX_ENGINE_ENABLE);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_enable_9X(MFX_CM0P_ENGINE_ENABLE);
[/#if]
}

/**
 * @brief  Stop 9 axes MotionFX engine
 * @param  None
 * @retval None
 */
void MotionFX_manager_stop_9X(void)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_enable_9X(MFX_ENGINE_DISABLE);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_enable_9X(MFX_CM0P_ENGINE_DISABLE);
[/#if]
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionFX_manager_get_version(char *version, int *length)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  *length = (int)MotionFX_GetLibVersion(version);
[/#if]
[#if useCortexM0]
  *length = (int)MotionFX_CM0P_GetLibVersion(version);
[/#if]
}

/**
 * @brief  Run magnetometer calibration algorithm
 * @param  None
 * @retval None
 */
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
void MotionFX_manager_MagCal_run(MFX_MagCal_input_t *data_in, MFX_MagCal_output_t *data_out)
{
  MotionFX_MagCal_run(data_in);
  MotionFX_MagCal_getParams(data_out);
}
[/#if]
[#if useCortexM0]
void MotionFX_manager_MagCal_run(MFX_CM0P_MagCal_input_t *data_in, MFX_CM0P_MagCal_output_t *data_out)
{
  MotionFX_CM0P_MagCal_run(data_in);
  MotionFX_CM0P_MagCal_getParams(data_out);
}
[/#if]

/**
 * @brief  Start magnetometer calibration
 * @param  None
 * @retval None
 */
void MotionFX_manager_MagCal_start(int sampletime)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_MagCal_init(sampletime, 1);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_MagCal_init(sampletime, 1);
[/#if]
}

/**
 * @brief  Stop magnetometer calibration
 * @param  None
 * @retval None
 */
void MotionFX_manager_MagCal_stop(int sampletime)
{
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
  MotionFX_MagCal_init(sampletime, 0);
[/#if]
[#if useCortexM0]
  MotionFX_CM0P_MagCal_init(sampletime, 0);
[/#if]
}

/**
 * @brief  Load calibration parameter from memory
 * @param  dataSize length ot the data
 * @param  data pointer to the data
 * @retval (1) fail, (0) success
 */
char MotionFX_LoadMagCalFromNVM(unsigned short int dataSize, unsigned int *data)
{
  return (char)1;
}

/**
 * @brief  Save calibration parameter to memory
 * @param  dataSize length ot the data
 * @param  data pointer to the data
 * @retval (1) fail, (0) success
 */
char MotionFX_SaveMagCalInNVM(unsigned short int dataSize, unsigned int *data)
{
  return (char)1;
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
