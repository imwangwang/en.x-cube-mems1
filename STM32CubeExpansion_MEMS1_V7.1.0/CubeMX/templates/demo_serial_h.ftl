[#ftl]
/**
 *******************************************************************************
 * @file    demo_serial.h
 * @author  MEMS Software Solutions Team
 * @brief   Header for demo_serial.c
 *******************************************************************************
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

[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = false]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = false]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = false]

[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3TILTSENSINGDEMO = false]
[#assign useIKS01A2TILTSENSINGDEMO = false]
[#assign useCUSTOMTILTSENSINGDEMO = false]

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

[#if define?contains("IKS01A3_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GYROSCOPECALIBRATION_DEMO")]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = true]
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

[#if define?contains("IKS01A3_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = true]
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef DEMO_SERIAL_H
#define DEMO_SERIAL_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "serial_protocol.h"
#include "serial_cmd.h"
[#if (useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO)]
#include "motion_fx_manager.h"
[/#if]
[#if (useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO)]
#include "motion_ac_manager.h"
[/#if]
[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
#include "motion_tl_manager.h"
[/#if]
#include "bsp_ip_conf.h"

/* Private defines -----------------------------------------------------------*/
#define SENDER_UART  0x01
#define SENDER_USB   0x02
#define SENDER_SPI   0x03

#define DEV_ADDR                   50U
#define I2C_DATA_MAX_LENGTH_BYTES  16
[#if (useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO || useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO || useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO)]
#define STREAMING_MSG_LENGTH       63
[/#if]
[#if (useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO)]
#define STREAMING_MSG_LENGTH      119
[/#if]
[#if (useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO)]
#define STREAMING_MSG_LENGTH       87
[/#if]
[#if (useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO || useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO)]
#define STREAMING_MSG_LENGTH      123
[/#if]
[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
#define STREAMING_MSG_LENGTH       71
[/#if]
[#if (useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO)]
#define STREAMING_MSG_LENGTH       82
[/#if]
[#if (useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO)]
#define STREAMING_MSG_LENGTH      129
[/#if]
#define MIN(A,B) ((A)<(B)?(A):(B))

[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
/* Algorithm-based defines */
#define CMD_ANGLE_MODE_PITCH_ROLL_GRAVITY_INCLINATION  0x01
#define CMD_ANGLE_MODE_THETA_PSI_PHI                   0x02
#define CMD_CAL_POS_LYING_NORMAL_ON_TABLE              0x03
#define CMD_CAL_POS_LYING_UPSIDEDOWN_ON_TABLE          0x04
#define CMD_CAL_POS_NUCLEO_CONNECTOR_DOWN              0x05
#define CMD_CAL_POS_NUCLEO_CONNECTOR_LEFT              0x06
#define CMD_CAL_POS_NUCLEO_CONNECTOR_UP                0x07
#define CMD_CAL_POS_NUCLEO_CONNECTOR_RIGHT             0x08
#define CMD_GET_CALIBRATION_COEFFICIENTS               0x09
#define CMD_GET_ESTIMATED_MEASUREMENT_TIME             0x0A
[/#if]

/* Exported defines ----------------------------------------------------------*/
/* Enable sensor masks */
#define PRESSURE_SENSOR                         0x00000001U
#define TEMPERATURE_SENSOR                      0x00000002U
#define HUMIDITY_SENSOR                         0x00000004U
#define UV_SENSOR                               0x00000008U /* for future use */
#define ACCELEROMETER_SENSOR                    0x00000010U
#define GYROSCOPE_SENSOR                        0x00000020U
#define MAGNETIC_SENSOR                         0x00000040U

/* Exported variables --------------------------------------------------------*/
extern volatile uint8_t DataLoggerActive;
extern volatile uint32_t SensorsEnabled;
[#if (useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO)]
extern uint8_t Enabled6X;
[/#if]
[#if (useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO)]
extern MAC_calibration_mode_t CalibrationMode;
[/#if]
[#if (useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO)]
extern MTL_angle_mode_t AngleMode;
[/#if]

/* Exported functions ------------------------------------------------------- */
void BUILD_REPLY_HEADER(TMsg *Msg);
void INIT_STREAMING_HEADER(TMsg *Msg);
void INIT_STREAMING_MSG(TMsg *Msg);
int HandleMSG(TMsg *Msg);

#ifdef __cplusplus
}
#endif

#endif /* DEMO_SERIAL_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
