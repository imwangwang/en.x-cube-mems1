[#ftl]
/**
 ******************************************************************************
 * @file    motion_mc_manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains Magnetometer Calibration interface functions
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

/* Includes ------------------------------------------------------------------*/
#include "motion_mc_manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

[#if (useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO)]
/** @addtogroup MAGNETOMETER_CALIBRATION MAGNETOMETER CALIBRATION
 * @{
 */
[/#if]
[#if (useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO)]
/** @addtogroup E_COMPASS E_COMPASS
 * @{
 */
[/#if]

/* Private typedef -----------------------------------------------------------*/
/* Exported functions prototypes ---------------------------------------------*/
// NOTE: Must be implemented for each platform separately, because its implementation
//       is platform dependent. No need to call this function, library call this
//       function automatically.
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data);

// NOTE: Must be implemented for each platform separately, because its implementation
//       is platform dependent. No need to call this function, library call this
//       function automatically.
char MotionMC_SaveCalInNVM(unsigned short int datasize, unsigned int *data);

/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize the MotionMC engine
 * @param  sampletime period in milliseconds [ms] between the update function call
 * @param  enable enable (1) or disable (0) library
 * @retval None
 */
void MotionMC_manager_init(int sampletime, unsigned short int enable)
{
[#if useCortexM0]
  MotionMC_CM0P_Initialize(sampletime, MMC_CM0P_HI_AND_SI, enable);
[#else]
  MotionMC_Initialize(sampletime, enable);
[/#if]
}

/**
 * @brief  Run Magnetometer Calibration algorithm
 * @param  data_in  Structure containing input data
 * @retval None
 */
[#if useCortexM0]
void MotionMC_manager_update(MMC_CM0P_Input_t *data_in)
{
  MotionMC_CM0P_Update(data_in);
}
[#else]
void MotionMC_manager_update(MMC_Input_t *data_in)
{
  MotionMC_Update(data_in);
}
[/#if]

/**
 * @brief  Get the magnetometer calibration values for hard/soft iron
 * @param  data_out  Structure containing output data
 * @retval None
 */
[#if useCortexM0]
void MotionMC_manager_get_params(MMC_CM0P_Output_t *data_out)
{
  MotionMC_CM0P_GetCalParams(data_out);
}
[#else]
void MotionMC_manager_get_params(MMC_Output_t *data_out)
{
  MotionMC_GetCalParams(data_out);
}
[/#if]

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionMC_manager_get_version(char *version, int *length)
{
[#if useCortexM0]
  *length = (int)MotionMC_CM0P_GetLibVersion(version);
[#else]
  *length = (int)MotionMC_GetLibVersion(version);
[/#if]
}

/**
 * @brief  Do hard & soft iron calibration
 * @param  data_raw  Raw magnetometer data [mGauss]
 * @param  data_comp  Calibrated (compensated) data (hard & soft iron calibration) [mGauss]
 * @retval None
 */
void MotionMC_manager_compensate(MOTION_SENSOR_Axes_t *data_raw, MOTION_SENSOR_Axes_t *data_comp)
{
[#if useCortexM0]
  MMC_CM0P_Output_t data_out;
  MotionMC_CM0P_GetCalParams(&data_out);
[#else]
  MMC_Output_t data_out;
  MotionMC_GetCalParams(&data_out);
[/#if]

  float mag_raw_mG[3];
  float mag_comp_mG[3];

  mag_raw_mG[0] = (float)data_raw->x;
  mag_raw_mG[1] = (float)data_raw->y;
  mag_raw_mG[2] = (float)data_raw->z;

  /* Compensate magnetometer data */
  /* NOTE: Convert hard iron coeficients [uT] to [mGauss] */
  for (int i = 0; i < 3; i++)
  {
    mag_comp_mG[i] = 0.0f;
    for (int j = 0; j < 3; j++)
    {
[#if useCortexM0]
      mag_comp_mG[i] += (mag_raw_mG[j]  -  data_out.HI_Bias[j] * 10.0f)  *  data_out.SI_Matrix[i][j];
[#else]
      mag_comp_mG[i] += (mag_raw_mG[j]  -  data_out.HI_Bias[j] * 10.0f)  *  data_out.SF_Matrix[i][j];
[/#if]
    }

    mag_comp_mG[i] += (mag_comp_mG[i] >= 0.0f) ? 0.5f : -0.5f;
  }

  data_comp->x = (int32_t)mag_comp_mG[0];
  data_comp->y = (int32_t)mag_comp_mG[1];
  data_comp->z = (int32_t)mag_comp_mG[2];
}

/**
 * @brief  Convert magnetometer data value from [uT] to [mGauss]
 * @param  mag_val_uT  magnetometer data value [uT]
 * @retval magnetometer data value [mGauss]
 */
int32_t mag_val_to_mGauss(float mag_val_uT)
{
  float mGauss_float;

  if (mag_val_uT >= 0.0f)
  {
    mGauss_float = mag_val_uT * 10.0f  +  0.5f;
    return (int32_t)mGauss_float;
  }
  else
  {
    mGauss_float = mag_val_uT * 10.0f  -  0.5f;
    return (int32_t)mGauss_float;
  }
}

// NOTE: Must be implemented for each platform separately, because its implementation
//       is platform dependent. No need to call this function, library call this
//       function automatically.
/**
 * @brief  Load the calibration parameters from storage
 * @param  dataSize  size of data
 * @param  data  pointer to data
 * @retval Will return 0 the if it is success and 1 if it is failure
 */
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data)
{
  return 1; /* FAILURE: Read from NVM not implemented. */
}

// NOTE: Must be implemented for each platform separately, because its implementation
//       is platform dependent. No need to call this function, library call this
//       function automatically.
/**
 * @brief  Save the calibration parameters in storage
 * @param  dataSize  size of data
 * @param  data  pointer to data
 * @retval Will return 0 the if it is success and 1 if it is failure
 */
char MotionMC_SaveCalInNVM(unsigned short int datasize, unsigned int *data)
{
  return 1; /* FAILURE: Write to NVM not implemented. */
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
