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
#include "main.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup E_COMPASS E_COMPASS
 * @{
 */

/* Extern variables ----------------------------------------------------------*/
volatile uint32_t TimeStamp = 0;

/* Exported function prototypes ----------------------------------------------*/
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data);
char MotionMC_SaveCalInNVM(unsigned short int datasize, unsigned int *data);

/* Exported functions --------------------------------------------------------*/
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
/**
 * @brief  Initialize the MotionMC engine
 * @param  sampletime period in milliseconds [ms] between the update function call
 * @param  enable enable (1) or disable (0) library
 * @retval None
 */
void MotionMC_manager_init(int sampletime, unsigned short int enable)
{
  MotionMC_Initialize(sampletime, enable);
}

/**
 * @brief  Run Magnetometer Calibration algorithm
 * @param  data_in  Structure containing input data
 * @retval None
 */
void MotionMC_manager_update(MMC_Input_t *data_in)
{
  MotionMC_Update(data_in);
}

/**
 * @brief  Get the magnetometer calibration values for hard/soft iron
 * @param  data_out  Structure containing output data
 * @retval None
 */
void MotionMC_manager_get_params(MMC_Output_t *data_out)
{
  MotionMC_GetCalParams(data_out);
}

#elif (defined (USE_STM32L0XX_NUCLEO))
/**
 * @brief  Initialize the MotionMC engine
 * @param  sampletime period in milliseconds [ms] between the update function call
 * @param  mode  calibration mode type, hard-iron only mode (faster) or hard-iron + soft-iron
 * @param  enable enable (1) or disable (0) library
 * @retval None
 */
void MotionMC_manager_init(int sampletime, MMC_CM0P_Mode_t mode, unsigned short int enable)
{
  MotionMC_CM0P_Initialize(sampletime, mode, enable);
}

/**
 * @brief  Run Magnetometer Calibration algorithm
 * @param  data_in  Structure containing input data
 * @retval None
 */
void MotionMC_manager_update(MMC_CM0P_Input_t *data_in)
{
  MotionMC_CM0P_Update(data_in);
}

/**
 * @brief  Get the magnetometer calibration values for hard/soft iron
 * @param  data_out  Structure containing output data
 * @retval None
 */
void MotionMC_manager_get_params(MMC_CM0P_Output_t *data_out)
{
  MotionMC_CM0P_GetCalParams(data_out);
}

#else
#error Not supported platform
#endif

/**
 * @brief  Run Magnetometer Calibration algorithm
 * @param  Msg  Data stream
 * @retval None
 */
void MotionMC_manager_run(TMsg *Msg)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
  MMC_Input_t  data_in;
  MMC_Output_t data_out;

#elif (defined (USE_STM32L0XX_NUCLEO))
  MMC_CM0P_Input_t  data_in;
  MMC_CM0P_Output_t data_out;

#else
#error Not supported platform
#endif

  /* Convert magnetometer data from [mGauss] to [uT] */
  data_in.Mag[0] = (float)MagValue.x / 10.0f;
  data_in.Mag[1] = (float)MagValue.y / 10.0f;
  data_in.Mag[2] = (float)MagValue.z / 10.0f;

#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
  /* Time stamp [ms] */
  data_in.TimeStamp = (int)TimeStamp;
#endif

  /* Run Magnetometer Calibration algorithm */
  MotionMC_manager_update(&data_in);

  /* Get the magnetometer compensation for hard/soft iron */
  MotionMC_manager_get_params(&data_out);

  /* Do hard & soft iron calibration */
  MotionMC_manager_compensate(&MagValue, &MagValueComp);

  /* Calibrated data */
  /* NOTE: Magnetometer data unit is [mGauss] */
  Serialize_s32(&Msg->Data[43], MagValueComp.x, 4);
  Serialize_s32(&Msg->Data[47], MagValueComp.y, 4);
  Serialize_s32(&Msg->Data[51], MagValueComp.z, 4);

  /* Calibration quality */
  Msg->Data[124] = (uint8_t)data_out.CalQuality;
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionMC_manager_get_version(char *version, int *length)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
  *length = (int)MotionMC_GetLibVersion(version);

#elif (defined (USE_STM32L0XX_NUCLEO))
  *length = (int)MotionMC_CM0P_GetLibVersion(version);

#else
#error Not supported platform
#endif
}

/**
 * @brief  Do hard & soft iron calibration
 * @param  data_raw  Raw magnetometer data [mGauss]
 * @param  data_comp  Calibrated (compensated) data (hard & soft iron calibration) [mGauss]
 * @retval None
 */
void MotionMC_manager_compensate(IKS02A1_MOTION_SENSOR_Axes_t *data_raw, IKS02A1_MOTION_SENSOR_Axes_t *data_comp)
{
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
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
#if ((defined (USE_STM32F4XX_NUCLEO)) || (defined (USE_STM32L1XX_NUCLEO)) || (defined (USE_STM32L4XX_NUCLEO)))
      mag_comp_mG[i] += (mag_raw_mG[j] - data_out.HI_Bias[j] * 10.0f) * data_out.SF_Matrix[i][j];

#elif (defined (USE_STM32L0XX_NUCLEO))
      mag_comp_mG[i] += (mag_raw_mG[j] - data_out.HI_Bias[j] * 10.0f) * data_out.SI_Matrix[i][j];

#else
#error Not supported platform
#endif
    }

    /* MISRA C-2012 rule 10.1_R3 violation for purpose */
    mag_comp_mG[i] += (mag_comp_mG[i] >= 0.0f) ? 0.5f : -0.5f;
  }

  data_comp->x = (int32_t)mag_comp_mG[0];
  data_comp->y = (int32_t)mag_comp_mG[1];
  data_comp->z = (int32_t)mag_comp_mG[2];
}

/* TODO: Must be implemented for each platform separately, because its implementation is platform dependent.
         No need to call this function, library call this function automatically */
/**
 * @brief  Load the calibration parameters from storage
 * @param  data_size  size of data
 * @param  data  pointer of data
 * @retval Will return 0 the if it is success and 1 if it is failure
 */
char MotionMC_LoadCalFromNVM(unsigned short int datasize, unsigned int *data)
{
  return (char)1; /* FAILURE: Read from NVM not implemented. */
}

/* TODO: Must be implemented for each platform separately, because its implementation is platform dependent.
         No need to call this function, library call this function automatically */
/**
 * @brief  Save the calibration parameters in storage
 * @param  data_size  size of data
 * @param  data  pointer of data
 * @retval Will return 0 the if it is success and 1 if it is failure
 */
char MotionMC_SaveCalInNVM(unsigned short int datasize, unsigned int *data)
{
  return (char)1; /* FAILURE: Write to NVM not implemented. */
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
