[#ftl]
/**
 ******************************************************************************
 * @file    custom_mems_control_ex.h
 * @author  MEMS Application Team
 * @brief   This file contains the MEMS sensors interface for custom board
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) ${year} STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

 /* Define to prevent recursive inclusion -------------------------------------*/
#ifndef CUSTOM_MEMS_CONTROL_EX_H
#define CUSTOM_MEMS_CONTROL_EX_H

#ifdef __cplusplus
extern "C" {
#endif

#include "RTE_Components.h"

#if (defined BSP_MOTION_SENSORS)
#include "custom_motion_sensors.h"
#include "custom_motion_sensors_ex.h"
#endif

#if (defined BSP_ENV_SENSORS)
#include "custom_env_sensors.h"
#include "custom_env_sensors_ex.h"
#endif

void BSP_SENSOR_ACC_Read_Register(uint8_t Reg, uint8_t *Data);
void BSP_SENSOR_GYR_Read_Register(uint8_t Reg, uint8_t *Data);
void BSP_SENSOR_MAG_Read_Register(uint8_t Reg, uint8_t *Data);
void BSP_SENSOR_PRESS_Read_Register(uint8_t Reg, uint8_t *Data);
void BSP_SENSOR_TEMP_Read_Register(uint8_t Reg, uint8_t *Data);
void BSP_SENSOR_HUM_Read_Register(uint8_t Reg, uint8_t *Data);

void BSP_SENSOR_ACC_Write_Register(uint8_t Reg, uint8_t Data);
void BSP_SENSOR_GYR_Write_Register(uint8_t Reg, uint8_t Data);
void BSP_SENSOR_MAG_Write_Register(uint8_t Reg, uint8_t Data);
void BSP_SENSOR_PRESS_Write_Register(uint8_t Reg, uint8_t Data);
void BSP_SENSOR_TEMP_Write_Register(uint8_t Reg, uint8_t Data);
void BSP_SENSOR_HUM_Write_Register(uint8_t Reg, uint8_t Data);

#if ((defined CUSTOM_ALGOBUILDER_FW_TEMPLATE) || (defined CUSTOM_DATALOGFUSION_DEMO) || (defined CUSTOM_TILTSENSING_DEMO) || (defined CUSTOM_GESTURERECOGNITION_DEMO) || (defined CUSTOM_CARRYPOSITION_DEMO) || (defined CUSTOM_ECOMPASS_DEMO))
void BSP_SENSOR_ACC_GetOrientation(char *Orientation);
#endif
#if ((defined CUSTOM_ALGOBUILDER_FW_TEMPLATE) || (defined CUSTOM_DATALOGFUSION_DEMO))
void BSP_SENSOR_GYR_GetOrientation(char *Orientation);
#endif
#if ((defined CUSTOM_ALGOBUILDER_FW_TEMPLATE) || (defined CUSTOM_DATALOGFUSION_DEMO) || (defined CUSTOM_ECOMPASS_DEMO))
void BSP_SENSOR_MAG_GetOrientation(char *Orientation);
#endif

#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_SENSOR_ACC_SetDRDYMode(uint8_t Mode);
#endif
#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_SENSOR_GYR_SetDRDYMode(uint8_t Mode);
#endif
#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_SENSOR_ACC_SetDRDYInt(uint8_t Enable);
#endif
#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_SENSOR_GYR_SetDRDYInt(uint8_t Enable);
#endif

#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_ACC_GYR_Read_FSM_Data(uint8_t *Data);
#endif
#if (defined CUSTOM_ALGOBUILDER_FW_TEMPLATE)
void BSP_ACC_GYR_Read_MLC_Data(uint8_t *Data);
#endif

#endif /* CUSTOM_MEMS_CONTROL_EX_H */
