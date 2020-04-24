/**
 ******************************************************************************
 * @file    MotionEC_Manager.c
 * @author  MEMS Software Solutions Team
 * @brief   This file contains E-Compass interface functions
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
#include <math.h>
#include "MotionEC_Manager.h"
#include "main.h"
#include "motion_ec.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup E_COMPASS E_COMPASS
 * @{
 */

/* Private defines -----------------------------------------------------------*/
#ifndef M_PI
#define M_PI  (3.141593f)
#endif

/* Private variables ---------------------------------------------------------*/
/* Transformation matrices: XYZ frame -> ENU frame
 * Note: These matrices describe how to transform on-board orientation of each
 * individual sensor component to common East-North-Up (ENU) orientation of
 * whole device.
 */
#if (defined (USE_IKS02A1))
static float ISM330DHCX_0_Matrix[3][3] = {{0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0}, {0.0, 0.0, 1.0}}; // ACC, GYRO
static float IIS2MDC_0_Matrix[3][3]    = {{0.0, 1.0, 0.0}, {1.0, 0.0, 0.0}, {0.0, 0.0, 1.0}}; // MAG

#else
#error "ERROR: Unknown MEMS shield!"
#endif

/* Private function prototypes -----------------------------------------------*/
static int calc_heading(float *heading, float v_head[]);
static void q_conjug(float q_conj[], float q_src[]);
static void q_multiply(float q_res[], float q_a[], float q_b[]);
static void transform_xyz_to_enu(IKS02A1_MOTION_SENSOR_Axes_t *input, float output[], float matrix[][3]);
static void v_rotate(float v_new[], float q_rot[], float v_old[]);

/* Exported functions --------------------------------------------------------*/
/**
 * @brief  Initialize and reset the MotionEC engine
 * @param  freq  Sensors sampling frequency [Hz]
 * @retval None
 */
void MotionEC_manager_init(float freq)
{
  MotionEC_Initialize(&freq);
  MotionEC_SetOrientationEnable(MEC_ENABLE);
  MotionEC_SetVirtualGyroEnable(MEC_ENABLE);
  MotionEC_SetGravityEnable(MEC_ENABLE);
  MotionEC_SetLinearAccEnable(MEC_ENABLE);
}

/**
 * @brief  Run E-Compass algorithm (accelerometer and magnetometer data fusion)
 * @param  Msg  Data stream
 * @retval None
 */
void MotionEC_manager_run(TMsg *Msg)
{
  MEC_input_t  data_in;
  MEC_output_t data_out;

  if ((SensorsEnabled & ACCELEROMETER_SENSOR) != ACCELEROMETER_SENSOR)
  {
    return;
  }

  if ((SensorsEnabled & MAGNETIC_SENSOR) != MAGNETIC_SENSOR)
  {
    return;
  }

/* Do sensor orientation transformation */
#if (defined (USE_IKS02A1))
  transform_xyz_to_enu(&AccValue, data_in.acc, ISM330DHCX_0_Matrix);
  transform_xyz_to_enu(&MagValueComp, data_in.mag, IIS2MDC_0_Matrix);

#else
#error "ERROR: Unknown MEMS shield!"
#endif

  /* Raw accelerometer data [g] */
  data_in.acc[0] = data_in.acc[0] / 1000.0f; /* East */
  data_in.acc[1] = data_in.acc[1] / 1000.0f; /* North */
  data_in.acc[2] = data_in.acc[2] / 1000.0f; /* Up */

  /* Compensated magnetometer data [uT / 50], [mGauss / 5] */
  data_in.mag[0] = data_in.mag[0] / 5.0f; /* East */
  data_in.mag[1] = data_in.mag[1] / 5.0f; /* North */
  data_in.mag[2] = data_in.mag[2] / 5.0f; /* Up */

  /* Delta time [s] */
  data_in.deltatime_s = (float)ALGO_PERIOD / 1000.0f;

  /* Run E-Compass algorithm */
  BSP_LED_On(LED2);
  MotionEC_Run(&data_in, &data_out);
  BSP_LED_Off(LED2);

  /* Write data to output stream */
  FloatToArray(&Msg->Data[55], data_out.quaternion[0]);
  FloatToArray(&Msg->Data[59], data_out.quaternion[1]);
  FloatToArray(&Msg->Data[63], data_out.quaternion[2]);
  FloatToArray(&Msg->Data[67], data_out.quaternion[3]);

  FloatToArray(&Msg->Data[71], data_out.euler[0]);
  FloatToArray(&Msg->Data[75], data_out.euler[1]);
  FloatToArray(&Msg->Data[79], data_out.euler[2]);

  FloatToArray(&Msg->Data[83], data_out.i_gyro[0]);
  FloatToArray(&Msg->Data[87], data_out.i_gyro[1]);
  FloatToArray(&Msg->Data[91], data_out.i_gyro[2]);

  FloatToArray(&Msg->Data[95], data_out.gravity[0]);
  FloatToArray(&Msg->Data[99], data_out.gravity[1]);
  FloatToArray(&Msg->Data[103], data_out.gravity[2]);

  FloatToArray(&Msg->Data[107], data_out.linear[0]);
  FloatToArray(&Msg->Data[111], data_out.linear[1]);
  FloatToArray(&Msg->Data[115], data_out.linear[2]);

  float v_base[3] = {0.0, 1.0, 0.0};
  float v_head[3];
  float heading;
  int heading_valid;

  v_rotate(v_head, data_out.quaternion, v_base);
  heading_valid = calc_heading(&heading, v_head);

  FloatToArray(&Msg->Data[119], heading);
  Msg->Data[123] = (uint8_t)heading_valid;
}

/**
 * @brief  Get the library version
 * @param  version  Library version string (must be array of 35 char)
 * @param  length  Library version string length
 * @retval None
 */
void MotionEC_manager_get_version(char *version, int *length)
{
  *length = (int)MotionEC_GetLibVersion(version);
}

/* Private functions ---------------------------------------------------------*/
/**
 * @brief  Calculate heading.
 * @param  heading Device heading in range <0, 360) degrees
 * @param  v_head  Device orientation vector for heading
 * @retval 1 in case of success, 0 otherwise
 */
static int calc_heading(float *heading, float v_head[])
{
  const float tol_deg = 5.0f; /* Tolerance [deg] */
  float tolerance = sinf(tol_deg * M_PI / 180.0f);

  if (v_head[0] > (-1.0f) * tolerance && v_head[0] < tolerance
      && v_head[1] > (-1.0f) * tolerance && v_head[1] < tolerance)
  {
    *heading = 0.0f;
    return 0; /* Device is pointing up or down - it is impossible to evaluate heading */
  }

  else
  {
    *heading = atan2f(v_head[0], v_head[1]) * 180.0f / M_PI;
    *heading = floorf(*heading * 100.0f + 0.5f) / 100.0f;          /* Rounds number to two decimal digits */
    *heading = (*heading < 0.0f) ? (*heading + 360.0f) : *heading; /* Change negative value to be in range <0,360) */
    return 1;
  }
}

/**
 * @brief  Create conjugated quaternion.
 * @param  q_conj  Conjugated quaternion
 * @param  q_src   Source quaternion
 * @retval None
 */
static void q_conjug(float q_conj[], float q_src[])
{
  q_conj[0] = (-1.0f) * q_src[0];
  q_conj[1] = (-1.0f) * q_src[1];
  q_conj[2] = (-1.0f) * q_src[2];
  q_conj[3] =           q_src[3];

  return;
}

/**
 * @brief  Do quaternion multiplication.
 * @param  q_res  Quaternion multiplication result: q_res = q_a q_b
 * @param  q_a    Quaternion A
 * @param  q_b    Quaternion B
 * @retval None
 */
static void q_multiply(float q_res[], float q_a[], float q_b[])
{
  q_res[0] =
    q_a[3] * q_b[0]
    + q_a[0] * q_b[3]
    + q_a[1] * q_b[2]
    - q_a[2] * q_b[1]
    ;

  q_res[1] =
    q_a[3] * q_b[1]
    + q_a[1] * q_b[3]
    + q_a[2] * q_b[0]
    - q_a[0] * q_b[2]
    ;

  q_res[2] =
    q_a[3] * q_b[2]
    + q_a[2] * q_b[3]
    + q_a[0] * q_b[1]
    - q_a[1] * q_b[0]
    ;

  q_res[3] =
    q_a[3] * q_b[3]
    - q_a[0] * q_b[0]
    - q_a[1] * q_b[1]
    - q_a[2] * q_b[2]
    ;

  return;
}

/**
 * @brief  Transform from X, Y, Z (XYZ) frame to East, North, Up (ENU) frame.
 * @param  input
 * @retval None
 */
static void transform_xyz_to_enu(IKS02A1_MOTION_SENSOR_Axes_t *input, float output[], float matrix[][3])
{
  output[0] = matrix[0][0] * (float)input->x  +  matrix[0][1] * (float)input->y  +  matrix[0][2] * (float)input->z;
  output[1] = matrix[1][0] * (float)input->x  +  matrix[1][1] * (float)input->y  +  matrix[1][2] * (float)input->z;
  output[2] = matrix[2][0] * (float)input->x  +  matrix[2][1] * (float)input->y  +  matrix[2][2] * (float)input->z;

  return;
}

/**
 * @brief  Rotate vector using quaternion. Uses following equation:
 *           v_new = q_rot v_old q_rot_inv
 *
 * @param  v_new  Vector after rotation
 * @param  q_rot  Rotation quaternion
 * @param  v_old  Vector before rotation
 * @retval None
 */
static void v_rotate(float v_new[], float q_rot[], float v_old[])
{
  float q_old[4];
  float q_new[4];
  float q_rot_inv[4];
  float q_temp[4];

  /* Create quaternion from old position vector */
  q_old[0] = v_old[0];
  q_old[1] = v_old[1];
  q_old[2] = v_old[2];
  q_old[3] = 0.0f;

  q_conjug(q_rot_inv, q_rot);
  q_multiply(q_temp, q_old, q_rot_inv);
  q_multiply(q_new, q_rot, q_temp);

  v_new[0] = q_new[0];
  v_new[1] = q_new[1];
  v_new[2] = q_new[2];

  return;
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
