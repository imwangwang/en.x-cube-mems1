[#ftl]
/**
 ******************************************************************************
 * @file    custom_motion_sensors.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the BSP Motion Sensors interface for custom boards
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
#ifndef __CUSTOM_MOTION_SENSORS_H__
#define __CUSTOM_MOTION_SENSORS_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
[#if includes??]
[#list includes as include]
#include "${include}"
[/#list]
[/#if]

[#assign useLSM6DSLI2C = false]
[#assign useLSM6DSLSPI = false]
[#assign useLSM303AGRI2C = false]
[#assign useLIS3MDLI2C = false]
[#assign useLIS3MDLSPI = false]
[#assign useLSM6DSOI2C = false]
[#assign useLSM6DSOSPI = false]
[#assign useLIS2DW12I2C = false]
[#assign useLIS2DW12SPI = false]
[#assign useLIS2MDLI2C = false]
[#assign useLIS2MDLSPI = false]
[#assign useLSM6DSOXI2C = false]
[#assign useLSM6DSOXSPI = false]
[#assign useLIS2DH12I2C = false]
[#assign useLIS2DH12SPI = false]
[#assign useASM330LHHI2C = false]
[#assign useASM330LHHSPI = false]
[#assign useISM330DLCI2C = false]
[#assign useISM330DLCSPI = false]
[#assign useISM303DACI2C = false]
[#assign useIIS2DLPCI2C = false]
[#assign useIIS2DLPCSPI = false]
[#assign useIIS2MDCI2C = false]
[#assign useIIS2MDCSPI = false]
[#assign useISM330DHCXI2C = false]
[#assign useISM330DHCXSPI = false]
[#assign useLSM6DSRI2C = false]
[#assign useLSM6DSRSPI = false]
[#assign useAIS2DW12I2C = false]
[#assign useAIS2DW12SPI = false]
[#assign useA3G4250DI2C = false]
[#assign useA3G4250DSPI = false]
[#assign useAIS328DQI2C = false]
[#assign useAIS328DQSPI = false]
[#assign useAIS3624DQI2C = false]
[#assign useAIS3624DQSPI = false]
[#assign useH3LIS331DLI2C = false]
[#assign useH3LIS331DLSPI = false]
[#assign useLSM6DSRXI2C = false]
[#assign useLSM6DSRXSPI = false]
[#assign valueMEMSInstance = "0"]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("LSM6DSL_ACCGYR_I2C")]
[#assign useLSM6DSLI2C = true]
[/#if]

[#if define?contains("LSM6DSL_ACCGYR_SPI")]
[#assign useLSM6DSLSPI = true]
[/#if]

[#if define?contains("LSM303AGR_ACCMAG_I2C")]
[#assign useLSM303AGRI2C = true]
[/#if]

[#if define?contains("LIS3MDL_MAG_I2C")]
[#assign useLIS3MDLI2C = true]
[/#if]

[#if define?contains("LIS3MDL_MAG_SPI")]
[#assign useLIS3MDLSPI = true]
[/#if]

[#if define?contains("LSM6DSO_ACCGYR_I2C")]
[#assign useLSM6DSOI2C = true]
[/#if]

[#if define?contains("LSM6DSO_ACCGYR_SPI")]
[#assign useLSM6DSOSPI = true]
[/#if]

[#if define?contains("LIS2DW12_ACC_I2C")]
[#assign useLIS2DW12I2C = true]
[/#if]

[#if define?contains("LIS2DW12_ACC_SPI")]
[#assign useLIS2DW12SPI = true]
[/#if]

[#if define?contains("LIS2MDL_MAG_I2C")]
[#assign useLIS2MDLI2C = true]
[/#if]

[#if define?contains("LIS2MDL_MAG_SPI")]
[#assign useLIS2MDLSPI = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR_I2C")]
[#assign useLSM6DSOXI2C = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR_SPI")]
[#assign useLSM6DSOXSPI = true]
[/#if]

[#if define?contains("LIS2DH12_ACC_I2C")]
[#assign useLIS2DH12I2C = true]
[/#if]

[#if define?contains("LIS2DH12_ACC_SPI")]
[#assign useLIS2DH12SPI = true]
[/#if]

[#if define?contains("ASM330LHH_ACCGYR_I2C")]
[#assign useASM330LHHI2C = true]
[/#if]

[#if define?contains("ASM330LHH_ACCGYR_SPI")]
[#assign useASM330LHHSPI = true]
[/#if]

[#if define?contains("ISM330DLC_ACCGYR_I2C")]
[#assign useISM330DLCI2C = true]
[/#if]

[#if define?contains("ISM330DLC_ACCGYR_SPI")]
[#assign useISM330DLCSPI = true]
[/#if]

[#if define?contains("ISM303DAC_ACCMAG_I2C")]
[#assign useISM303DACI2C = true]
[/#if]

[#if define?contains("IIS2DLPC_ACC_I2C")]
[#assign useIIS2DLPCI2C = true]
[/#if]

[#if define?contains("IIS2DLPC_ACC_SPI")]
[#assign useIIS2DLPCSPI = true]
[/#if]

[#if define?contains("IIS2MDC_MAG_I2C")]
[#assign useIIS2MDCI2C = true]
[/#if]

[#if define?contains("IIS2MDC_MAG_SPI")]
[#assign useIIS2MDCSPI = true]
[/#if]

[#if define?contains("ISM330DHCX_ACCGYR_I2C")]
[#assign useISM330DHCXI2C = true]
[/#if]

[#if define?contains("ISM330DHCX_ACCGYR_SPI")]
[#assign useISM330DHCXSPI = true]
[/#if]

[#if define?contains("LSM6DSR_ACCGYR_I2C")]
[#assign useLSM6DSRI2C = true]
[/#if]

[#if define?contains("LSM6DSR_ACCGYR_SPI")]
[#assign useLSM6DSRSPI = true]
[/#if]

[#if define?contains("AIS2DW12_ACC_I2C")]
[#assign useAIS2DW12I2C = true]
[/#if]

[#if define?contains("AIS2DW12_ACC_SPI")]
[#assign useAIS2DW12SPI = true]
[/#if]

[#if define?contains("A3G4250D_GYR_I2C")]
[#assign useA3G4250DI2C = true]
[/#if]

[#if define?contains("A3G4250D_GYR_SPI")]
[#assign useA3G4250DSPI = true]
[/#if]

[#if define?contains("AIS328DQ_ACC_I2C")]
[#assign useAIS328DQI2C = true]
[/#if]

[#if define?contains("AIS328DQ_ACC_SPI")]
[#assign useAIS328DQSPI = true]
[/#if]

[#if define?contains("AIS3624DQ_ACC_I2C")]
[#assign useAIS3624DQI2C = true]
[/#if]

[#if define?contains("AIS3624DQ_ACC_SPI")]
[#assign useAIS3624DQSPI = true]
[/#if]

[#if define?contains("H3LIS331DL_ACC_I2C")]
[#assign useH3LIS331DLI2C = true]
[/#if]

[#if define?contains("H3LIS331DL_ACC_SPI")]
[#assign useH3LIS331DLSPI = true]
[/#if]

[#if define?contains("LSM6DSRX_ACCGYR_I2C")]
[#assign useLSM6DSRXI2C = true]
[/#if]

[#if define?contains("LSM6DSRX_ACCGYR_SPI")]
[#assign useLSM6DSRXSPI = true]
[/#if]

[/#list]
[/#if]

#include "custom_mems_conf.h"
#include "motion_sensor.h"

[#if useLSM6DSLI2C || useLSM6DSLSPI]
#ifndef USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0          1
#endif
[/#if]

[#if useLSM303AGRI2C]
#ifndef USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0
#define USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0    1
#endif
#ifndef USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0
#define USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0    1
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#ifndef USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0
#define USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0          1
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#ifndef USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0          1
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#ifndef USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0
#define USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0         1
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#ifndef USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0
#define USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0          1
#endif
[/#if]

[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
#include "lsm6dsl.h"
#endif
[/#if]

[#if useLSM303AGRI2C]
#if ((USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1) || (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1))
#include "lsm303agr.h"
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
#include "lis3mdl.h"
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
#include "lsm6dso.h"
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
#include "lis2dw12.h"
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
#include "lis2mdl.h"
#endif
[/#if]

[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
#include "lsm6dsox.h"
#endif
[/#if]

[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
#include "lis2dh12.h"
#endif
[/#if]

[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
#include "asm330lhh.h"
#endif
[/#if]

[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
#include "ism330dlc.h"
#endif
[/#if]

[#if useISM303DACI2C]
#if ((USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1) || (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1))
#include "ism303dac.h"
#endif
[/#if]

[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
#include "iis2dlpc.h"
#endif
[/#if]

[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
#include "iis2mdc.h"
#endif
[/#if]

[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
#include "ism330dhcx.h"
#endif
[/#if]

[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
#include "lsm6dsr.h"
#endif
[/#if]

[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
#include "ais2dw12.h"
#endif
[/#if]

[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
#include "a3g4250d.h"
#endif
[/#if]

[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
#include "ais328dq.h"
#endif
[/#if]

[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
#include "ais3624dq.h"
#endif
[/#if]

[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
#include "h3lis331dl.h"
#endif
[/#if]

[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
#include "lsm6dsrx.h"
#endif
[/#if]

[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
#define CUSTOM_LSM6DSL_0 (${valueMEMSInstance})
#endif
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0"]
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
#define CUSTOM_LSM303AGR_ACC_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0"]
[/#if]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
#define CUSTOM_LSM303AGR_MAG_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0"]
[/#if]
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
#define CUSTOM_LIS3MDL_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0"]
[/#if]
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
#define CUSTOM_LSM6DSO_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0"]
[/#if]
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
#define CUSTOM_LIS2DW12_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0"]
[/#if]
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
#define CUSTOM_LIS2MDL_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0"]
[/#if]
[/#if]

[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
#define CUSTOM_LSM6DSOX_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0"]
[/#if]
[/#if]

[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
#define CUSTOM_LIS2DH12_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0"]
[/#if]
[/#if]

[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
#define CUSTOM_ASM330LHH_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0"]
[/#if]
[/#if]

[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
#define CUSTOM_ISM330DLC_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0"]
[/#if]
[/#if]

[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
#define CUSTOM_ISM303DAC_ACC_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0"]
[/#if]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
#define CUSTOM_ISM303DAC_MAG_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0"]
[/#if]
[/#if]

[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
#define CUSTOM_IIS2DLPC_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0"]
[/#if]
[/#if]

[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
#define CUSTOM_IIS2MDC_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0"]
[/#if]
[/#if]

[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
#define CUSTOM_ISM330DHCX_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0"]
[/#if]
[/#if]

[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
#define CUSTOM_LSM6DSR_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0"]
[/#if]
[/#if]

[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
#define CUSTOM_AIS2DW12_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0"]
[/#if]
[/#if]

[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
#define CUSTOM_A3G4250D_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_A3G4250D_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_A3G4250D_0"]
[/#if]
[/#if]

[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
#define CUSTOM_AIS328DQ_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0"]
[/#if]
[/#if]

[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
#define CUSTOM_AIS3624DQ_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0"]
[/#if]
[/#if]

[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
#define CUSTOM_H3LIS331DL_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0"]
[/#if]
[/#if]

[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
#define CUSTOM_LSM6DSRX_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0"]
[/#if]
[/#if]

typedef struct
{
  int32_t x;
  int32_t y;
  int32_t z;
} CUSTOM_MOTION_SENSOR_Axes_t;

typedef struct
{
  int16_t x;
  int16_t y;
  int16_t z;
} CUSTOM_MOTION_SENSOR_AxesRaw_t;

/* Motion Sensor instance Info */
typedef struct
{
  uint8_t  Acc;
  uint8_t  Gyro;
  uint8_t  Magneto;
  uint8_t  LowPower;
  uint32_t GyroMaxFS;
  uint32_t AccMaxFS;
  uint32_t MagMaxFS;
  float    GyroMaxOdr;
  float    AccMaxOdr;
  float    MagMaxOdr;
} CUSTOM_MOTION_SENSOR_Capabilities_t;

typedef struct
{
  uint32_t Functions;
} CUSTOM_MOTION_SENSOR_Ctx_t;

#ifndef MOTION_GYRO
#define MOTION_GYRO             1U
#endif
#ifndef MOTION_ACCELERO
#define MOTION_ACCELERO         2U
#endif
#ifndef MOTION_MAGNETO
#define MOTION_MAGNETO          4U
#endif

#define CUSTOM_MOTION_FUNCTIONS_NBR    3U
#define CUSTOM_MOTION_INSTANCES_NBR    (${valueMEMSInstance})

#if (CUSTOM_MOTION_INSTANCES_NBR == 0)
#error "No motion sensor instance has been selected"
#endif

int32_t CUSTOM_MOTION_SENSOR_Init(uint32_t Instance, uint32_t Functions);
int32_t CUSTOM_MOTION_SENSOR_DeInit(uint32_t Instance);
int32_t CUSTOM_MOTION_SENSOR_GetCapabilities(uint32_t Instance, CUSTOM_MOTION_SENSOR_Capabilities_t *Capabilities);
int32_t CUSTOM_MOTION_SENSOR_ReadID(uint32_t Instance, uint8_t *Id);
int32_t CUSTOM_MOTION_SENSOR_Enable(uint32_t Instance, uint32_t Function);
int32_t CUSTOM_MOTION_SENSOR_Disable(uint32_t Instance, uint32_t Function);
int32_t CUSTOM_MOTION_SENSOR_GetAxes(uint32_t Instance, uint32_t Function, CUSTOM_MOTION_SENSOR_Axes_t *Axes);
int32_t CUSTOM_MOTION_SENSOR_GetAxesRaw(uint32_t Instance, uint32_t Function, CUSTOM_MOTION_SENSOR_AxesRaw_t *Axes);
int32_t CUSTOM_MOTION_SENSOR_GetSensitivity(uint32_t Instance, uint32_t Function, float *Sensitivity);
int32_t CUSTOM_MOTION_SENSOR_GetOutputDataRate(uint32_t Instance, uint32_t Function, float *Odr);
int32_t CUSTOM_MOTION_SENSOR_SetOutputDataRate(uint32_t Instance, uint32_t Function, float Odr);
int32_t CUSTOM_MOTION_SENSOR_GetFullScale(uint32_t Instance, uint32_t Function, int32_t *Fullscale);
int32_t CUSTOM_MOTION_SENSOR_SetFullScale(uint32_t Instance, uint32_t Function, int32_t Fullscale);

#ifdef __cplusplus
}
#endif

#endif /* __CUSTOM_MOTION_SENSORS_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
