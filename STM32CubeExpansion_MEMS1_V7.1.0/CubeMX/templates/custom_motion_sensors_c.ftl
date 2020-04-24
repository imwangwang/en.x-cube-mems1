[#ftl]
/**
 ******************************************************************************
 * @file    custom_motion_sensors.c
 * @author  MEMS Application Team
 * @brief   This file provides BSP Motion Sensors interface for custom boards
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

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LSM6DSL_SA0")]
      [#assign LSM6DSL_SA0_value = value]
    [/#if]

    [#if name.contains("LIS3MDL_SA0")]
      [#assign LIS3MDL_SA0_value = value]
    [/#if]

    [#if name.contains("LSM6DSO_SA0")]
      [#assign LSM6DSO_SA0_value = value]
    [/#if]

    [#if name.contains("LIS2DW12_SA0")]
      [#assign LIS2DW12_SA0_value = value]
    [/#if]

    [#if name.contains("LSM6DSOX_SA0")]
      [#assign LSM6DSOX_SA0_value = value]
    [/#if]

    [#if name.contains("LIS2DH12_SA0")]
      [#assign LIS2DH12_SA0_value = value]
    [/#if]

    [#if name.contains("ASM330LHH_SA0")]
      [#assign ASM330LHH_SA0_value = value]
    [/#if]

    [#if name.contains("ISM330DLC_SA0")]
      [#assign ISM330DLC_SA0_value = value]
    [/#if]

    [#if name.contains("IIS2DLPC_SA0")]
      [#assign IIS2DLPC_SA0_value = value]
    [/#if]

    [#if name.contains("ISM330DHCX_SA0")]
      [#assign ISM330DHCX_SA0_value = value]
    [/#if]

    [#if name.contains("LSM6DSR_SA0")]
      [#assign LSM6DSR_SA0_value = value]
    [/#if]

    [#if name.contains("AIS2DW12_SA0")]
      [#assign AIS2DW12_SA0_value = value]
    [/#if]

    [#if name.contains("A3G4250D_SA0")]
      [#assign A3G4250D_SA0_value = value]
    [/#if]

    [#if name.contains("AIS328DQ_SA0")]
      [#assign AIS328DQ_SA0_value = value]
    [/#if]

    [#if name.contains("AIS3624DQ_SA0")]
      [#assign AIS3624DQ_SA0_value = value]
    [/#if]

    [#if name.contains("H3LIS331DL_SA0")]
      [#assign H3LIS331DL_SA0_value = value]
    [/#if]

    [#if name.contains("LSM6DSRX_SA0")]
      [#assign LSM6DSRX_SA0_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]

/* Includes ------------------------------------------------------------------*/
#include "custom_motion_sensors.h"

extern void *MotionCompObj[CUSTOM_MOTION_INSTANCES_NBR]; /* This "redundant" line is here to fulfil MISRA C-2012 rule 8.4 */
void *MotionCompObj[CUSTOM_MOTION_INSTANCES_NBR];

/* We define a jump table in order to get the correct index from the desired function. */
/* This table should have a size equal to the maximum value of a function plus 1.      */
static uint32_t FunctionIndex[5] = {0,0,1,1,2};
static MOTION_SENSOR_FuncDrv_t *MotionFuncDrv[CUSTOM_MOTION_INSTANCES_NBR][CUSTOM_MOTION_FUNCTIONS_NBR];
static MOTION_SENSOR_CommonDrv_t *MotionDrv[CUSTOM_MOTION_INSTANCES_NBR];
static CUSTOM_MOTION_SENSOR_Ctx_t MotionCtx[CUSTOM_MOTION_INSTANCES_NBR];

[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
static int32_t LSM6DSL_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
static int32_t LSM303AGR_ACC_0_Probe(uint32_t Functions);
#endif
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
static int32_t LSM303AGR_MAG_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
static int32_t LIS3MDL_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
static int32_t LSM6DSO_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
static int32_t LIS2DW12_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
static int32_t LIS2MDL_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
static int32_t LSM6DSOX_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
static int32_t LIS2DH12_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
static int32_t ASM330LHH_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
static int32_t ISM330DLC_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
static int32_t ISM303DAC_ACC_0_Probe(uint32_t Functions);
#endif
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
static int32_t ISM303DAC_MAG_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
static int32_t IIS2DLPC_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
static int32_t IIS2MDC_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
static int32_t ISM330DHCX_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
static int32_t LSM6DSR_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
static int32_t AIS2DW12_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
static int32_t A3G4250D_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
static int32_t AIS328DQ_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
static int32_t AIS3624DQ_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
static int32_t H3LIS331DL_0_Probe(uint32_t Functions);
#endif
[/#if]
[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
static int32_t LSM6DSRX_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
static int32_t CUSTOM_LSM6DSL_0_Init(void);
static int32_t CUSTOM_LSM6DSL_0_DeInit(void);
static int32_t CUSTOM_LSM6DSL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LSM6DSL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
static int32_t CUSTOM_LIS3MDL_0_Init(void);
static int32_t CUSTOM_LIS3MDL_0_DeInit(void);
static int32_t CUSTOM_LIS3MDL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LIS3MDL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
static int32_t CUSTOM_LSM6DSO_0_Init(void);
static int32_t CUSTOM_LSM6DSO_0_DeInit(void);
static int32_t CUSTOM_LSM6DSO_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LSM6DSO_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
static int32_t CUSTOM_LIS2DW12_0_Init(void);
static int32_t CUSTOM_LIS2DW12_0_DeInit(void);
static int32_t CUSTOM_LIS2DW12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LIS2DW12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
static int32_t CUSTOM_LIS2MDL_0_Init(void);
static int32_t CUSTOM_LIS2MDL_0_DeInit(void);
static int32_t CUSTOM_LIS2MDL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LIS2MDL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
static int32_t CUSTOM_LSM6DSOX_0_Init(void);
static int32_t CUSTOM_LSM6DSOX_0_DeInit(void);
static int32_t CUSTOM_LSM6DSOX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LSM6DSOX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
static int32_t CUSTOM_LIS2DH12_0_Init(void);
static int32_t CUSTOM_LIS2DH12_0_DeInit(void);
static int32_t CUSTOM_LIS2DH12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LIS2DH12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
static int32_t CUSTOM_ASM330LHH_0_Init(void);
static int32_t CUSTOM_ASM330LHH_0_DeInit(void);
static int32_t CUSTOM_ASM330LHH_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_ASM330LHH_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
static int32_t CUSTOM_ISM330DLC_0_Init(void);
static int32_t CUSTOM_ISM330DLC_0_DeInit(void);
static int32_t CUSTOM_ISM330DLC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_ISM330DLC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
static int32_t CUSTOM_IIS2DLPC_0_Init(void);
static int32_t CUSTOM_IIS2DLPC_0_DeInit(void);
static int32_t CUSTOM_IIS2DLPC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_IIS2DLPC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
static int32_t CUSTOM_IIS2MDC_0_Init(void);
static int32_t CUSTOM_IIS2MDC_0_DeInit(void);
static int32_t CUSTOM_IIS2MDC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_IIS2MDC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
static int32_t CUSTOM_ISM330DHCX_0_Init(void);
static int32_t CUSTOM_ISM330DHCX_0_DeInit(void);
static int32_t CUSTOM_ISM330DHCX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_ISM330DHCX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
static int32_t CUSTOM_LSM6DSR_0_Init(void);
static int32_t CUSTOM_LSM6DSR_0_DeInit(void);
static int32_t CUSTOM_LSM6DSR_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LSM6DSR_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
static int32_t CUSTOM_AIS2DW12_0_Init(void);
static int32_t CUSTOM_AIS2DW12_0_DeInit(void);
static int32_t CUSTOM_AIS2DW12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_AIS2DW12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
static int32_t CUSTOM_A3G4250D_0_Init(void);
static int32_t CUSTOM_A3G4250D_0_DeInit(void);
static int32_t CUSTOM_A3G4250D_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_A3G4250D_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
static int32_t CUSTOM_AIS328DQ_0_Init(void);
static int32_t CUSTOM_AIS328DQ_0_DeInit(void);
static int32_t CUSTOM_AIS328DQ_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_AIS328DQ_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
static int32_t CUSTOM_AIS3624DQ_0_Init(void);
static int32_t CUSTOM_AIS3624DQ_0_DeInit(void);
static int32_t CUSTOM_AIS3624DQ_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_AIS3624DQ_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
static int32_t CUSTOM_H3LIS331DL_0_Init(void);
static int32_t CUSTOM_H3LIS331DL_0_DeInit(void);
static int32_t CUSTOM_H3LIS331DL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_H3LIS331DL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
static int32_t CUSTOM_LSM6DSRX_0_Init(void);
static int32_t CUSTOM_LSM6DSRX_0_DeInit(void);
static int32_t CUSTOM_LSM6DSRX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LSM6DSRX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

/**
  * @brief  Initializes the motion sensors
  * @param  Instance Motion sensor instance
  * @param  Functions Motion sensor functions. Could be :
  *         - MOTION_GYRO
  *         - MOTION_ACCELERO
  *         - MOTION_MAGNETO
  * @retval BSP status
  */
int32_t CUSTOM_MOTION_SENSOR_Init(uint32_t Instance, uint32_t Functions)
{
  int32_t ret = BSP_ERROR_NONE;
  uint32_t function = MOTION_GYRO;
  uint32_t i;
  uint32_t component_functions = 0;
  CUSTOM_MOTION_SENSOR_Capabilities_t cap;

  switch (Instance)
  {
[#if useLSM6DSLI2C || useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0 == 1)
    case CUSTOM_LSM6DSL_0:
      if (LSM6DSL_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
    case CUSTOM_LSM303AGR_ACC_0:
      if (LSM303AGR_ACC_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
    case CUSTOM_LSM303AGR_MAG_0:
      if (LSM303AGR_MAG_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLIS3MDLI2C || useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
    case CUSTOM_LIS3MDL_0:
      if (LIS3MDL_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLSM6DSOI2C || useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0 == 1)
    case CUSTOM_LSM6DSO_0:
      if (LSM6DSO_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLIS2DW12I2C || useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0 == 1)
    case CUSTOM_LIS2DW12_0:
      if (LIS2DW12_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLIS2MDLI2C || useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
    case CUSTOM_LIS2MDL_0:
      if (LIS2MDL_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0 == 1)
    case CUSTOM_LSM6DSOX_0:
      if (LSM6DSOX_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLIS2DH12I2C || useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0 == 1)
    case CUSTOM_LIS2DH12_0:
      if (LIS2DH12_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useASM330LHHI2C || useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0 == 1)
    case CUSTOM_ASM330LHH_0:
      if (ASM330LHH_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useISM330DLCI2C || useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0 == 1)
    case CUSTOM_ISM330DLC_0:
      if (ISM330DLC_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
    case CUSTOM_ISM303DAC_ACC_0:
      if (ISM303DAC_ACC_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
    case CUSTOM_ISM303DAC_MAG_0:
      if (ISM303DAC_MAG_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0 == 1)
    case CUSTOM_IIS2DLPC_0:
      if (IIS2DLPC_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useIIS2MDCI2C || useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
    case CUSTOM_IIS2MDC_0:
      if (IIS2MDC_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useISM330DHCXI2C || useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0 == 1)
    case CUSTOM_ISM330DHCX_0:
      if (ISM330DHCX_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLSM6DSRI2C || useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0 == 1)
    case CUSTOM_LSM6DSR_0:
      if (LSM6DSR_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useAIS2DW12I2C || useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0 == 1)
    case CUSTOM_AIS2DW12_0:
      if (AIS2DW12_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useA3G4250DI2C || useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0 == 1)
    case CUSTOM_A3G4250D_0:
      if (A3G4250D_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useAIS328DQI2C || useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0 == 1)
    case CUSTOM_AIS328DQ_0:
      if (AIS328DQ_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useAIS3624DQI2C || useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0 == 1)
    case CUSTOM_AIS3624DQ_0:
      if (AIS3624DQ_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0 == 1)
    case CUSTOM_H3LIS331DL_0:
      if (H3LIS331DL_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0 == 1)
    case CUSTOM_LSM6DSRX_0:
      if (LSM6DSRX_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Acc == 1U)
      {
        component_functions |= MOTION_ACCELERO;
      }
      if (cap.Gyro == 1U)
      {
        component_functions |= MOTION_GYRO;
      }
      if (cap.Magneto == 1U)
      {
        component_functions |= MOTION_MAGNETO;
      }
      break;
#endif
[/#if]
    default:
      ret = BSP_ERROR_WRONG_PARAM;
      break;
  }

  if (ret != BSP_ERROR_NONE)
  {
    return ret;
  }

  for (i = 0; i < CUSTOM_MOTION_FUNCTIONS_NBR; i++)
  {
    if (((Functions & function) == function) && ((component_functions & function) == function))
    {
      if (MotionFuncDrv[Instance][FunctionIndex[function]]->Enable(MotionCompObj[Instance]) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_COMPONENT_FAILURE;
      }
    }
    function = function << 1;
  }

  return ret;
}

/**
 * @brief  Deinitialize Motion sensor
 * @param  Instance Motion sensor instance
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_DeInit(uint32_t Instance)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (MotionDrv[Instance]->DeInit(MotionCompObj[Instance]) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_COMPONENT_FAILURE;
  }
  else
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Get motion sensor instance capabilities
 * @param  Instance Motion sensor instance
 * @param  Capabilities pointer to motion sensor capabilities
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetCapabilities(uint32_t Instance, CUSTOM_MOTION_SENSOR_Capabilities_t *Capabilities)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (MotionDrv[Instance]->GetCapabilities(MotionCompObj[Instance], Capabilities) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Get WHOAMI value
 * @param  Instance Motion sensor instance
 * @param  Id WHOAMI value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_ReadID(uint32_t Instance, uint8_t *Id)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (MotionDrv[Instance]->ReadID(MotionCompObj[Instance], Id) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Enable Motion sensor
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Enable(uint32_t Instance, uint32_t Function)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->Enable(MotionCompObj[Instance]) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Disable Motion sensor
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_Disable(uint32_t Instance, uint32_t Function)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->Disable(MotionCompObj[Instance]) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Get motion sensor axes data
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Axes pointer to axes data structure
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetAxes(uint32_t Instance, uint32_t Function, CUSTOM_MOTION_SENSOR_Axes_t *Axes)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->GetAxes(MotionCompObj[Instance], Axes) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Get motion sensor axes raw data
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Axes pointer to axes raw data structure
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetAxesRaw(uint32_t Instance, uint32_t Function, CUSTOM_MOTION_SENSOR_AxesRaw_t *Axes)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->GetAxesRaw(MotionCompObj[Instance], Axes) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Get motion sensor sensitivity
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Sensitivity pointer to sensitivity read value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetSensitivity(uint32_t Instance, uint32_t Function, float *Sensitivity)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->GetSensitivity(MotionCompObj[Instance],
          Sensitivity) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Get motion sensor Output Data Rate
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Odr pointer to Output Data Rate read value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetOutputDataRate(uint32_t Instance, uint32_t Function, float *Odr)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->GetOutputDataRate(MotionCompObj[Instance], Odr) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Get motion sensor Full Scale
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Fullscale pointer to Fullscale read value
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_GetFullScale(uint32_t Instance, uint32_t Function, int32_t *Fullscale)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->GetFullScale(MotionCompObj[Instance], Fullscale) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Set motion sensor Output Data Rate
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Odr Output Data Rate value to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_SetOutputDataRate(uint32_t Instance, uint32_t Function, float Odr)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->SetOutputDataRate(MotionCompObj[Instance], Odr) != BSP_ERROR_NONE)
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
  }

  return ret;
}

/**
 * @brief  Set motion sensor Full Scale
 * @param  Instance Motion sensor instance
 * @param  Function Motion sensor function. Could be :
 *         - MOTION_GYRO
 *         - MOTION_ACCELERO
 *         - MOTION_MAGNETO
 * @param  Fullscale Fullscale value to be set
 * @retval BSP status
 */
int32_t CUSTOM_MOTION_SENSOR_SetFullScale(uint32_t Instance, uint32_t Function, int32_t Fullscale)
{
  int32_t ret;

  if (Instance >= CUSTOM_MOTION_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((MotionCtx[Instance].Functions & Function) == Function)
    {
      if (MotionFuncDrv[Instance][FunctionIndex[Function]]->SetFullScale(MotionCompObj[Instance], Fullscale) != BSP_ERROR_NONE)
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
  }

  return ret;
}

[#if useLSM6DSLI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSL_0_Probe(uint32_t Functions)
{
  LSM6DSL_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSL_Object_t lsm6dsl_obj_0;
  LSM6DSL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSL_I2C_BUS; /* I2C */
[#if LSM6DSL_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSL_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LSM6DSL_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSL_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LSM6DSL_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSL_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSL_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSL_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSL_RegisterBusIO(&lsm6dsl_obj_0, &io_ctx) != LSM6DSL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSL_ReadID(&lsm6dsl_obj_0, &id) != LSM6DSL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSL_GetCapabilities(&lsm6dsl_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSL_0] = &lsm6dsl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSL_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSL_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSL_0]->Init(MotionCompObj[CUSTOM_LSM6DSL_0]) != LSM6DSL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSL_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSL_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSL_0]->Init(MotionCompObj[CUSTOM_LSM6DSL_0]) != LSM6DSL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLSM6DSLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSL_0_Probe(uint32_t Functions)
{
  LSM6DSL_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSL_Object_t lsm6dsl_obj_0;
  LSM6DSL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSL_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LSM6DSL_0_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSL_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSL_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSL_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSL_RegisterBusIO(&lsm6dsl_obj_0, &io_ctx) != LSM6DSL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSL_ReadID(&lsm6dsl_obj_0, &id) != LSM6DSL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSL_GetCapabilities(&lsm6dsl_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSL_0] = &lsm6dsl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSL_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSL_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSL_0]->Init(MotionCompObj[CUSTOM_LSM6DSL_0]) != LSM6DSL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSL_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSL_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSL_0]->Init(MotionCompObj[CUSTOM_LSM6DSL_0]) != LSM6DSL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LSM6DSL
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSL_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSL_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LSM6DSL
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSL_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSL_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LSM6DSL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSL_0_CS_PORT, CUSTOM_LSM6DSL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSL_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSL_0_CS_PORT, CUSTOM_LSM6DSL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LSM6DSL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSL_0_CS_PORT, CUSTOM_LSM6DSL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSL_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSL_0_CS_PORT, CUSTOM_LSM6DSL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLSM303AGRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0 == 1)
/**
 * @brief  Register Bus IOs for LSM303AGR accelerometer instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM303AGR_ACC_0_Probe(uint32_t Functions)
{
  LSM303AGR_IO_t                io_ctx;
  uint8_t                       id;
  static LSM303AGR_ACC_Object_t lsm303agr_acc_obj_0;
  LSM303AGR_Capabilities_t      cap;
  int32_t                       ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM303AGR_I2C_BUS; /* I2C */
  io_ctx.Address     = LSM303AGR_I2C_ADD_XL;
  io_ctx.Init        = CUSTOM_LSM303AGR_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM303AGR_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM303AGR_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM303AGR_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM303AGR_ACC_RegisterBusIO(&lsm303agr_acc_obj_0, &io_ctx) != LSM303AGR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM303AGR_ACC_ReadID(&lsm303agr_acc_obj_0, &id) != LSM303AGR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LSM303AGR_ID_XL)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM303AGR_ACC_GetCapabilities(&lsm303agr_acc_obj_0, &cap);
    MotionCtx[CUSTOM_LSM303AGR_ACC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM303AGR_ACC_0] = &lsm303agr_acc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM303AGR_ACC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM303AGR_ACC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM303AGR_ACC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(
            void *)&LSM303AGR_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM303AGR_ACC_0]->Init(MotionCompObj[CUSTOM_LSM303AGR_ACC_0]) != LSM303AGR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif

#if (USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0 == 1)
/**
 * @brief  Register Bus IOs for LSM303AGR magnetometer instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t LSM303AGR_MAG_0_Probe(uint32_t Functions)
{
  LSM303AGR_IO_t                io_ctx;
  uint8_t                       id;
  static LSM303AGR_MAG_Object_t lsm303agr_mag_obj_0;
  LSM303AGR_Capabilities_t      cap;
  int32_t                       ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM303AGR_I2C_BUS; /* I2C */
  io_ctx.Address     = LSM303AGR_I2C_ADD_MG;
  io_ctx.Init        = CUSTOM_LSM303AGR_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM303AGR_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM303AGR_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM303AGR_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM303AGR_MAG_RegisterBusIO(&lsm303agr_mag_obj_0, &io_ctx) != LSM303AGR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM303AGR_MAG_ReadID(&lsm303agr_mag_obj_0, &id) != LSM303AGR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LSM303AGR_ID_MG)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM303AGR_MAG_GetCapabilities(&lsm303agr_mag_obj_0, &cap);
    MotionCtx[CUSTOM_LSM303AGR_MAG_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM303AGR_MAG_0] = &lsm303agr_mag_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM303AGR_MAG_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM303AGR_MAG_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM303AGR_MAG_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM303AGR_MAG_Driver;

      if (MotionDrv[CUSTOM_LSM303AGR_MAG_0]->Init(MotionCompObj[CUSTOM_LSM303AGR_MAG_0]) != LSM303AGR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLIS3MDLI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
/**
 * @brief  Register Bus IOs for LIS3MDL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t LIS3MDL_0_Probe(uint32_t Functions)
{
  LIS3MDL_IO_t            io_ctx;
  uint8_t                 id;
  static LIS3MDL_Object_t lis3mdl_obj_0;
  LIS3MDL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS3MDL_I2C_BUS; /* I2C */
[#if LIS3MDL_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LIS3MDL_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LIS3MDL_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LIS3MDL_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LIS3MDL_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LIS3MDL_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS3MDL_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS3MDL_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS3MDL_RegisterBusIO(&lis3mdl_obj_0, &io_ctx) != LIS3MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS3MDL_ReadID(&lis3mdl_obj_0, &id) != LIS3MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LIS3MDL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS3MDL_GetCapabilities(&lis3mdl_obj_0, &cap);
    MotionCtx[CUSTOM_LIS3MDL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS3MDL_0] = &lis3mdl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS3MDL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS3MDL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS3MDL_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS3MDL_MAG_Driver;

      if (MotionDrv[CUSTOM_LIS3MDL_0]->Init(MotionCompObj[CUSTOM_LIS3MDL_0]) != LIS3MDL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLIS3MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0 == 1)
/**
 * @brief  Register Bus IOs for LIS3MDL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t LIS3MDL_0_Probe(uint32_t Functions)
{
  LIS3MDL_IO_t            io_ctx;
  uint8_t                 id;
  static LIS3MDL_Object_t lis3mdl_obj_0;
  LIS3MDL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS3MDL_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LIS3MDL_0_Init;
  io_ctx.DeInit      = CUSTOM_LIS3MDL_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS3MDL_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS3MDL_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS3MDL_RegisterBusIO(&lis3mdl_obj_0, &io_ctx) != LIS3MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS3MDL_ReadID(&lis3mdl_obj_0, &id) != LIS3MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LIS3MDL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS3MDL_GetCapabilities(&lis3mdl_obj_0, &cap);
    MotionCtx[CUSTOM_LIS3MDL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS3MDL_0] = &lis3mdl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS3MDL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS3MDL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS3MDL_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS3MDL_MAG_Driver;

      if (MotionDrv[CUSTOM_LIS3MDL_0]->Init(MotionCompObj[CUSTOM_LIS3MDL_0]) != LIS3MDL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LIS3MDL
 * @retval BSP status
 */
static int32_t CUSTOM_LIS3MDL_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS3MDL_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LIS3MDL
 * @retval BSP status
 */
static int32_t CUSTOM_LIS3MDL_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS3MDL_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LIS3MDL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LIS3MDL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS3MDL_0_CS_PORT, CUSTOM_LIS3MDL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS3MDL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS3MDL_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS3MDL_0_CS_PORT, CUSTOM_LIS3MDL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LIS3MDL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LIS3MDL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS3MDL_0_CS_PORT, CUSTOM_LIS3MDL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS3MDL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS3MDL_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS3MDL_0_CS_PORT, CUSTOM_LIS3MDL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLSM6DSOI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSO instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSO_0_Probe(uint32_t Functions)
{
  LSM6DSO_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSO_Object_t lsm6dso_obj_0;
  LSM6DSO_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSO_I2C_BUS; /* I2C */
[#if LSM6DSO_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSO_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LSM6DSO_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSO_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LSM6DSO_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSO_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSO_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSO_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSO_RegisterBusIO(&lsm6dso_obj_0, &io_ctx) != LSM6DSO_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSO_ReadID(&lsm6dso_obj_0, &id) != LSM6DSO_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSO_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSO_GetCapabilities(&lsm6dso_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSO_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSO_0] = &lsm6dso_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSO_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSO_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSO_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSO_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSO_0]->Init(MotionCompObj[CUSTOM_LSM6DSO_0]) != LSM6DSO_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSO_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSO_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSO_0]->Init(MotionCompObj[CUSTOM_LSM6DSO_0]) != LSM6DSO_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLSM6DSOSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSO instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSO_0_Probe(uint32_t Functions)
{
  LSM6DSO_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSO_Object_t lsm6dso_obj_0;
  LSM6DSO_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSO_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LSM6DSO_0_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSO_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSO_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSO_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSO_RegisterBusIO(&lsm6dso_obj_0, &io_ctx) != LSM6DSO_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSO_ReadID(&lsm6dso_obj_0, &id) != LSM6DSO_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSO_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSO_GetCapabilities(&lsm6dso_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSO_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSO_0] = &lsm6dso_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSO_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSO_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSO_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSO_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSO_0]->Init(MotionCompObj[CUSTOM_LSM6DSO_0]) != LSM6DSO_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSO_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSO_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSO_0]->Init(MotionCompObj[CUSTOM_LSM6DSO_0]) != LSM6DSO_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LSM6DSO
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSO_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSO_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LSM6DSO
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSO_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSO_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LSM6DSO
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSO_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSO_0_CS_PORT, CUSTOM_LSM6DSO_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSO_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSO_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSO_0_CS_PORT, CUSTOM_LSM6DSO_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LSM6DSO
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSO_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSO_0_CS_PORT, CUSTOM_LSM6DSO_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSO_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSO_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSO_0_CS_PORT, CUSTOM_LSM6DSO_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLIS2DW12I2C]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0  == 1)
/**
 * @brief  Register Bus IOs for LIS2DW12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LIS2DW12_0_Probe(uint32_t Functions)
{
  LIS2DW12_IO_t            io_ctx;
  uint8_t                  id;
  static LIS2DW12_Object_t lis2dw12_obj_0;
  LIS2DW12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2DW12_I2C_BUS; /* I2C */
[#if LIS2DW12_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LIS2DW12_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LIS2DW12_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LIS2DW12_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LIS2DW12_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LIS2DW12_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2DW12_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2DW12_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2DW12_RegisterBusIO(&lis2dw12_obj_0, &io_ctx) != LIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2DW12_ReadID(&lis2dw12_obj_0, &id) != LIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LIS2DW12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2DW12_GetCapabilities(&lis2dw12_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2DW12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2DW12_0] = &lis2dw12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2DW12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2DW12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2DW12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2DW12_ACC_Driver;

      if (MotionDrv[CUSTOM_LIS2DW12_0]->Init(MotionCompObj[CUSTOM_LIS2DW12_0]) != LIS2DW12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0  == 1)
/**
 * @brief  Register Bus IOs for LIS2DW12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LIS2DW12_0_Probe(uint32_t Functions)
{
  LIS2DW12_IO_t            io_ctx;
  uint8_t                  id;
  static LIS2DW12_Object_t lis2dw12_obj_0;
  LIS2DW12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2DW12_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LIS2DW12_0_Init;
  io_ctx.DeInit      = CUSTOM_LIS2DW12_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2DW12_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2DW12_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2DW12_RegisterBusIO(&lis2dw12_obj_0, &io_ctx) != LIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2DW12_ReadID(&lis2dw12_obj_0, &id) != LIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LIS2DW12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2DW12_GetCapabilities(&lis2dw12_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2DW12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2DW12_0] = &lis2dw12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2DW12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2DW12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2DW12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2DW12_ACC_Driver;

      if (MotionDrv[CUSTOM_LIS2DW12_0]->Init(MotionCompObj[CUSTOM_LIS2DW12_0]) != LIS2DW12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LIS2DW12
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DW12_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2DW12_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LIS2DW12
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DW12_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2DW12_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LIS2DW12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DW12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DW12_0_CS_PORT, CUSTOM_LIS2DW12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2DW12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2DW12_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DW12_0_CS_PORT, CUSTOM_LIS2DW12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LIS2DW12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DW12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DW12_0_CS_PORT, CUSTOM_LIS2DW12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2DW12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2DW12_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DW12_0_CS_PORT, CUSTOM_LIS2DW12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLIS2MDLI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
/**
 * @brief  Register Bus IOs for LIS2MDL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t LIS2MDL_0_Probe(uint32_t Functions)
{
  LIS2MDL_IO_t            io_ctx;
  uint8_t                 id;
  static LIS2MDL_Object_t lis2mdl_obj_0;
  LIS2MDL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2MDL_I2C_BUS; /* I2C */
  io_ctx.Address     = LIS2MDL_I2C_ADD;
  io_ctx.Init        = CUSTOM_LIS2MDL_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LIS2MDL_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2MDL_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2MDL_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2MDL_RegisterBusIO(&lis2mdl_obj_0, &io_ctx) != LIS2MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2MDL_ReadID(&lis2mdl_obj_0, &id) != LIS2MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LIS2MDL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2MDL_GetCapabilities(&lis2mdl_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2MDL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2MDL_0] = &lis2mdl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2MDL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2MDL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2MDL_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2MDL_MAG_Driver;

      if (MotionDrv[CUSTOM_LIS2MDL_0]->Init(MotionCompObj[CUSTOM_LIS2MDL_0]) != LIS2MDL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLIS2MDLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0 == 1)
/**
 * @brief  Register Bus IOs for LIS2MDL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t LIS2MDL_0_Probe(uint32_t Functions)
{
  LIS2MDL_IO_t            io_ctx;
  uint8_t                 id;
  static LIS2MDL_Object_t lis2mdl_obj_0;
  LIS2MDL_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2MDL_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LIS2MDL_0_Init;
  io_ctx.DeInit      = CUSTOM_LIS2MDL_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2MDL_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2MDL_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2MDL_RegisterBusIO(&lis2mdl_obj_0, &io_ctx) != LIS2MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2MDL_ReadID(&lis2mdl_obj_0, &id) != LIS2MDL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)LIS2MDL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2MDL_GetCapabilities(&lis2mdl_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2MDL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2MDL_0] = &lis2mdl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2MDL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2MDL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2MDL_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2MDL_MAG_Driver;

      if (MotionDrv[CUSTOM_LIS2MDL_0]->Init(MotionCompObj[CUSTOM_LIS2MDL_0]) != LIS2MDL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LIS2MDL
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2MDL_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2MDL_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LIS2MDL
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2MDL_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2MDL_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LIS2MDL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2MDL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2MDL_0_CS_PORT, CUSTOM_LIS2MDL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2MDL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2MDL_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2MDL_0_CS_PORT, CUSTOM_LIS2MDL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LIS2MDL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2MDL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2MDL_0_CS_PORT, CUSTOM_LIS2MDL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2MDL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2MDL_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2MDL_0_CS_PORT, CUSTOM_LIS2MDL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLSM6DSOXI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSOX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSOX_0_Probe(uint32_t Functions)
{
  LSM6DSOX_IO_t            io_ctx;
  uint8_t                  id;
  static LSM6DSOX_Object_t lsm6dsox_obj_0;
  LSM6DSOX_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSOX_I2C_BUS; /* I2C */
[#if LSM6DSOX_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSOX_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LSM6DSOX_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSOX_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LSM6DSOX_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSOX_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSOX_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSOX_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSOX_RegisterBusIO(&lsm6dsox_obj_0, &io_ctx) != LSM6DSOX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSOX_ReadID(&lsm6dsox_obj_0, &id) != LSM6DSOX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSOX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSOX_GetCapabilities(&lsm6dsox_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSOX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSOX_0] = &lsm6dsox_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSOX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSOX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSOX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSOX_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSOX_0]->Init(MotionCompObj[CUSTOM_LSM6DSOX_0]) != LSM6DSOX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSOX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSOX_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSOX_0]->Init(MotionCompObj[CUSTOM_LSM6DSOX_0]) != LSM6DSOX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLSM6DSOXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSOX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSOX_0_Probe(uint32_t Functions)
{
  LSM6DSOX_IO_t            io_ctx;
  uint8_t                  id;
  static LSM6DSOX_Object_t lsm6dsox_obj_0;
  LSM6DSOX_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSOX_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LSM6DSOX_0_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSOX_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSOX_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSOX_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSOX_RegisterBusIO(&lsm6dsox_obj_0, &io_ctx) != LSM6DSOX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSOX_ReadID(&lsm6dsox_obj_0, &id) != LSM6DSOX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSOX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSOX_GetCapabilities(&lsm6dsox_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSOX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSOX_0] = &lsm6dsox_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSOX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSOX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSOX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSOX_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSOX_0]->Init(MotionCompObj[CUSTOM_LSM6DSOX_0]) != LSM6DSOX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSOX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSOX_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSOX_0]->Init(MotionCompObj[CUSTOM_LSM6DSOX_0]) != LSM6DSOX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LSM6DSOX
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSOX_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSOX_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LSM6DSOX
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSOX_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSOX_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LSM6DSOX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSOX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSOX_0_CS_PORT, CUSTOM_LSM6DSOX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSOX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSOX_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSOX_0_CS_PORT, CUSTOM_LSM6DSOX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LSM6DSOX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSOX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSOX_0_CS_PORT, CUSTOM_LSM6DSOX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSOX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSOX_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSOX_0_CS_PORT, CUSTOM_LSM6DSOX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLIS2DH12I2C]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0  == 1)
/**
 * @brief  Register Bus IOs for LIS2DH12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LIS2DH12_0_Probe(uint32_t Functions)
{
  LIS2DH12_IO_t            io_ctx;
  uint8_t                  id;
  static LIS2DH12_Object_t lis2dh12_obj_0;
  LIS2DH12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2DH12_I2C_BUS; /* I2C */
[#if LIS2DH12_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LIS2DH12_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LIS2DH12_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LIS2DH12_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LIS2DH12_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LIS2DH12_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2DH12_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2DH12_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2DH12_RegisterBusIO(&lis2dh12_obj_0, &io_ctx) != LIS2DH12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2DH12_ReadID(&lis2dh12_obj_0, &id) != LIS2DH12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LIS2DH12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2DH12_GetCapabilities(&lis2dh12_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2DH12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2DH12_0] = &lis2dh12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2DH12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2DH12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2DH12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2DH12_Driver;

      if (MotionDrv[CUSTOM_LIS2DH12_0]->Init(MotionCompObj[CUSTOM_LIS2DH12_0]) != LIS2DH12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLIS2DH12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0  == 1)
/**
 * @brief  Register Bus IOs for LIS2DH12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LIS2DH12_0_Probe(uint32_t Functions)
{
  LIS2DH12_IO_t            io_ctx;
  uint8_t                  id;
  static LIS2DH12_Object_t lis2dh12_obj_0;
  LIS2DH12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LIS2DH12_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LIS2DH12_0_Init;
  io_ctx.DeInit      = CUSTOM_LIS2DH12_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LIS2DH12_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LIS2DH12_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LIS2DH12_RegisterBusIO(&lis2dh12_obj_0, &io_ctx) != LIS2DH12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LIS2DH12_ReadID(&lis2dh12_obj_0, &id) != LIS2DH12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LIS2DH12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LIS2DH12_GetCapabilities(&lis2dh12_obj_0, &cap);
    MotionCtx[CUSTOM_LIS2DH12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LIS2DH12_0] = &lis2dh12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LIS2DH12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LIS2DH12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LIS2DH12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LIS2DH12_Driver;

      if (MotionDrv[CUSTOM_LIS2DH12_0]->Init(MotionCompObj[CUSTOM_LIS2DH12_0]) != LIS2DH12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LIS2DH12
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DH12_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2DH12_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LIS2DH12
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DH12_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LIS2DH12_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LIS2DH12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DH12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DH12_0_CS_PORT, CUSTOM_LIS2DH12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2DH12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2DH12_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DH12_0_CS_PORT, CUSTOM_LIS2DH12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LIS2DH12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LIS2DH12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DH12_0_CS_PORT, CUSTOM_LIS2DH12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LIS2DH12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LIS2DH12_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LIS2DH12_0_CS_PORT, CUSTOM_LIS2DH12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useASM330LHHI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0  == 1)
/**
 * @brief  Register Bus IOs for ASM330LHH instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ASM330LHH_0_Probe(uint32_t Functions)
{
  ASM330LHH_IO_t            io_ctx;
  uint8_t                   id;
  static ASM330LHH_Object_t asm330lhh_obj_0;
  ASM330LHH_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ASM330LHH_I2C_BUS; /* I2C */
[#if ASM330LHH_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = ASM330LHH_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if ASM330LHH_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = ASM330LHH_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_ASM330LHH_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_ASM330LHH_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_ASM330LHH_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ASM330LHH_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ASM330LHH_RegisterBusIO(&asm330lhh_obj_0, &io_ctx) != ASM330LHH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ASM330LHH_ReadID(&asm330lhh_obj_0, &id) != ASM330LHH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ASM330LHH_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ASM330LHH_GetCapabilities(&asm330lhh_obj_0, &cap);
    MotionCtx[CUSTOM_ASM330LHH_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ASM330LHH_0] = &asm330lhh_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ASM330LHH_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ASM330LHH_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ASM330LHH_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ASM330LHH_GYRO_Driver;

      if (MotionDrv[CUSTOM_ASM330LHH_0]->Init(MotionCompObj[CUSTOM_ASM330LHH_0]) != ASM330LHH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ASM330LHH_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ASM330LHH_ACC_Driver;

      if (MotionDrv[CUSTOM_ASM330LHH_0]->Init(MotionCompObj[CUSTOM_ASM330LHH_0]) != ASM330LHH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useASM330LHHSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0  == 1)
/**
 * @brief  Register Bus IOs for ASM330LHH instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ASM330LHH_0_Probe(uint32_t Functions)
{
  ASM330LHH_IO_t            io_ctx;
  uint8_t                   id;
  static ASM330LHH_Object_t asm330lhh_obj_0;
  ASM330LHH_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ASM330LHH_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_ASM330LHH_0_Init;
  io_ctx.DeInit      = CUSTOM_ASM330LHH_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_ASM330LHH_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ASM330LHH_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ASM330LHH_RegisterBusIO(&asm330lhh_obj_0, &io_ctx) != ASM330LHH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ASM330LHH_ReadID(&asm330lhh_obj_0, &id) != ASM330LHH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ASM330LHH_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ASM330LHH_GetCapabilities(&asm330lhh_obj_0, &cap);
    MotionCtx[CUSTOM_ASM330LHH_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ASM330LHH_0] = &asm330lhh_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ASM330LHH_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ASM330LHH_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ASM330LHH_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ASM330LHH_GYRO_Driver;

      if (MotionDrv[CUSTOM_ASM330LHH_0]->Init(MotionCompObj[CUSTOM_ASM330LHH_0]) != ASM330LHH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ASM330LHH_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ASM330LHH_ACC_Driver;

      if (MotionDrv[CUSTOM_ASM330LHH_0]->Init(MotionCompObj[CUSTOM_ASM330LHH_0]) != ASM330LHH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for ASM330LHH
 * @retval BSP status
 */
static int32_t CUSTOM_ASM330LHH_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ASM330LHH_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for ASM330LHH
 * @retval BSP status
 */
static int32_t CUSTOM_ASM330LHH_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ASM330LHH_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for ASM330LHH
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_ASM330LHH_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ASM330LHH_0_CS_PORT, CUSTOM_ASM330LHH_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ASM330LHH_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ASM330LHH_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ASM330LHH_0_CS_PORT, CUSTOM_ASM330LHH_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for ASM330LHH
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_ASM330LHH_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ASM330LHH_0_CS_PORT, CUSTOM_ASM330LHH_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ASM330LHH_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ASM330LHH_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ASM330LHH_0_CS_PORT, CUSTOM_ASM330LHH_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useISM330DLCI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0  == 1)
/**
 * @brief  Register Bus IOs for ISM330DLC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ISM330DLC_0_Probe(uint32_t Functions)
{
  ISM330DLC_IO_t            io_ctx;
  uint8_t                   id;
  static ISM330DLC_Object_t ism330dlc_obj_0;
  ISM330DLC_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM330DLC_I2C_BUS; /* I2C */
[#if ISM330DLC_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = ISM330DLC_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if ISM330DLC_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = ISM330DLC_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_ISM330DLC_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_ISM330DLC_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM330DLC_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM330DLC_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM330DLC_RegisterBusIO(&ism330dlc_obj_0, &io_ctx) != ISM330DLC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM330DLC_ReadID(&ism330dlc_obj_0, &id) != ISM330DLC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ISM330DLC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM330DLC_GetCapabilities(&ism330dlc_obj_0, &cap);
    MotionCtx[CUSTOM_ISM330DLC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM330DLC_0] = &ism330dlc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM330DLC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM330DLC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DLC_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DLC_GYRO_Driver;

      if (MotionDrv[CUSTOM_ISM330DLC_0]->Init(MotionCompObj[CUSTOM_ISM330DLC_0]) != ISM330DLC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DLC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DLC_ACC_Driver;

      if (MotionDrv[CUSTOM_ISM330DLC_0]->Init(MotionCompObj[CUSTOM_ISM330DLC_0]) != ISM330DLC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useISM330DLCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0  == 1)
/**
 * @brief  Register Bus IOs for ISM330DLC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ISM330DLC_0_Probe(uint32_t Functions)
{
  ISM330DLC_IO_t            io_ctx;
  uint8_t                   id;
  static ISM330DLC_Object_t ism330dlc_obj_0;
  ISM330DLC_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM330DLC_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_ISM330DLC_0_Init;
  io_ctx.DeInit      = CUSTOM_ISM330DLC_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM330DLC_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM330DLC_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM330DLC_RegisterBusIO(&ism330dlc_obj_0, &io_ctx) != ISM330DLC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM330DLC_ReadID(&ism330dlc_obj_0, &id) != ISM330DLC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ISM330DLC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM330DLC_GetCapabilities(&ism330dlc_obj_0, &cap);
    MotionCtx[CUSTOM_ISM330DLC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM330DLC_0] = &ism330dlc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM330DLC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM330DLC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DLC_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DLC_GYRO_Driver;

      if (MotionDrv[CUSTOM_ISM330DLC_0]->Init(MotionCompObj[CUSTOM_ISM330DLC_0]) != ISM330DLC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DLC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DLC_ACC_Driver;

      if (MotionDrv[CUSTOM_ISM330DLC_0]->Init(MotionCompObj[CUSTOM_ISM330DLC_0]) != ISM330DLC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for ISM330DLC
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DLC_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ISM330DLC_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for ISM330DLC
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DLC_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ISM330DLC_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for ISM330DLC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DLC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DLC_0_CS_PORT, CUSTOM_ISM330DLC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ISM330DLC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ISM330DLC_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DLC_0_CS_PORT, CUSTOM_ISM330DLC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for ISM330DLC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DLC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DLC_0_CS_PORT, CUSTOM_ISM330DLC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ISM330DLC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ISM330DLC_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DLC_0_CS_PORT, CUSTOM_ISM330DLC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useISM303DACI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0 == 1)
/**
 * @brief  Register Bus IOs for ISM303DAC accelerometer instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ISM303DAC_ACC_0_Probe(uint32_t Functions)
{
  ISM303DAC_IO_t                io_ctx;
  uint8_t                       id;
  static ISM303DAC_ACC_Object_t ism303dac_acc_obj_0;
  ISM303DAC_Capabilities_t      cap;
  int32_t                       ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM303DAC_I2C_BUS; /* I2C */
  io_ctx.Address     = ISM303DAC_I2C_ADD_XL;
  io_ctx.Init        = CUSTOM_ISM303DAC_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_ISM303DAC_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM303DAC_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM303DAC_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM303DAC_ACC_RegisterBusIO(&ism303dac_acc_obj_0, &io_ctx) != ISM303DAC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM303DAC_ACC_ReadID(&ism303dac_acc_obj_0, &id) != ISM303DAC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)ISM303DAC_ID_XL)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM303DAC_ACC_GetCapabilities(&ism303dac_acc_obj_0, &cap);
    MotionCtx[CUSTOM_ISM303DAC_ACC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM303DAC_ACC_0] = &ism303dac_acc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM303DAC_ACC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM303DAC_ACC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM303DAC_ACC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(
            void *)&ISM303DAC_ACC_Driver;

      if (MotionDrv[CUSTOM_ISM303DAC_ACC_0]->Init(MotionCompObj[CUSTOM_ISM303DAC_ACC_0]) != ISM303DAC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif

#if (USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0 == 1)
/**
 * @brief  Register Bus IOs for ISM303DAC magnetometer instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t ISM303DAC_MAG_0_Probe(uint32_t Functions)
{
  ISM303DAC_IO_t                io_ctx;
  uint8_t                       id;
  static ISM303DAC_MAG_Object_t ism303dac_mag_obj_0;
  ISM303DAC_Capabilities_t      cap;
  int32_t                       ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM303DAC_I2C_BUS; /* I2C */
  io_ctx.Address     = ISM303DAC_I2C_ADD_MG;
  io_ctx.Init        = CUSTOM_ISM303DAC_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_ISM303DAC_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM303DAC_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM303DAC_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM303DAC_MAG_RegisterBusIO(&ism303dac_mag_obj_0, &io_ctx) != ISM303DAC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM303DAC_MAG_ReadID(&ism303dac_mag_obj_0, &id) != ISM303DAC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)ISM303DAC_ID_MG)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM303DAC_MAG_GetCapabilities(&ism303dac_mag_obj_0, &cap);
    MotionCtx[CUSTOM_ISM303DAC_MAG_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM303DAC_MAG_0] = &ism303dac_mag_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM303DAC_MAG_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM303DAC_MAG_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM303DAC_MAG_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM303DAC_MAG_Driver;

      if (MotionDrv[CUSTOM_ISM303DAC_MAG_0]->Init(MotionCompObj[CUSTOM_ISM303DAC_MAG_0]) != ISM303DAC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useIIS2DLPCI2C]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0  == 1)
/**
 * @brief  Register Bus IOs for IIS2DLPC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t IIS2DLPC_0_Probe(uint32_t Functions)
{
  IIS2DLPC_IO_t            io_ctx;
  uint8_t                  id;
  static IIS2DLPC_Object_t iis2dlpc_obj_0;
  IIS2DLPC_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = IIS2DLPC_I2C_BUS; /* I2C */
[#if IIS2DLPC_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = IIS2DLPC_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if IIS2DLPC_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = IIS2DLPC_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_IIS2DLPC_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_IIS2DLPC_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_IIS2DLPC_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_IIS2DLPC_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (IIS2DLPC_RegisterBusIO(&iis2dlpc_obj_0, &io_ctx) != IIS2DLPC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (IIS2DLPC_ReadID(&iis2dlpc_obj_0, &id) != IIS2DLPC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != IIS2DLPC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)IIS2DLPC_GetCapabilities(&iis2dlpc_obj_0, &cap);
    MotionCtx[CUSTOM_IIS2DLPC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_IIS2DLPC_0] = &iis2dlpc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_IIS2DLPC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&IIS2DLPC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_IIS2DLPC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&IIS2DLPC_ACC_Driver;

      if (MotionDrv[CUSTOM_IIS2DLPC_0]->Init(MotionCompObj[CUSTOM_IIS2DLPC_0]) != IIS2DLPC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useIIS2DLPCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0  == 1)
/**
 * @brief  Register Bus IOs for IIS2DLPC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t IIS2DLPC_0_Probe(uint32_t Functions)
{
  IIS2DLPC_IO_t            io_ctx;
  uint8_t                  id;
  static IIS2DLPC_Object_t iis2dlpc_obj_0;
  IIS2DLPC_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = IIS2DLPC_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_IIS2DLPC_0_Init;
  io_ctx.DeInit      = CUSTOM_IIS2DLPC_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_IIS2DLPC_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_IIS2DLPC_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (IIS2DLPC_RegisterBusIO(&iis2dlpc_obj_0, &io_ctx) != IIS2DLPC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (IIS2DLPC_ReadID(&iis2dlpc_obj_0, &id) != IIS2DLPC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != IIS2DLPC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)IIS2DLPC_GetCapabilities(&iis2dlpc_obj_0, &cap);
    MotionCtx[CUSTOM_IIS2DLPC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_IIS2DLPC_0] = &iis2dlpc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_IIS2DLPC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&IIS2DLPC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_IIS2DLPC_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&IIS2DLPC_ACC_Driver;

      if (MotionDrv[CUSTOM_IIS2DLPC_0]->Init(MotionCompObj[CUSTOM_IIS2DLPC_0]) != IIS2DLPC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for IIS2DLPC
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2DLPC_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_IIS2DLPC_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for IIS2DLPC
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2DLPC_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_IIS2DLPC_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for IIS2DLPC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2DLPC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_IIS2DLPC_0_CS_PORT, CUSTOM_IIS2DLPC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_IIS2DLPC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_IIS2DLPC_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_IIS2DLPC_0_CS_PORT, CUSTOM_IIS2DLPC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for IIS2DLPC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2DLPC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_IIS2DLPC_0_CS_PORT, CUSTOM_IIS2DLPC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_IIS2DLPC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_IIS2DLPC_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_IIS2DLPC_0_CS_PORT, CUSTOM_IIS2DLPC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useIIS2MDCI2C]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
/**
 * @brief  Register Bus IOs for IIS2MDC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t IIS2MDC_0_Probe(uint32_t Functions)
{
  IIS2MDC_IO_t            io_ctx;
  uint8_t                 id;
  static IIS2MDC_Object_t iis2mdc_obj_0;
  IIS2MDC_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = IIS2MDC_I2C_BUS; /* I2C */
  io_ctx.Address     = IIS2MDC_I2C_ADD;
  io_ctx.Init        = CUSTOM_IIS2MDC_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_IIS2MDC_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_IIS2MDC_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_IIS2MDC_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (IIS2MDC_RegisterBusIO(&iis2mdc_obj_0, &io_ctx) != IIS2MDC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (IIS2MDC_ReadID(&iis2mdc_obj_0, &id) != IIS2MDC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)IIS2MDC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)IIS2MDC_GetCapabilities(&iis2mdc_obj_0, &cap);
    MotionCtx[CUSTOM_IIS2MDC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_IIS2MDC_0] = &iis2mdc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_IIS2MDC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&IIS2MDC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_IIS2MDC_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&IIS2MDC_MAG_Driver;

      if (MotionDrv[CUSTOM_IIS2MDC_0]->Init(MotionCompObj[CUSTOM_IIS2MDC_0]) != IIS2MDC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useIIS2MDCSPI]
#if (USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0 == 1)
/**
 * @brief  Register Bus IOs for IIS2MDC instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_MAGNETO
 * @retval BSP status
 */
static int32_t IIS2MDC_0_Probe(uint32_t Functions)
{
  IIS2MDC_IO_t            io_ctx;
  uint8_t                 id;
  static IIS2MDC_Object_t iis2mdc_obj_0;
  IIS2MDC_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = IIS2MDC_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_IIS2MDC_0_Init;
  io_ctx.DeInit      = CUSTOM_IIS2MDC_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_IIS2MDC_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_IIS2MDC_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (IIS2MDC_RegisterBusIO(&iis2mdc_obj_0, &io_ctx) != IIS2MDC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (IIS2MDC_ReadID(&iis2mdc_obj_0, &id) != IIS2MDC_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != (uint8_t)IIS2MDC_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)IIS2MDC_GetCapabilities(&iis2mdc_obj_0, &cap);
    MotionCtx[CUSTOM_IIS2MDC_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_IIS2MDC_0] = &iis2mdc_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_IIS2MDC_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&IIS2MDC_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO) && (cap.Magneto == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_IIS2MDC_0][FunctionIndex[MOTION_MAGNETO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&IIS2MDC_MAG_Driver;

      if (MotionDrv[CUSTOM_IIS2MDC_0]->Init(MotionCompObj[CUSTOM_IIS2MDC_0]) != IIS2MDC_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for IIS2MDC
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2MDC_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_IIS2MDC_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for IIS2MDC
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2MDC_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_IIS2MDC_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for IIS2MDC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2MDC_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_IIS2MDC_0_CS_PORT, CUSTOM_IIS2MDC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_IIS2MDC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_IIS2MDC_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_IIS2MDC_0_CS_PORT, CUSTOM_IIS2MDC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for IIS2MDC
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_IIS2MDC_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_IIS2MDC_0_CS_PORT, CUSTOM_IIS2MDC_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_IIS2MDC_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_IIS2MDC_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_IIS2MDC_0_CS_PORT, CUSTOM_IIS2MDC_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useISM330DHCXI2C]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0  == 1)
/**
 * @brief  Register Bus IOs for ISM330DHCX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ISM330DHCX_0_Probe(uint32_t Functions)
{
  ISM330DHCX_IO_t            io_ctx;
  uint8_t                    id;
  static ISM330DHCX_Object_t ism330dhcx_obj_0;
  ISM330DHCX_Capabilities_t  cap;
  int32_t                    ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM330DHCX_I2C_BUS; /* I2C */
[#if ISM330DHCX_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = ISM330DHCX_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if ISM330DHCX_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = ISM330DHCX_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_ISM330DHCX_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_ISM330DHCX_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM330DHCX_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM330DHCX_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM330DHCX_RegisterBusIO(&ism330dhcx_obj_0, &io_ctx) != ISM330DHCX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM330DHCX_ReadID(&ism330dhcx_obj_0, &id) != ISM330DHCX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ISM330DHCX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM330DHCX_GetCapabilities(&ism330dhcx_obj_0, &cap);
    MotionCtx[CUSTOM_ISM330DHCX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM330DHCX_0] = &ism330dhcx_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM330DHCX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM330DHCX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DHCX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DHCX_GYRO_Driver;

      if (MotionDrv[CUSTOM_ISM330DHCX_0]->Init(MotionCompObj[CUSTOM_ISM330DHCX_0]) != ISM330DHCX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DHCX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DHCX_ACC_Driver;

      if (MotionDrv[CUSTOM_ISM330DHCX_0]->Init(MotionCompObj[CUSTOM_ISM330DHCX_0]) != ISM330DHCX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useISM330DHCXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0  == 1)
/**
 * @brief  Register Bus IOs for ISM330DHCX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t ISM330DHCX_0_Probe(uint32_t Functions)
{
  ISM330DHCX_IO_t            io_ctx;
  uint8_t                    id;
  static ISM330DHCX_Object_t ism330dhcx_obj_0;
  ISM330DHCX_Capabilities_t  cap;
  int32_t                    ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = ISM330DHCX_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_ISM330DHCX_0_Init;
  io_ctx.DeInit      = CUSTOM_ISM330DHCX_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_ISM330DHCX_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_ISM330DHCX_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (ISM330DHCX_RegisterBusIO(&ism330dhcx_obj_0, &io_ctx) != ISM330DHCX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (ISM330DHCX_ReadID(&ism330dhcx_obj_0, &id) != ISM330DHCX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != ISM330DHCX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)ISM330DHCX_GetCapabilities(&ism330dhcx_obj_0, &cap);
    MotionCtx[CUSTOM_ISM330DHCX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_ISM330DHCX_0] = &ism330dhcx_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_ISM330DHCX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&ISM330DHCX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DHCX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DHCX_GYRO_Driver;

      if (MotionDrv[CUSTOM_ISM330DHCX_0]->Init(MotionCompObj[CUSTOM_ISM330DHCX_0]) != ISM330DHCX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_ISM330DHCX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&ISM330DHCX_ACC_Driver;

      if (MotionDrv[CUSTOM_ISM330DHCX_0]->Init(MotionCompObj[CUSTOM_ISM330DHCX_0]) != ISM330DHCX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for ISM330DHCX
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DHCX_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ISM330DHCX_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for ISM330DHCX
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DHCX_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_ISM330DHCX_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for ISM330DHCX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DHCX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DHCX_0_CS_PORT, CUSTOM_ISM330DHCX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ISM330DHCX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ISM330DHCX_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DHCX_0_CS_PORT, CUSTOM_ISM330DHCX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for ISM330DHCX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_ISM330DHCX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DHCX_0_CS_PORT, CUSTOM_ISM330DHCX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_ISM330DHCX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_ISM330DHCX_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_ISM330DHCX_0_CS_PORT, CUSTOM_ISM330DHCX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLSM6DSRI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSR instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSR_0_Probe(uint32_t Functions)
{
  LSM6DSR_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSR_Object_t lsm6dsr_obj_0;
  LSM6DSR_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSR_I2C_BUS; /* I2C */
[#if LSM6DSR_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSR_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LSM6DSR_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSR_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LSM6DSR_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSR_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSR_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSR_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSR_RegisterBusIO(&lsm6dsr_obj_0, &io_ctx) != LSM6DSR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSR_ReadID(&lsm6dsr_obj_0, &id) != LSM6DSR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSR_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSR_GetCapabilities(&lsm6dsr_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSR_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSR_0] = &lsm6dsr_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSR_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSR_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSR_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSR_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSR_0]->Init(MotionCompObj[CUSTOM_LSM6DSR_0]) != LSM6DSR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSR_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSR_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSR_0]->Init(MotionCompObj[CUSTOM_LSM6DSR_0]) != LSM6DSR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLSM6DSRSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSR instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSR_0_Probe(uint32_t Functions)
{
  LSM6DSR_IO_t            io_ctx;
  uint8_t                 id;
  static LSM6DSR_Object_t lsm6dsr_obj_0;
  LSM6DSR_Capabilities_t  cap;
  int32_t                 ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSR_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LSM6DSR_0_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSR_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSR_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSR_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSR_RegisterBusIO(&lsm6dsr_obj_0, &io_ctx) != LSM6DSR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSR_ReadID(&lsm6dsr_obj_0, &id) != LSM6DSR_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSR_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSR_GetCapabilities(&lsm6dsr_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSR_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSR_0] = &lsm6dsr_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSR_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSR_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSR_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSR_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSR_0]->Init(MotionCompObj[CUSTOM_LSM6DSR_0]) != LSM6DSR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSR_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSR_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSR_0]->Init(MotionCompObj[CUSTOM_LSM6DSR_0]) != LSM6DSR_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LSM6DSR
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSR_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSR_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LSM6DSR
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSR_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSR_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LSM6DSR
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSR_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSR_0_CS_PORT, CUSTOM_LSM6DSR_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSR_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSR_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSR_0_CS_PORT, CUSTOM_LSM6DSR_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LSM6DSR
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSR_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSR_0_CS_PORT, CUSTOM_LSM6DSR_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSR_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSR_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSR_0_CS_PORT, CUSTOM_LSM6DSR_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useAIS2DW12I2C]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0  == 1)
/**
 * @brief  Register Bus IOs for AIS2DW12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS2DW12_0_Probe(uint32_t Functions)
{
  AIS2DW12_IO_t            io_ctx;
  uint8_t                  id;
  static AIS2DW12_Object_t ais2dw12_obj_0;
  AIS2DW12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS2DW12_I2C_BUS; /* I2C */
[#if AIS2DW12_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = AIS2DW12_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if AIS2DW12_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = AIS2DW12_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_AIS2DW12_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_AIS2DW12_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS2DW12_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS2DW12_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS2DW12_RegisterBusIO(&ais2dw12_obj_0, &io_ctx) != AIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS2DW12_ReadID(&ais2dw12_obj_0, &id) != AIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS2DW12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS2DW12_GetCapabilities(&ais2dw12_obj_0, &cap);
    MotionCtx[CUSTOM_AIS2DW12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS2DW12_0] = &ais2dw12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS2DW12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS2DW12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS2DW12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS2DW12_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS2DW12_0]->Init(MotionCompObj[CUSTOM_AIS2DW12_0]) != AIS2DW12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useAIS2DW12SPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0  == 1)
/**
 * @brief  Register Bus IOs for AIS2DW12 instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS2DW12_0_Probe(uint32_t Functions)
{
  AIS2DW12_IO_t            io_ctx;
  uint8_t                  id;
  static AIS2DW12_Object_t ais2dw12_obj_0;
  AIS2DW12_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS2DW12_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_AIS2DW12_0_Init;
  io_ctx.DeInit      = CUSTOM_AIS2DW12_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS2DW12_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS2DW12_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS2DW12_RegisterBusIO(&ais2dw12_obj_0, &io_ctx) != AIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS2DW12_ReadID(&ais2dw12_obj_0, &id) != AIS2DW12_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS2DW12_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS2DW12_GetCapabilities(&ais2dw12_obj_0, &cap);
    MotionCtx[CUSTOM_AIS2DW12_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS2DW12_0] = &ais2dw12_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS2DW12_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS2DW12_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS2DW12_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS2DW12_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS2DW12_0]->Init(MotionCompObj[CUSTOM_AIS2DW12_0]) != AIS2DW12_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for AIS2DW12
 * @retval BSP status
 */
static int32_t CUSTOM_AIS2DW12_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS2DW12_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for AIS2DW12
 * @retval BSP status
 */
static int32_t CUSTOM_AIS2DW12_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS2DW12_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for AIS2DW12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_AIS2DW12_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS2DW12_0_CS_PORT, CUSTOM_AIS2DW12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS2DW12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS2DW12_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS2DW12_0_CS_PORT, CUSTOM_AIS2DW12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for AIS2DW12
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_AIS2DW12_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS2DW12_0_CS_PORT, CUSTOM_AIS2DW12_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS2DW12_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS2DW12_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS2DW12_0_CS_PORT, CUSTOM_AIS2DW12_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useA3G4250DI2C]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0  == 1)
/**
 * @brief  Register Bus IOs for A3G4250D instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO
 * @retval BSP status
 */
static int32_t A3G4250D_0_Probe(uint32_t Functions)
{
  A3G4250D_IO_t            io_ctx;
  uint8_t                  id;
  static A3G4250D_Object_t a3g4250d_obj_0;
  A3G4250D_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = A3G4250D_I2C_BUS; /* I2C */
[#if A3G4250D_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = A3G4250D_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if A3G4250D_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = A3G4250D_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_A3G4250D_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_A3G4250D_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_A3G4250D_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_A3G4250D_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (A3G4250D_RegisterBusIO(&a3g4250d_obj_0, &io_ctx) != A3G4250D_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (A3G4250D_ReadID(&a3g4250d_obj_0, &id) != A3G4250D_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != A3G4250D_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)A3G4250D_GetCapabilities(&a3g4250d_obj_0, &cap);
    MotionCtx[CUSTOM_A3G4250D_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_A3G4250D_0] = &a3g4250d_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_A3G4250D_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&A3G4250D_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_A3G4250D_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&A3G4250D_GYRO_Driver;

      if (MotionDrv[CUSTOM_A3G4250D_0]->Init(MotionCompObj[CUSTOM_A3G4250D_0]) != A3G4250D_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useA3G4250DSPI]
#if (USE_CUSTOM_MOTION_SENSOR_A3G4250D_0  == 1)
/**
 * @brief  Register Bus IOs for A3G4250D instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO
 * @retval BSP status
 */
static int32_t A3G4250D_0_Probe(uint32_t Functions)
{
  A3G4250D_IO_t            io_ctx;
  uint8_t                  id;
  static A3G4250D_Object_t a3g4250d_obj_0;
  A3G4250D_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = A3G4250D_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_A3G4250D_0_Init;
  io_ctx.DeInit      = CUSTOM_A3G4250D_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_A3G4250D_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_A3G4250D_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (A3G4250D_RegisterBusIO(&a3g4250d_obj_0, &io_ctx) != A3G4250D_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (A3G4250D_ReadID(&a3g4250d_obj_0, &id) != A3G4250D_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != A3G4250D_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)A3G4250D_GetCapabilities(&a3g4250d_obj_0, &cap);
    MotionCtx[CUSTOM_A3G4250D_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_A3G4250D_0] = &a3g4250d_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_A3G4250D_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&A3G4250D_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_A3G4250D_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&A3G4250D_GYRO_Driver;

      if (MotionDrv[CUSTOM_A3G4250D_0]->Init(MotionCompObj[CUSTOM_A3G4250D_0]) != A3G4250D_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for A3G4250D
 * @retval BSP status
 */
static int32_t CUSTOM_A3G4250D_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_A3G4250D_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for A3G4250D
 * @retval BSP status
 */
static int32_t CUSTOM_A3G4250D_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_A3G4250D_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for A3G4250D
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_A3G4250D_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_A3G4250D_0_CS_PORT, CUSTOM_A3G4250D_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_A3G4250D_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_A3G4250D_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_A3G4250D_0_CS_PORT, CUSTOM_A3G4250D_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for A3G4250D
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_A3G4250D_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_A3G4250D_0_CS_PORT, CUSTOM_A3G4250D_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_A3G4250D_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_A3G4250D_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_A3G4250D_0_CS_PORT, CUSTOM_A3G4250D_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useAIS328DQI2C]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0  == 1)
/**
 * @brief  Register Bus IOs for AIS328DQ instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS328DQ_0_Probe(uint32_t Functions)
{
  AIS328DQ_IO_t            io_ctx;
  uint8_t                  id;
  static AIS328DQ_Object_t ais328dq_obj_0;
  AIS328DQ_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS328DQ_I2C_BUS; /* I2C */
[#if AIS328DQ_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = AIS328DQ_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if AIS328DQ_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = AIS328DQ_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_AIS328DQ_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_AIS328DQ_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS328DQ_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS328DQ_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS328DQ_RegisterBusIO(&ais328dq_obj_0, &io_ctx) != AIS328DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS328DQ_ReadID(&ais328dq_obj_0, &id) != AIS328DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS328DQ_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS328DQ_GetCapabilities(&ais328dq_obj_0, &cap);
    MotionCtx[CUSTOM_AIS328DQ_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS328DQ_0] = &ais328dq_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS328DQ_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS328DQ_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS328DQ_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS328DQ_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS328DQ_0]->Init(MotionCompObj[CUSTOM_AIS328DQ_0]) != AIS328DQ_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useAIS328DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0  == 1)
/**
 * @brief  Register Bus IOs for AIS328DQ instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS328DQ_0_Probe(uint32_t Functions)
{
  AIS328DQ_IO_t            io_ctx;
  uint8_t                  id;
  static AIS328DQ_Object_t ais328dq_obj_0;
  AIS328DQ_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS328DQ_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_AIS328DQ_0_Init;
  io_ctx.DeInit      = CUSTOM_AIS328DQ_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS328DQ_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS328DQ_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS328DQ_RegisterBusIO(&ais328dq_obj_0, &io_ctx) != AIS328DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS328DQ_ReadID(&ais328dq_obj_0, &id) != AIS328DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS328DQ_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS328DQ_GetCapabilities(&ais328dq_obj_0, &cap);
    MotionCtx[CUSTOM_AIS328DQ_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS328DQ_0] = &ais328dq_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS328DQ_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS328DQ_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS328DQ_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS328DQ_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS328DQ_0]->Init(MotionCompObj[CUSTOM_AIS328DQ_0]) != AIS328DQ_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for AIS328DQ
 * @retval BSP status
 */
static int32_t CUSTOM_AIS328DQ_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS328DQ_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for AIS328DQ
 * @retval BSP status
 */
static int32_t CUSTOM_AIS328DQ_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS328DQ_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for AIS328DQ
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_AIS328DQ_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS328DQ_0_CS_PORT, CUSTOM_AIS328DQ_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS328DQ_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS328DQ_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS328DQ_0_CS_PORT, CUSTOM_AIS328DQ_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for AIS328DQ
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_AIS328DQ_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS328DQ_0_CS_PORT, CUSTOM_AIS328DQ_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS328DQ_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS328DQ_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS328DQ_0_CS_PORT, CUSTOM_AIS328DQ_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useAIS3624DQI2C]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0  == 1)
/**
 * @brief  Register Bus IOs for AIS3624DQ instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS3624DQ_0_Probe(uint32_t Functions)
{
  AIS3624DQ_IO_t            io_ctx;
  uint8_t                   id;
  static AIS3624DQ_Object_t ais3624dq_obj_0;
  AIS3624DQ_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS3624DQ_I2C_BUS; /* I2C */
[#if AIS3624DQ_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = AIS3624DQ_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if AIS3624DQ_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = AIS3624DQ_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_AIS3624DQ_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_AIS3624DQ_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS3624DQ_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS3624DQ_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS3624DQ_RegisterBusIO(&ais3624dq_obj_0, &io_ctx) != AIS3624DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS3624DQ_ReadID(&ais3624dq_obj_0, &id) != AIS3624DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS3624DQ_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS3624DQ_GetCapabilities(&ais3624dq_obj_0, &cap);
    MotionCtx[CUSTOM_AIS3624DQ_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS3624DQ_0] = &ais3624dq_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS3624DQ_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS3624DQ_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS3624DQ_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS3624DQ_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS3624DQ_0]->Init(MotionCompObj[CUSTOM_AIS3624DQ_0]) != AIS3624DQ_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useAIS3624DQSPI]
#if (USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0  == 1)
/**
 * @brief  Register Bus IOs for AIS3624DQ instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t AIS3624DQ_0_Probe(uint32_t Functions)
{
  AIS3624DQ_IO_t            io_ctx;
  uint8_t                   id;
  static AIS3624DQ_Object_t ais3624dq_obj_0;
  AIS3624DQ_Capabilities_t  cap;
  int32_t                   ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = AIS3624DQ_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_AIS3624DQ_0_Init;
  io_ctx.DeInit      = CUSTOM_AIS3624DQ_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_AIS3624DQ_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_AIS3624DQ_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (AIS3624DQ_RegisterBusIO(&ais3624dq_obj_0, &io_ctx) != AIS3624DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (AIS3624DQ_ReadID(&ais3624dq_obj_0, &id) != AIS3624DQ_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != AIS3624DQ_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)AIS3624DQ_GetCapabilities(&ais3624dq_obj_0, &cap);
    MotionCtx[CUSTOM_AIS3624DQ_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_AIS3624DQ_0] = &ais3624dq_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_AIS3624DQ_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&AIS3624DQ_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_AIS3624DQ_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&AIS3624DQ_ACC_Driver;

      if (MotionDrv[CUSTOM_AIS3624DQ_0]->Init(MotionCompObj[CUSTOM_AIS3624DQ_0]) != AIS3624DQ_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for AIS3624DQ
 * @retval BSP status
 */
static int32_t CUSTOM_AIS3624DQ_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS3624DQ_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for AIS3624DQ
 * @retval BSP status
 */
static int32_t CUSTOM_AIS3624DQ_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_AIS3624DQ_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for AIS3624DQ
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_AIS3624DQ_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS3624DQ_0_CS_PORT, CUSTOM_AIS3624DQ_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS3624DQ_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS3624DQ_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS3624DQ_0_CS_PORT, CUSTOM_AIS3624DQ_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for AIS3624DQ
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_AIS3624DQ_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_AIS3624DQ_0_CS_PORT, CUSTOM_AIS3624DQ_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_AIS3624DQ_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_AIS3624DQ_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_AIS3624DQ_0_CS_PORT, CUSTOM_AIS3624DQ_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useH3LIS331DLI2C]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0  == 1)
/**
 * @brief  Register Bus IOs for H3LIS331DL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t H3LIS331DL_0_Probe(uint32_t Functions)
{
  H3LIS331DL_IO_t            io_ctx;
  uint8_t                    id;
  static H3LIS331DL_Object_t h3lis331dl_obj_0;
  H3LIS331DL_Capabilities_t  cap;
  int32_t                    ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = H3LIS331DL_I2C_BUS; /* I2C */
[#if H3LIS331DL_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = H3LIS331DL_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if H3LIS331DL_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = H3LIS331DL_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_H3LIS331DL_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_H3LIS331DL_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_H3LIS331DL_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_H3LIS331DL_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (H3LIS331DL_RegisterBusIO(&h3lis331dl_obj_0, &io_ctx) != H3LIS331DL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (H3LIS331DL_ReadID(&h3lis331dl_obj_0, &id) != H3LIS331DL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != H3LIS331DL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)H3LIS331DL_GetCapabilities(&h3lis331dl_obj_0, &cap);
    MotionCtx[CUSTOM_H3LIS331DL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_H3LIS331DL_0] = &h3lis331dl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_H3LIS331DL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&H3LIS331DL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_H3LIS331DL_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&H3LIS331DL_ACC_Driver;

      if (MotionDrv[CUSTOM_H3LIS331DL_0]->Init(MotionCompObj[CUSTOM_H3LIS331DL_0]) != H3LIS331DL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useH3LIS331DLSPI]
#if (USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0  == 1)
/**
 * @brief  Register Bus IOs for H3LIS331DL instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t H3LIS331DL_0_Probe(uint32_t Functions)
{
  H3LIS331DL_IO_t            io_ctx;
  uint8_t                    id;
  static H3LIS331DL_Object_t h3lis331dl_obj_0;
  H3LIS331DL_Capabilities_t  cap;
  int32_t                    ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = H3LIS331DL_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_H3LIS331DL_0_Init;
  io_ctx.DeInit      = CUSTOM_H3LIS331DL_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_H3LIS331DL_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_H3LIS331DL_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (H3LIS331DL_RegisterBusIO(&h3lis331dl_obj_0, &io_ctx) != H3LIS331DL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (H3LIS331DL_ReadID(&h3lis331dl_obj_0, &id) != H3LIS331DL_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != H3LIS331DL_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)H3LIS331DL_GetCapabilities(&h3lis331dl_obj_0, &cap);
    MotionCtx[CUSTOM_H3LIS331DL_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_H3LIS331DL_0] = &h3lis331dl_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_H3LIS331DL_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&H3LIS331DL_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_H3LIS331DL_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&H3LIS331DL_ACC_Driver;

      if (MotionDrv[CUSTOM_H3LIS331DL_0]->Init(MotionCompObj[CUSTOM_H3LIS331DL_0]) != H3LIS331DL_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for H3LIS331DL
 * @retval BSP status
 */
static int32_t CUSTOM_H3LIS331DL_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_H3LIS331DL_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for H3LIS331DL
 * @retval BSP status
 */
static int32_t CUSTOM_H3LIS331DL_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_H3LIS331DL_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for H3LIS331DL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_H3LIS331DL_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_H3LIS331DL_0_CS_PORT, CUSTOM_H3LIS331DL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_H3LIS331DL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_H3LIS331DL_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_H3LIS331DL_0_CS_PORT, CUSTOM_H3LIS331DL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for H3LIS331DL
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_H3LIS331DL_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_H3LIS331DL_0_CS_PORT, CUSTOM_H3LIS331DL_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_H3LIS331DL_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_H3LIS331DL_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_H3LIS331DL_0_CS_PORT, CUSTOM_H3LIS331DL_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLSM6DSRXI2C]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSRX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSRX_0_Probe(uint32_t Functions)
{
  LSM6DSRX_IO_t            io_ctx;
  uint8_t                  id;
  static LSM6DSRX_Object_t lsm6dsrx_obj_0;
  LSM6DSRX_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSRX_I2C_BUS; /* I2C */
[#if LSM6DSRX_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSRX_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LSM6DSRX_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LSM6DSRX_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LSM6DSRX_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSRX_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSRX_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSRX_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSRX_RegisterBusIO(&lsm6dsrx_obj_0, &io_ctx) != LSM6DSRX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSRX_ReadID(&lsm6dsrx_obj_0, &id) != LSM6DSRX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSRX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSRX_GetCapabilities(&lsm6dsrx_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSRX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSRX_0] = &lsm6dsrx_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSRX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSRX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSRX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSRX_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSRX_0]->Init(MotionCompObj[CUSTOM_LSM6DSRX_0]) != LSM6DSRX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSRX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSRX_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSRX_0]->Init(MotionCompObj[CUSTOM_LSM6DSRX_0]) != LSM6DSRX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLSM6DSRXSPI]
#if (USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0  == 1)
/**
 * @brief  Register Bus IOs for LSM6DSRX instance
 * @param  Functions Motion sensor functions. Could be :
 *         - MOTION_GYRO and/or MOTION_ACCELERO
 * @retval BSP status
 */
static int32_t LSM6DSRX_0_Probe(uint32_t Functions)
{
  LSM6DSRX_IO_t            io_ctx;
  uint8_t                  id;
  static LSM6DSRX_Object_t lsm6dsrx_obj_0;
  LSM6DSRX_Capabilities_t  cap;
  int32_t                  ret = BSP_ERROR_NONE;

  /* Configure the driver */
  io_ctx.BusType     = LSM6DSRX_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LSM6DSRX_0_Init;
  io_ctx.DeInit      = CUSTOM_LSM6DSRX_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LSM6DSRX_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LSM6DSRX_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LSM6DSRX_RegisterBusIO(&lsm6dsrx_obj_0, &io_ctx) != LSM6DSRX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LSM6DSRX_ReadID(&lsm6dsrx_obj_0, &id) != LSM6DSRX_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LSM6DSRX_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LSM6DSRX_GetCapabilities(&lsm6dsrx_obj_0, &cap);
    MotionCtx[CUSTOM_LSM6DSRX_0].Functions = ((uint32_t)cap.Gyro) | ((uint32_t)cap.Acc << 1) | ((uint32_t)cap.Magneto << 2);

    MotionCompObj[CUSTOM_LSM6DSRX_0] = &lsm6dsrx_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    MotionDrv[CUSTOM_LSM6DSRX_0] = (MOTION_SENSOR_CommonDrv_t *)(void *)&LSM6DSRX_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_GYRO) == MOTION_GYRO) && (cap.Gyro == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSRX_0][FunctionIndex[MOTION_GYRO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSRX_GYRO_Driver;

      if (MotionDrv[CUSTOM_LSM6DSRX_0]->Init(MotionCompObj[CUSTOM_LSM6DSRX_0]) != LSM6DSRX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_ACCELERO) == MOTION_ACCELERO) && (cap.Acc == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      MotionFuncDrv[CUSTOM_LSM6DSRX_0][FunctionIndex[MOTION_ACCELERO]] = (MOTION_SENSOR_FuncDrv_t *)(void *)&LSM6DSRX_ACC_Driver;

      if (MotionDrv[CUSTOM_LSM6DSRX_0]->Init(MotionCompObj[CUSTOM_LSM6DSRX_0]) != LSM6DSRX_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & MOTION_MAGNETO) == MOTION_MAGNETO))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LSM6DSRX
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSRX_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSRX_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LSM6DSRX
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSRX_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LSM6DSRX_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LSM6DSRX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSRX_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSRX_0_CS_PORT, CUSTOM_LSM6DSRX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSRX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSRX_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSRX_0_CS_PORT, CUSTOM_LSM6DSRX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LSM6DSRX
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LSM6DSRX_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSRX_0_CS_PORT, CUSTOM_LSM6DSRX_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LSM6DSRX_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LSM6DSRX_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LSM6DSRX_0_CS_PORT, CUSTOM_LSM6DSRX_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
