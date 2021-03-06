/**
 ******************************************************************************
 * @file    MotionMC_Manager.c
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

/* Includes ------------------------------------------------------------------*/
#include "MotionMC_Manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup MAGNETOMETER_CALIBRATION MAGNETOMETER CALIBRATION
 * @{
 */

/* Private typedef -----------------------------------------------------------*/
/* Exported functions prototypes ---------------------------------------------*/
// TODO: Must be implemented for each platform separately, because its implementation
//       is platform dependend. No need to call this function, library call this
//       function automatically.
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data);

// TODO: Must be implemented for each platform separately, because its implementation
//       is platform dependend. No need to call this function, library call this
//       function automatically.
char MotionMC_SaveCalInNVM(unsigned short int datasize, unsigned int *data);

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Initialize the MotionMC engine
  * @param  sampletime period in milliseconds [ms] between the update function call
  * @param  enable enable (1) or disable (0) library
  * @retval None
  */
void MotionMC_manager_init(int sampletime, unsigned short int enable)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  MotionMC_Initialize(sampletime, enable);
#elif (defined (USE_STM32L0XX_NUCLEO))
  MotionMC_CM0P_Initialize(sampletime, MMC_CM0P_HI_AND_SI, enable);
#else
#error Not supported platform
#endif
}

/**
  * @brief  Run Magnetometer Calibration algorithm
  * @param  data_in  Structure containing input data
  * @retval none
  */
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
void MotionMC_manager_update(MMC_Input_t *data_in)
#elif (defined (USE_STM32L0XX_NUCLEO))
void MotionMC_manager_update(MMC_CM0P_Input_t *data_in)
#else
#error Not supported platform
#endif
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  MotionMC_Update(data_in);
#elif (defined (USE_STM32L0XX_NUCLEO))
  MotionMC_CM0P_Update(data_in);
#else
#error Not supported platform
#endif
}

/**
  * @brief  Get the magnetometer calibration values for hard/soft iron.
  * @param  data_out  Structure containing output data
  * @retval none
  */
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
void MotionMC_manager_get_params(MMC_Output_t *data_out)
#elif (defined (USE_STM32L0XX_NUCLEO))
void MotionMC_manager_get_params(MMC_CM0P_Output_t *data_out)
#else
#error Not supported platform
#endif
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  MotionMC_GetCalParams(data_out);
#elif (defined (USE_STM32L0XX_NUCLEO))
  MotionMC_CM0P_GetCalParams(data_out);
#else
#error Not supported platform
#endif
}

/**
  * @brief  Get the library version
  * @param  version  Library version string (must be array of 35 char)
  * @param  length  Library version string length
  * @retval none
  */
void MotionMC_manager_get_version(char *version, int *length)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  *length = MotionMC_GetLibVersion(version);
#elif (defined (USE_STM32L0XX_NUCLEO))
  *length = MotionMC_CM0P_GetLibVersion(version);
#else
#error Not supported platform
#endif
}

/**
  * @brief  Do hard & soft iron calibration
  * @param  data_raw  Raw magnetometer data [mGauss]
  * @param  data_comp  Calibrated (compensated) data (hard & soft iron calibration) [mGauss]
  * @retval none
  */
void MotionMC_manager_compensate(IKS02A1_MOTION_SENSOR_Axes_t *data_raw, IKS02A1_MOTION_SENSOR_Axes_t *data_comp)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
  MMC_Output_t data_out;
  MotionMC_GetCalParams(&data_out);
#elif (defined (USE_STM32L0XX_NUCLEO))
  MMC_CM0P_Output_t data_out;
  MotionMC_CM0P_GetCalParams(&data_out);
#else
#error Not supported platform
#endif

  float mag_raw_mG[3];
  float mag_comp_mG[3];

  mag_raw_mG[0] = data_raw->x;
  mag_raw_mG[1] = data_raw->y;
  mag_raw_mG[2] = data_raw->z;

  /* Compensate magnetometer data */
  /* NOTE: Convert hard iron coeficients [uT] to [mGauss] */
  for (int i = 0; i < 3; i++)
  {
    mag_comp_mG[i] = 0;
    for (int j = 0; j < 3; j++)
    {
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)))
      mag_comp_mG[i] += (mag_raw_mG[j]  -  data_out.HI_Bias[j] * 10.0f)  *  data_out.SF_Matrix[i][j];
#elif (defined (USE_STM32L0XX_NUCLEO))
      mag_comp_mG[i] += (mag_raw_mG[j]  -  data_out.HI_Bias[j] * 10.0f)  *  data_out.SI_Matrix[i][j];
#else
#error Not supported platform
#endif
    }

    mag_comp_mG[i] += (mag_comp_mG[i] >= 0) ? 0.5f : -0.5f;
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
  if (mag_val_uT >= 0)
  {
    return (int32_t)(mag_val_uT * 10.0f  +  0.5f);
  }

  else
  {
    return (int32_t)(mag_val_uT * 10.0f  -  0.5f);
  }
}

// TODO: Must be implemented for each platform separately, because its implementation
//       is platform dependend. No need to call this function, library call this
//       function automatically.
/**
  * @brief Load the calibration parameters from storage
  * @param dataSize  size of data
  * @param data  pointer to data
  * @retval Will return 0 the if it is sucess and 1 if it is failure
 */
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data)
{
  return 1; /* FAILURE: Read from NVM not implemented. */
}

// TODO: Must be implemented for each platform separately, because its implementation
//       is platform dependend. No need to call this function, library call this
//       function automatically.
/**
  * @brief Save the calibration parameters in storage
  * @param dataSize  size of data
  * @param data  pointer to data
  * @retval Will return 0 the if it is sucess and 1 if it is failure
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

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
