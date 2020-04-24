[#ftl]
/**
 ******************************************************************************
 * @file    demo_serial.c
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

[#assign useIKS01A3INTENSITYDETECTIONDEMO = false]
[#assign useIKS01A2INTENSITYDETECTIONDEMO = false]
[#assign useCUSTOMINTENSITYDETECTIONDEMO = false]

[#assign useIKS01A3DATALOGFUSIONDEMO = false]
[#assign useIKS01A2DATALOGFUSIONDEMO = false]
[#assign useCUSTOMDATALOGFUSIONDEMO = false]

[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3TILTSENSINGDEMO = false]
[#assign useIKS01A2TILTSENSINGDEMO = false]
[#assign useCUSTOMTILTSENSINGDEMO = false]

[#assign useIKS01A3VERTICALCONTEXTDEMO = false]
[#assign useIKS01A2VERTICALCONTEXTDEMO = false]
[#assign useCUSTOMVERTICALCONTEXTDEMO = false]

[#assign useIKS01A3VERTICALCONTEXTDEMO = false]
[#assign useIKS01A2VERTICALCONTEXTDEMO = false]
[#assign useCUSTOMVERTICALCONTEXTDEMO = false]

[#assign useIKS01A3GESTURERECOGNITIONDEMO = false]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = false]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = false]

[#assign useIKS01A3CARRYPOSITIONDEMO = false]
[#assign useIKS01A2CARRYPOSITIONDEMO = false]
[#assign useCUSTOMCARRYPOSITIONDEMO = false]

[#assign useIKS01A3ECOMPASSDEMO = false]
[#assign useIKS01A2ECOMPASSDEMO = false]
[#assign useCUSTOMECOMPASSDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A3INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A2INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_INTENSITYDETECTION_DEMO")]
[#assign useCUSTOMINTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_DATALOGFUSION_DEMO")]
[#assign useIKS01A3DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_DATALOGFUSION_DEMO")]
[#assign useIKS01A2DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_DATALOGFUSION_DEMO")]
[#assign useCUSTOMDATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_TILTSENSING_DEMO")]
[#assign useIKS01A3TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A2_TILTSENSING_DEMO")]
[#assign useIKS01A2TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("CUSTOM_TILTSENSING_DEMO")]
[#assign useCUSTOMTILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A3_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A3VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A2VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("CUSTOM_VERTICALCONTEXT_DEMO")]
[#assign useCUSTOMVERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A3GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GESTURERECOGNITION_DEMO")]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_CARRYPOSITION_DEMO")]
[#assign useIKS01A3CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_CARRYPOSITION_DEMO")]
[#assign useIKS01A2CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_CARRYPOSITION_DEMO")]
[#assign useCUSTOMCARRYPOSITIONDEMO = true]
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
#include <stdint.h>
#include "com.h"
#include "demo_serial.h"
#include "app_x-cube-mems1.h"

#ifdef USE_CUSTOM_BOARD
#include "custom_mems_conf_app.h"
#endif

/** @addtogroup MOTION_APPLICATIONS MOTION APPLICATIONS
 * @{
 */

/* Private defines -----------------------------------------------------------*/
#ifndef ACC_GYR_UNICLEO_ID
#define ACC_GYR_UNICLEO_ID UNKNOWN_UNICLEO_ID
#endif

#ifndef MAG_UNICLEO_ID
#define MAG_UNICLEO_ID UNKNOWN_UNICLEO_ID
#endif

#ifndef HUM_TEMP_UNICLEO_ID
#define HUM_TEMP_UNICLEO_ID UNKNOWN_UNICLEO_ID
#endif

#ifndef PRESS_UNICLEO_ID
#define PRESS_UNICLEO_ID UNKNOWN_UNICLEO_ID
#endif

/* Private variables ---------------------------------------------------------*/
static volatile uint8_t DataStreamingDest = 1;

/* Private function prototypes -----------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
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
  int ret = 1;
  uint32_t i;
  char ps[64];
  uint32_t ps_len = 0;

[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
  float time_s;
  MTL_cal_result_t cal_result = CAL_FAIL;
  MTL_acc_cal_t acc_cal;
[/#if]

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

      Get_PresentationString(ps, &ps_len);

      i = 0;
      while (i < ps_len)
      {
        Msg->Data[3U + i] = ps[i];
        i++;
      }

      Msg->Len = 3U + i;
      UART_SendMsg(Msg);
      break;

    case CMD_PRESSURE_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], PRESS_UNICLEO_ID, 4);
      Msg->Len = 3 + 4;
      UART_SendMsg(Msg);
      break;

    case CMD_HUMIDITY_TEMPERATURE_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], HUM_TEMP_UNICLEO_ID, 4);
      Msg->Len = 3 + 4;
      UART_SendMsg(Msg);
      break;

    case CMD_ACCELERO_GYRO_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], ACC_GYR_UNICLEO_ID, 4);
      Msg->Len = 3 + 4;
      UART_SendMsg(Msg);
      break;

    case CMD_MAGNETO_Init:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      BUILD_REPLY_HEADER(Msg);
      Serialize_s32(&Msg->Data[3], MAG_UNICLEO_ID, 4);
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
      if ((SensorsEnabled & PRESSURE_SENSOR) == PRESSURE_SENSOR)
      {
        BSP_SENSOR_PRESS_Enable();
      }

      if ((SensorsEnabled & TEMPERATURE_SENSOR) == TEMPERATURE_SENSOR)
      {
        BSP_SENSOR_TEMP_Enable();
      }

      if ((SensorsEnabled & HUMIDITY_SENSOR) == HUMIDITY_SENSOR)
      {
        BSP_SENSOR_HUM_Enable();
      }

      if ((SensorsEnabled & ACCELEROMETER_SENSOR) == ACCELEROMETER_SENSOR)
      {
        BSP_SENSOR_ACC_Enable();
      }

      if ((SensorsEnabled & GYROSCOPE_SENSOR) == GYROSCOPE_SENSOR)
      {
        BSP_SENSOR_GYR_Enable();
      }

      if ((SensorsEnabled & MAGNETIC_SENSOR) == MAGNETIC_SENSOR)
      {
        BSP_SENSOR_MAG_Enable();
      }

      (void)HAL_TIM_Base_Start_IT(&BSP_IP_TIM_Handle);
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
      (void)HAL_TIM_Base_Stop_IT(&BSP_IP_TIM_Handle);

      /* Disable all sensors */
      BSP_SENSOR_ACC_Disable();
      BSP_SENSOR_GYR_Disable();
      BSP_SENSOR_MAG_Disable();
      BSP_SENSOR_PRESS_Disable();
      BSP_SENSOR_TEMP_Disable();
      BSP_SENSOR_HUM_Disable();

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

[#if (useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO)]
    case CMD_ChangeSF:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      Enabled6X = Msg->Data[3];

      if (Enabled6X == 1U)
      {
        MotionFX_manager_stop_9X();
        MotionFX_manager_start_6X();
      }
      else
      {
        MotionFX_manager_stop_6X();
        MotionFX_manager_start_9X();
      }

      BUILD_REPLY_HEADER(Msg);
      UART_SendMsg(Msg);
      break;
[/#if]

[#if (useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO)]
    case CMD_Calibration_Mode:
      if (Msg->Len < 3U)
      {
        return 0;
      }

      switch ((MAC_calibration_mode_t)Msg->Data[3])
      {
        case DYNAMIC_CALIBRATION:
        case SIX_POINT_CALIBRATION:
          CalibrationMode = (MAC_calibration_mode_t)Msg->Data[3];
          break;

        default:
          break;
      }

      BUILD_REPLY_HEADER(Msg);
      Msg->Len = 4;
      UART_SendMsg(Msg);
      break;
[/#if]

[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
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
          break;

        case CMD_CAL_POS_LYING_UPSIDEDOWN_ON_TABLE:
          MotionTL_manager_calibratePosition(Z_DOWN);
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_DOWN:
          MotionTL_manager_calibratePosition(Y_UP);
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_LEFT:
          MotionTL_manager_calibratePosition(X_DOWN);
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_UP:
          MotionTL_manager_calibratePosition(Y_DOWN);
          break;

        case CMD_CAL_POS_NUCLEO_CONNECTOR_RIGHT:
          MotionTL_manager_calibratePosition(X_UP);
          break;

        case CMD_GET_CALIBRATION_COEFFICIENTS:
          cal_result = MotionTL_manager_getCalibrationValues(&acc_cal);
          /* Leave byte [4] unused due to compatibility with other FWs */
          memcpy(&Msg->Data[5], acc_cal.offset, 3 * sizeof(float));
          memcpy(&Msg->Data[5 + 3 * sizeof(float)], acc_cal.gain, 3 * sizeof(float));
          Serialize_s32(&Msg->Data[5 + 6 * sizeof(float)], (uint8_t)cal_result, 1);
          Msg->Len = 5 + 6 * sizeof(float) + 1;
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
[/#if]

    default:
      ret = 0;
      break;
  }

  return ret;
}

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
