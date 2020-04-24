/**
 ******************************************************************************
 * @file    DemoSerial.c
 * @author  MEMS Software Solutions Team
 * @brief   Handle the Serial Protocol
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
#include <stdint.h>
#include "com.h"
#include "DemoSerial.h"

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/** @addtogroup TILT_SENSING TILT SENSING
 * @{
 */

/* Private defines -----------------------------------------------------------*/
#define ISM330DHCX_UNICLEO_ID      11
#define IIS2DLPC_UNICLEO_ID        12
#define IIS2MDC_UNICLEO_ID          4

#define FW_ID "16"
#define FW_VERSION "7.1.0"
#define LIB_VERSION "1.1.1"

#if (defined (USE_IKS02A1))
#define EXPANSION_BOARD "IKS02A1"
#else
#error Not supported shield
#endif

#define DATA_TX_LEN  MIN(4, DATABYTE_LEN)

/* Private variables ---------------------------------------------------------*/
static uint8_t PresentationString[] = {"MEMS shield demo,"FW_ID","FW_VERSION","LIB_VERSION","EXPANSION_BOARD};
static volatile uint8_t DataStreamingDest = 2;

/**
 * @brief  Build the reply header
 * @param  Msg the pointer to the message to be built
 * @retval None
 */
void BUILD_REPLY_HEADER(TMsg *Msg)
{
  Msg->Data[0] = Msg->Data[1];
  Msg->Data[1] = DEV_ADDR;
  Msg->Data[2] += CMD_Reply_Add;
}

/**
 * @brief  Initialize the streaming header
 * @param  Msg the pointer to the header to be initialized
 * @retval None
 */
void INIT_STREAMING_HEADER(TMsg *Msg)
{
  Msg->Data[0] = DataStreamingDest;
  Msg->Data[1] = DEV_ADDR;
  Msg->Data[2] = CMD_Start_Data_Streaming;
  Msg->Len = 3;
}

/**
 * @brief  Initialize the streaming message
 * @param  Msg the pointer to the message to be initialized
 * @retval None
 */
void INIT_STREAMING_MSG(TMsg *Msg)
{
  uint32_t i;

  Msg->Data[0] = DataStreamingDest;
  Msg->Data[1] = DEV_ADDR;
  Msg->Data[2] = CMD_Start_Data_Streaming;
  for (i = 3; i < STREAMING_MSG_LENGTH + 3; i++)
  {
    Msg->Data[i] = 0;
  }

  Msg->Len = 3;
}

/**
 * @brief  Handle a message
 * @param  Msg the pointer to the message to be handled
 * @retval 1 if the message is correctly handled, 0 otherwise
 */
int HandleMSG(TMsg *Msg)
/*  DestAddr | SouceAddr | CMD | PAYLOAD
 *      1          1        1       N
 */
{
  static uint32_t calibrations_performed = 0;
  int ret = 1;
  uint32_t i;
  float time_s;
  MTL_cal_result_t cal_result = CAL_FAIL;
  MTL_acc_cal_t acc_cal;

  if (Msg->Len < 2U)
  {
    return 0;
  }

  if (Msg->Data[0] != DEV_ADDR)
  {
    return 0;
  }

  switch (Msg->Data[2])   /* CMD */
  {
    case CMD_Ping:
      if (Msg->Len != 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 3;
      UART_SendMsg(Msg);
      break;

    case CMD_Enter_DFU_Mode:
      if (Msg->Len != 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 3;
      break;

    case CMD_Read_PresString:
      if (Msg->Len != 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);

      i = 0;
      while (i < (sizeof(PresentationString) - 1U))
      {
        Msg->Data[3U + i] = PresentationString[i];
        i++;
      }

      Msg->Len = 3U + i;
      UART_SendMsg(Msg);
      break;

    case CMD_ACCELERO_GYRO_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], ISM330DHCX_UNICLEO_ID, 4);
      Msg->Len = 3 + 4;
      UART_SendMsg(Msg);
      break;

    case CMD_MAGNETO_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], IIS2MDC_UNICLEO_ID, 4);
      Msg->Len = 3 + 4;
      UART_SendMsg(Msg);
      break;

    case CMD_Start_Data_Streaming:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      SensorsEnabled = Deserialize(&Msg->Data[3], 4);

      /* Start enabled sensors */
      if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
      {
        (void)IKS02A1_MOTION_SENSOR_Enable(IKS02A1_ISM330DHCX_0, MOTION_ACCELERO);
      }

      if ((SensorsEnabled & GYROSCOPE_SENSOR) == GYROSCOPE_SENSOR)
      {
        (void)IKS02A1_MOTION_SENSOR_Enable(IKS02A1_ISM330DHCX_0, MOTION_GYRO);
      }

      if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
      {
        (void)IKS02A1_MOTION_SENSOR_Enable(IKS02A1_IIS2MDC_0, MOTION_MAGNETO);
      }

      (void)HAL_TIM_Base_Start_IT(&AlgoTimHandle);
      DataLoggerActive = 1;

      DataStreamingDest = Msg->Data[1];
      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 3;
      UART_SendMsg(Msg);
      break;

    case CMD_Stop_Data_Streaming:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      DataLoggerActive = 0;
      (void)HAL_TIM_Base_Stop_IT(&AlgoTimHandle);

      /* Disable all sensors */
      (void)IKS02A1_MOTION_SENSOR_Disable(IKS02A1_ISM330DHCX_0, MOTION_ACCELERO);
      (void)IKS02A1_MOTION_SENSOR_Disable(IKS02A1_ISM330DHCX_0, MOTION_GYRO);
      (void)IKS02A1_MOTION_SENSOR_Disable(IKS02A1_IIS2MDC_0, MOTION_MAGNETO);

      SensorsEnabled = 0;

      BUILD_REPLY_HEADER(Msg);
      UART_SendMsg(Msg);
      break;

    case CMD_Set_DateTime:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 3;
      RTC_TimeRegulate(Msg->Data[3], Msg->Data[4], Msg->Data[5]);
      RTC_DateRegulate(Msg->Data[6], Msg->Data[7], Msg->Data[8], Msg->Data[9]);
      UART_SendMsg(Msg);
      break;

    case CMD_Angle_Mode_Cal_Pos:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 4;

      /* Commands */
      switch (Msg->Data[3])
      {
        case CMD_ANGLE_MODE_PITCH_ROLL_GRAVITY_INCLINATION:
          AngleMode = MODE_PITCH_ROLL_GRAVITY_INCLINATION;
          break;

        case CMD_ANGLE_MODE_THETA_PSI_PHI:
          AngleMode = MODE_THETA_PSI_PHI;
          break;

        case CMD_CAL_POS_LYING_NORMAL_ON_TABLE:
          MotionTL_manager_calibratePosition(Z_UP);
          calibrations_performed++;
          break;

        case CMD_CAL_POS_LYING_UPSIDEDOWN_ON_TABLE:
          MotionTL_manager_calibratePosition(Z_DOWN);
          calibrations_performed++;
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_DOWN:
          MotionTL_manager_calibratePosition(Y_UP);
          calibrations_performed++;
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_LEFT:
          MotionTL_manager_calibratePosition(X_DOWN);
          calibrations_performed++;
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_UP:
          MotionTL_manager_calibratePosition(Y_DOWN);
          calibrations_performed++;
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_RIGHT:
          MotionTL_manager_calibratePosition(X_UP);
          calibrations_performed++;
          break;

        case CMD_GET_CALIBRATION_COEFFICIENTS:
          cal_result = MotionTL_manager_getCalibrationValues(&acc_cal);
          /* Leave byte [4] unused due to compatibility with other FWs */
          memcpy(&Msg->Data[5], acc_cal.offset, 3 * sizeof(float));
          memcpy(&Msg->Data[5 + 3 * sizeof(float)], acc_cal.gain, 3 * sizeof(float));
          Serialize_s32(&Msg->Data[5 + 6 * sizeof(float)], (uint8_t)cal_result, 1);
          Msg->Len = 5 + 6 * sizeof(float) + 1;
          /* Save calibration values only when ... */
          if (calibrations_performed >= 6) /* ... all 6 axes have been calibrated and ... */
          {
            if (cal_result == CAL_PASS) /* ... calibration passed */
            {
              MotionTL_manager_SaveCalValuesInNVM(&acc_cal);
            }
            calibrations_performed = 0;
        	}
          break;

        case CMD_GET_ESTIMATED_MEASUREMENT_TIME:
          MotionTL_manager_getEstimatedMeasTime(&time_s);
          /* Leave byte [4] unused due to compatibility with other FWs */
          memcpy(&Msg->Data[5], &time_s, sizeof(float));
          Msg->Len = 5 + 1 * sizeof(float);
          break;

        default:
          break;
      }

      UART_SendMsg(Msg);
      break;

    default:
      ret = 0;
      break;
  }

  return ret;
}

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
