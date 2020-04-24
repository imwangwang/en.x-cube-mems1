[#ftl]
/**
 ******************************************************************************
 * @file    custom_motion_sensors_ex.c
 * @author  MEMS Application Team
 * @brief   This file provides BSP Motion Sensors Extended interface for custom boards
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

/* Includes ------------------------------------------------------------------*/
#include "custom_motion_sensors_ex.h"

extern void *MotionCompObj[CUSTOM_MOTION_INSTANCES_NBR];

/**
 * @brief  Get the register value
 * @param  Instance the device instance
 * @param  Reg address to be read
 * @param  Data pointer where the value is written to
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Read_Register(uint32_t Instance, uint8_t Reg, uint8_t *Data)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      if (LSM303AGR_ACC_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      if (LSM303AGR_MAG_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      if (LIS3MDL_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      if (LIS2MDL_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
    case CUSTOM_LSM6DSOX_0:
      if (LSM6DSOX_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
    case CUSTOM_LIS2DH12_0:
      if (LIS2DH12_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
    case CUSTOM_ASM330LHH_0:
      if (ASM330LHH_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
    case CUSTOM_ISM330DLC_0:
      if (ISM330DLC_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
    case CUSTOM_ISM303DAC_ACC_0:
      if (ISM303DAC_ACC_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
    case CUSTOM_ISM303DAC_MAG_0:
      if (ISM303DAC_MAG_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
    case CUSTOM_IIS2DLPC_0:
      if (IIS2DLPC_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
    case CUSTOM_IIS2MDC_0:
      if (IIS2MDC_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
    case CUSTOM_ISM330DHCX_0:
      if (ISM330DHCX_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
    case CUSTOM_LSM6DSR_0:
      if (LSM6DSR_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
    case CUSTOM_AIS2DW12_0:
      if (AIS2DW12_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
    case CUSTOM_A3G4250D_0:
      if (A3G4250D_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
    case CUSTOM_AIS328DQ_0:
      if (AIS328DQ_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
    case CUSTOM_AIS3624DQ_0:
      if (AIS3624DQ_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
    case CUSTOM_H3LIS331DL_0:
      if (H3LIS331DL_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
    case CUSTOM_LSM6DSRX_0:
      if (LSM6DSRX_Read_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the register value
 * @param  Instance the device instance
 * @param  Reg address to be read
 * @param  Data value to be written
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Write_Register(uint32_t Instance, uint8_t Reg, uint8_t Data)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      if (LSM303AGR_ACC_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      if (LSM303AGR_MAG_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      if (LIS3MDL_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      if (LIS2MDL_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
    case CUSTOM_LSM6DSOX_0:
      if (LSM6DSOX_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
    case CUSTOM_LIS2DH12_0:
      if (LIS2DH12_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
    case CUSTOM_ASM330LHH_0:
      if (ASM330LHH_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
    case CUSTOM_ISM330DLC_0:
      if (ISM330DLC_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
    case CUSTOM_ISM303DAC_ACC_0:
      if (ISM303DAC_ACC_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
    case CUSTOM_ISM303DAC_MAG_0:
      if (ISM303DAC_MAG_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
    case CUSTOM_IIS2DLPC_0:
      if (IIS2DLPC_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
    case CUSTOM_IIS2MDC_0:
      if (IIS2MDC_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
    case CUSTOM_ISM330DHCX_0:
      if (ISM330DHCX_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
    case CUSTOM_LSM6DSR_0:
      if (LSM6DSR_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
    case CUSTOM_AIS2DW12_0:
      if (AIS2DW12_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
    case CUSTOM_A3G4250D_0:
      if (A3G4250D_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
    case CUSTOM_AIS328DQ_0:
      if (AIS328DQ_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
    case CUSTOM_AIS3624DQ_0:
      if (AIS3624DQ_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
    case CUSTOM_H3LIS331DL_0:
      if (H3LIS331DL_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
    case CUSTOM_LSM6DSRX_0:
      if (LSM6DSRX_Write_Reg(MotionCompObj[Instance], Reg, Data) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get the status of data ready bit
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Status the pointer to the status
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_DRDY_Status(uint32_t Instance, uint32_t Function, uint8_t *Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSL_ACC_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSL_GYRO_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM303AGR_ACC_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      if ((Function & MOTION_MAGNETO) == MOTION_MAGNETO)
      {
        if (LSM303AGR_MAG_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      if ((Function & MOTION_MAGNETO) == MOTION_MAGNETO)
      {
        if (LIS3MDL_MAG_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSO_ACC_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSO_GYRO_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LIS2DW12_ACC_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      if ((Function & MOTION_MAGNETO) == MOTION_MAGNETO)
      {
        if (LIS2MDL_MAG_Get_DRDY_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the free fall detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Free_Fall_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Free_Fall_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Free_Fall_Detection(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the free fall detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Free_Fall_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Free_Fall_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Free_Fall_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the free fall detection threshold
 * @param  Instance the device instance
 * @param  Threshold the threshold to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Free_Fall_Threshold(uint32_t Instance, uint8_t Threshold)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Free_Fall_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Free_Fall_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the free fall detection duration
 * @param  Instance the device instance
 * @param  Duration the duration to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Free_Fall_Duration(uint32_t Instance, uint8_t Duration)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Free_Fall_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Free_Fall_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the pedometer detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Pedometer(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Pedometer(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Pedometer(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the pedometer detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Pedometer(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Pedometer(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Pedometer(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the pedometer threshold
 * @param  Instance the device instance
 * @param  Threshold the threshold to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Pedometer_Threshold(uint32_t Instance, uint8_t Threshold)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Pedometer_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Reset step counter
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Reset_Step_Counter(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Step_Counter_Reset(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Step_Counter_Reset(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get step count
 * @param  Instance the device instance
 * @param  StepCount number of steps
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_Step_Count(uint32_t Instance, uint16_t *StepCount)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_Step_Count(MotionCompObj[Instance], StepCount) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_Step_Count(MotionCompObj[Instance], StepCount) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the single tap detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Single_Tap_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Single_Tap_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Single_Tap_Detection(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the single tap detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Single_Tap_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Single_Tap_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Single_Tap_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the double tap detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Double_Tap_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Double_Tap_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Double_Tap_Detection(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the double tap detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Double_Tap_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Double_Tap_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Double_Tap_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the tap threshold
 * @param  Instance the device instance
 * @param  Threshold the threshold to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Tap_Threshold(uint32_t Instance, uint8_t Threshold)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Tap_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Tap_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the tap shock time
 * @param  Instance the device instance
 * @param  Time the tap shock time to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Tap_Shock_Time(uint32_t Instance, uint8_t Time)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Tap_Shock_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Tap_Shock_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the tap quiet time
 * @param  Instance the device instance
 * @param  Time the tap quiet time to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Tap_Quiet_Time(uint32_t Instance, uint8_t Time)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Tap_Quiet_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Tap_Quiet_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the tap duration time
 * @param  Instance the device instance
 * @param  Time the tap duration time to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Tap_Duration_Time(uint32_t Instance, uint8_t Time)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Tap_Duration_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Tap_Duration_Time(MotionCompObj[Instance], Time) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the tilt detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Tilt_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Tilt_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Tilt_Detection(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the tilt detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Tilt_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Tilt_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Tilt_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the wake up detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Wake_Up_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Wake_Up_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_Wake_Up_Detection(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      /* For LIS2DW12 the Wake Up event can be routed only on INT1 pin */
      if (LIS2DW12_ACC_Enable_Wake_Up_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the wake up detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Wake_Up_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Wake_Up_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_Wake_Up_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Disable_Wake_Up_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the wake up detection threshold
 * @param  Instance the device instance
 * @param  Threshold the threshold to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Wake_Up_Threshold(uint32_t Instance, uint8_t Threshold)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Wake_Up_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Wake_Up_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Set_Wake_Up_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the wake up detection duration
 * @param  Instance the device instance
 * @param  Duration the duration to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Wake_Up_Duration(uint32_t Instance, uint8_t Duration)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Wake_Up_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_Wake_Up_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Set_Wake_Up_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable the inactivity detection
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_Inactivity_Detection(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_Inactivity_Detection(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      /* For LIS2DW12 the Inactivity event can be routed only on INT2 pin */
      if (LIS2DW12_ACC_Enable_Inactivity_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable the inactivity detection
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_Inactivity_Detection(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_Inactivity_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Disable_Inactivity_Detection(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the sleep duration
 * @param  Instance the device instance
 * @param  Duration the duration to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_Sleep_Duration(uint32_t Instance, uint8_t Duration)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_Sleep_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Set_Sleep_Duration(MotionCompObj[Instance], Duration) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Enable 6D Orientation
 * @param  Instance the device instance
 * @param  IntPin the interrupt pin to be used
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable_6D_Orientation(uint32_t Instance, CUSTOM_MOTION_SENSOR_IntPin_t IntPin)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Enable_6D_Orientation(MotionCompObj[Instance], (LSM6DSL_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Enable_6D_Orientation(MotionCompObj[Instance], (LSM6DSO_SensorIntPin_t)IntPin) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      /* For LIS2DW12 the 6D Orientation event can be routed only on INT1 pin */
      if (LIS2DW12_ACC_Enable_6D_Orientation(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Disable 6D Orientation
 * @param  Instance the device instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable_6D_Orientation(uint32_t Instance)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Disable_6D_Orientation(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Disable_6D_Orientation(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Disable_6D_Orientation(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set the 6D orientation threshold
 * @param  Instance the device instance
 * @param  Threshold the threshold to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_6D_Orientation_Threshold(uint32_t Instance, uint8_t Threshold)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Set_6D_Orientation_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Set_6D_Orientation_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Set_6D_Orientation_Threshold(MotionCompObj[Instance], Threshold) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation XL
 * @param  Instance the device instance
 * @param  xl the pointer to the 6D orientation XL axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XL(uint32_t Instance, uint8_t *xl)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_XL(MotionCompObj[Instance], xl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_XL(MotionCompObj[Instance], xl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_XL(MotionCompObj[Instance], xl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation XH
 * @param  Instance the device instance
 * @param  xh the pointer to the 6D orientation XH axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_XH(uint32_t Instance, uint8_t *xh)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_XH(MotionCompObj[Instance], xh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_XH(MotionCompObj[Instance], xh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_XH(MotionCompObj[Instance], xh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation YL
 * @param  Instance the device instance
 * @param  yl the pointer to the 6D orientation YL axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YL(uint32_t Instance, uint8_t *yl)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_YL(MotionCompObj[Instance], yl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_YL(MotionCompObj[Instance], yl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_YL(MotionCompObj[Instance], yl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation YH
 * @param  Instance the device instance
 * @param  yh the pointer to the 6D orientation YH axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_YH(uint32_t Instance, uint8_t *yh)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_YH(MotionCompObj[Instance], yh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_YH(MotionCompObj[Instance], yh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_YH(MotionCompObj[Instance], yh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation ZL
 * @param  Instance the device instance
 * @param  zl the pointer to the 6D orientation ZL axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZL(uint32_t Instance, uint8_t *zl)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_ZL(MotionCompObj[Instance], zl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_ZL(MotionCompObj[Instance], zl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_ZL(MotionCompObj[Instance], zl) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get 6D Orientation ZH
 * @param  Instance the device instance
 * @param  zh the pointer to the 6D orientation ZH axis
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_6D_Orientation_ZH(uint32_t Instance, uint8_t *zh)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_ACC_Get_6D_Orientation_ZH(MotionCompObj[Instance], zh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_ACC_Get_6D_Orientation_ZH(MotionCompObj[Instance], zh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_ACC_Get_6D_Orientation_ZH(MotionCompObj[Instance], zh) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get the status of all hardware events
 * @param  Instance the device instance
 * @param  Status the pointer to the status of all hardware events
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Get_Event_Status(uint32_t Instance, CUSTOM_MOTION_SENSOR_Event_Status_t *Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      if (LSM6DSL_ACC_Get_Event_Status(MotionCompObj[Instance], (LSM6DSL_Event_Status_t *)(void *)Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      if (LSM6DSO_ACC_Get_Event_Status(MotionCompObj[Instance], (LSM6DSO_Event_Status_t *)(void *)Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      if (LIS2DW12_ACC_Get_Event_Status(MotionCompObj[Instance], (LIS2DW12_Event_Status_t *)(void *)Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get number of unread FIFO samples
 * @param  Instance the device instance
 * @param  NumSamples number of unread FIFO samples
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Num_Samples(uint32_t Instance, uint16_t *NumSamples)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Get_Num_Samples(MotionCompObj[Instance], NumSamples) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Get_Num_Samples(MotionCompObj[Instance], NumSamples) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_FIFO_Get_Num_Samples(MotionCompObj[Instance], NumSamples) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get FIFO full status
 * @param  Instance the device instance
 * @param  Status FIFO full status
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Full_Status(uint32_t Instance, uint8_t *Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Get_Full_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Get_Full_Status(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO decimation
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Decimation FIFO decimation
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_Decimation(uint32_t Instance, uint32_t Function, uint8_t Decimation)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSL_FIFO_ACC_Set_Decimation(MotionCompObj[Instance], Decimation) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSL_FIFO_GYRO_Set_Decimation(MotionCompObj[Instance], Decimation) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO ODR value
 * @param  Instance the device instance
 * @param  Odr FIFO ODR value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_ODR_Value(uint32_t Instance, float Odr)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Set_ODR_Value(MotionCompObj[Instance], Odr) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO full interrupt on INT1 pin
 * @param  Instance the device instance
 * @param  Status FIFO full interrupt on INT1 pin
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_INT1_FIFO_Full(uint32_t Instance, uint8_t Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Set_INT1_FIFO_Full(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Set_INT1_FIFO_Full(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO watermark level
 * @param  Instance the device instance
 * @param  Watermark FIFO watermark level
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_Watermark_Level(uint32_t Instance, uint16_t Watermark)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Set_Watermark_Level(MotionCompObj[Instance], Watermark) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Set_Watermark_Level(MotionCompObj[Instance], Watermark) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO stop on watermark
 * @param  Instance the device instance
 * @param  Status FIFO stop on watermark status
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_Stop_On_Fth(uint32_t Instance, uint8_t Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Set_Stop_On_Fth(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Set_Stop_On_Fth(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO mode
 * @param  Instance the device instance
 * @param  Mode FIFO mode
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_Mode(uint32_t Instance, uint8_t Mode)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Set_Mode(MotionCompObj[Instance], Mode) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Set_Mode(MotionCompObj[Instance], Mode) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_FIFO_Set_Mode(MotionCompObj[Instance], Mode) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get FIFO pattern
 * @param  Instance the device instance
 * @param  Pattern FIFO pattern
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Pattern(uint32_t Instance, uint16_t *Pattern)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_FIFO_Get_Pattern(MotionCompObj[Instance], Pattern) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get FIFO single axis data
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Data FIFO single axis data
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Axis(uint32_t Instance, uint32_t Function, int32_t *Data)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSL_FIFO_ACC_Get_Axis(MotionCompObj[Instance], Data) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSL_FIFO_GYRO_Get_Axis(MotionCompObj[Instance], Data) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set FIFO BDR value
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Odr FIFO BDR value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Set_BDR(uint32_t Instance, uint32_t Function, float Bdr)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSO_FIFO_ACC_Set_BDR(MotionCompObj[Instance], Bdr) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSO_FIFO_GYRO_Set_BDR(MotionCompObj[Instance], Bdr) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get FIFO tag
 * @param  Instance the device instance
 * @param  Tag FIFO tag
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Tag(uint32_t Instance, uint8_t *Tag)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_FIFO_Get_Tag(MotionCompObj[Instance], Tag) != BSP_ERROR_NONE)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Get FIFO axes data
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Data FIFO axes data
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_FIFO_Get_Axes(uint32_t Instance, uint32_t Function, CUSTOM_MOTION_SENSOR_Axes_t *Data)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSO_FIFO_ACC_Get_Axes(MotionCompObj[Instance], (LSM6DSO_Axes_t *)Data) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSO_FIFO_GYRO_Get_Axes(MotionCompObj[Instance], (LSM6DSO_Axes_t *)Data) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/**
 * @brief  Set accelero self-test
 * @param  Instance the device instance
 * @param  Function Motion sensor function
 * @param  Data FIFO single axis data
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Set_SelfTest(uint32_t Instance, uint32_t Function, uint8_t Status)
{
  int32_t ret;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSL_ACC_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSL_GYRO_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      ret = BSP_ERROR_COMPONENT_FAILURE;
      break;
#endif
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LSM6DSO_ACC_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else if ((Function & MOTION_GYRO) == MOTION_GYRO)
      {
        if (LSM6DSO_GYRO_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if ((Function & MOTION_ACCELERO) == MOTION_ACCELERO)
      {
        if (LIS2DW12_ACC_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      if ((Function & MOTION_MAGNETO) == MOTION_MAGNETO)
      {
        if (LIS2MDL_MAG_Set_SelfTest(MotionCompObj[Instance], Status) != BSP_ERROR_NONE)
        {
          ret = BSP_ERROR_COMPONENT_FAILURE;
        }
        else
        {
          ret = BSP_ERROR_NONE;
        }
      }
      else
      {
        ret = BSP_ERROR_WRONG_PARAM;
      }
      break;
#endif
[/#if]

    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  return ret;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
