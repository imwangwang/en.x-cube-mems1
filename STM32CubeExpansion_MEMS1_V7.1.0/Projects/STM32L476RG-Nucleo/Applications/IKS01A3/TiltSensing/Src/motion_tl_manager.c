/**
 ******************************************************************************
 * @file    motion_tl_manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains Tilt Sensing interface functions
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
#include "motion_tl_manager.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup TILT_SENSING TILT SENSING
 * @{
 */

/* Extern variables ----------------------------------------------------------*/
/* Private defines -----------------------------------------------------------*/
#define CAL_DATA_NUM_RECORDS  100  /* Number of accelerometer data (3 axes per data) to be taken */

/* Private variables ---------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
/* Exported function prototypes ----------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize the MotionTL engine
 * @param  None
 * @retval None
 */
void MotionTL_manager_init(void)
{
  char acc_orientation[4];

  MotionTL_Initialize();

  BSP_SENSOR_ACC_GetOrientation(acc_orientation);
  MotionTL_SetOrientation_Acc(acc_orientation);
}

/**
 * @brief  Run Tilt Sensing algorithm
 * @param  data_in  Structure containing input data
 * @retval None
 */
void MotionTL_manager_run(MTL_input_t *data_in)
{
  MotionTL_Update(data_in);
}

/**
 * @brief  Get angles
 * @param  data_out   Structure containing output data
 * @param  angle_mode Switch mode to return desired angles
 * @retval None
 */
void MotionTL_manager_getAngles(MTL_output_t *data_out, MTL_angle_mode_t angle_mode)
{
  MotionTL_GetAngles(data_out, angle_mode);
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionTL_manager_get_version(char *version, int *length)
{
  *length = (int)MotionTL_GetLibVersion(version);
}

/**
 * @brief  Calibrate accelerometer in specific position - collect data and pass them to library
 * @param  cal_position Calibration position the data belong to
 * @retval None
 */
void MotionTL_manager_calibratePosition(MTL_cal_position_t cal_position)
{
  float cal_data[CAL_DATA_NUM_RECORDS][3];

  if (CollectData(cal_data, CAL_DATA_NUM_RECORDS) == 0)
  {
    MotionTL_CalibratePosition(cal_data, CAL_DATA_NUM_RECORDS, cal_position);
  }
}

/**
 * @brief  Get accelerometer calibration values from library
 * @param  acc_cal Pointer to calibration values structure
 * @retval Enum with calibration result
 */
MTL_cal_result_t MotionTL_manager_getCalibrationValues(MTL_acc_cal_t *acc_cal)
{
  return MotionTL_GetCalValues(acc_cal);
}

/**
 * @brief  Set accelerometer calibration values into library
 * @param  acc_cal Pointer to calibration values structure
 * @retval None
 */
void MotionTL_manager_setCalibrationValues(MTL_acc_cal_t *acc_cal)
{
  MotionTL_SetCalValues(acc_cal);
}

/**
 * @brief  Get estimated measurement time
 * @param  time_s Pointer to time in [s]
 * @retval None
 */
void MotionTL_manager_getEstimatedMeasTime(float *time_s)
{
  GetEstimatedMeasTime(time_s, CAL_DATA_NUM_RECORDS);
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