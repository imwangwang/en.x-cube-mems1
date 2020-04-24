/**
 *******************************************************************************
 * @file    DemoSerial.h
 * @author  MEMS Software Solutions Team
 * @brief   Header for DemoSerial.c
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef DEMO_SERIAL_H
#define DEMO_SERIAL_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "cube_hal.h"
#include "serial_protocol.h"
#include "Serial_CMD.h"
#include "MotionTL_Manager.h"

/* Private defines -----------------------------------------------------------*/
#define SENDER_UART  0x01
#define SENDER_USB   0x02
#define SENDER_SPI   0x03

#define DEV_ADDR                        50U
#define I2C_DATA_MAX_LENGTH_BYTES       16
#define STREAMING_MSG_LENGTH           67
#define MIN(A,B) ((A)<(B)?(A):(B))

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

/* Exported variables --------------------------------------------------------*/
extern volatile uint8_t DataLoggerActive;
extern volatile uint32_t SensorsEnabled;
extern TIM_HandleTypeDef AlgoTimHandle;
extern MTL_angle_mode_t AngleMode;
extern UART_HandleTypeDef UartHandle;

/* Exported functions ------------------------------------------------------- */
int HandleMSG(TMsg *Msg);

/* Private functions ------------------------------------------------------- */
void BUILD_REPLY_HEADER(TMsg *Msg);
void INIT_STREAMING_MSG(TMsg *Msg);
void BUILD_NACK_HEADER(TMsg *Msg);
void INIT_STREAMING_HEADER(TMsg *Msg);

#ifdef __cplusplus
}
#endif

#endif /* DEMO_SERIAL_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
