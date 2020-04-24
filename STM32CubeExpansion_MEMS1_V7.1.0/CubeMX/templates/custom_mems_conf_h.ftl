[#ftl]
/**
 ******************************************************************************
 * @file    custom_mems_conf.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions of the MEMS components bus interfaces for custom boards
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

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign LSM6DSLI2CInstance = ""]
[#assign LSM6DSLSpiInstance = ""]
[#assign LSM6DSL_CS_PORT = ""]
[#assign LSM6DSL_CS_PIN = ""]
[#assign LSM303AGRI2CInstance = ""]
[#assign LIS3MDLI2CInstance = ""]
[#assign LIS3MDLSpiInstance = ""]
[#assign LIS3MDL_CS_PORT = ""]
[#assign LIS3MDL_CS_PIN = ""]
[#assign LSM6DSOI2CInstance = ""]
[#assign LSM6DSOSpiInstance = ""]
[#assign LSM6DSO_CS_PORT = ""]
[#assign LSM6DSO_CS_PIN = ""]
[#assign LIS2DW12I2CInstance = ""]
[#assign LIS2DW12SpiInstance = ""]
[#assign LIS2DW12_CS_PORT = ""]
[#assign LIS2DW12_CS_PIN = ""]
[#assign LIS2MDLI2CInstance = ""]
[#assign LIS2MDLSpiInstance = ""]
[#assign LIS2MDL_CS_PORT = ""]
[#assign LIS2MDL_CS_PIN = ""]
[#assign HTS221I2CInstance = ""]
[#assign LPS22HBI2CInstance = ""]
[#assign LPS22HBSpiInstance = ""]
[#assign LPS22HB_CS_PORT = ""]
[#assign LPS22HB_CS_PIN = ""]
[#assign LPS22HHI2CInstance = ""]
[#assign LPS22HHSpiInstance = ""]
[#assign LPS22HH_CS_PORT = ""]
[#assign LPS22HH_CS_PIN = ""]
[#assign STTS751I2CInstance = ""]
[#assign LSM6DSOXI2CInstance = ""]
[#assign LSM6DSOXSpiInstance = ""]
[#assign LSM6DSOX_CS_PORT = ""]
[#assign LSM6DSOX_CS_PIN = ""]
[#assign LPS33HWI2CInstance = ""]
[#assign LPS33HWSpiInstance = ""]
[#assign LPS33HW_CS_PORT = ""]
[#assign LPS33HW_CS_PIN = ""]
[#assign LIS2DH12I2CInstance = ""]
[#assign LIS2DH12SpiInstance = ""]
[#assign LIS2DH12_CS_PORT = ""]
[#assign LIS2DH12_CS_PIN = ""]
[#assign ASM330LHHI2CInstance = ""]
[#assign ASM330LHHSpiInstance = ""]
[#assign ASM330LHH_CS_PORT = ""]
[#assign ASM330LHH_CS_PIN = ""]
[#assign ISM330DLCI2CInstance = ""]
[#assign ISM330DLCSpiInstance = ""]
[#assign ISM330DLC_CS_PORT = ""]
[#assign ISM330DLC_CS_PIN = ""]
[#assign ISM303DACI2CInstance = ""]
[#assign IIS2DLPCI2CInstance = ""]
[#assign IIS2DLPCSpiInstance = ""]
[#assign IIS2DLPC_CS_PORT = ""]
[#assign IIS2DLPC_CS_PIN = ""]
[#assign IIS2MDCI2CInstance = ""]
[#assign IIS2MDCSpiInstance = ""]
[#assign IIS2MDC_CS_PORT = ""]
[#assign IIS2MDC_CS_PIN = ""]
[#assign ISM330DHCXI2CInstance = ""]
[#assign ISM330DHCXSpiInstance = ""]
[#assign ISM330DHCX_CS_PORT = ""]
[#assign ISM330DHCX_CS_PIN = ""]
[#assign LSM6DSRI2CInstance = ""]
[#assign LSM6DSRSpiInstance = ""]
[#assign LSM6DSR_CS_PORT = ""]
[#assign LSM6DSR_CS_PIN = ""]
[#assign AIS2DW12I2CInstance = ""]
[#assign AIS2DW12SpiInstance = ""]
[#assign AIS2DW12_CS_PORT = ""]
[#assign AIS2DW12_CS_PIN = ""]
[#assign STTS22HI2CInstance = ""]
[#assign A3G4250DI2CInstance = ""]
[#assign A3G4250DSpiInstance = ""]
[#assign A3G4250D_CS_PORT = ""]
[#assign A3G4250D_CS_PIN = ""]
[#assign AIS328DQI2CInstance = ""]
[#assign AIS328DQSpiInstance = ""]
[#assign AIS328DQ_CS_PORT = ""]
[#assign AIS328DQ_CS_PIN = ""]
[#assign AIS3624DQI2CInstance = ""]
[#assign AIS3624DQSpiInstance = ""]
[#assign AIS3624DQ_CS_PORT = ""]
[#assign AIS3624DQ_CS_PIN = ""]
[#assign H3LIS331DLI2CInstance = ""]
[#assign H3LIS331DLSpiInstance = ""]
[#assign H3LIS331DL_CS_PORT = ""]
[#assign H3LIS331DL_CS_PIN = ""]
[#assign LSM6DSRXI2CInstance = ""]
[#assign LSM6DSRXSpiInstance = ""]
[#assign LSM6DSRX_CS_PORT = ""]
[#assign LSM6DSRX_CS_PIN = ""]

[#if BspIpDatas??]
  [#list BspIpDatas as SWIP]
    [#if SWIP.defines??]
      [#if SWIP.variables??]
        [#list SWIP.variables as variables]
          [#if variables.name?contains("IpInstance")]
            [#assign IpInstance = variables.value]
          [/#if]
          [#if variables.name?contains("IpName")]
            [#assign IpName = variables.value]
          [/#if]
          [#if variables.value?contains("LSM6DSL BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LSM6DSLSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LSM6DSLI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSL_CS")]
            [#assign LSM6DSL_CS_PORT = IpName]
            [#assign LSM6DSL_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LSM303AGR BUS IO driver")]
            [#if IpInstance?contains("I2C")]
              [#assign LSM303AGRI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LIS3MDL BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LIS3MDLSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LIS3MDLI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LIS3MDL_CS")]
            [#assign LIS3MDL_CS_PORT = IpName]
            [#assign LIS3MDL_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LSM6DSO BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LSM6DSOSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LSM6DSOI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSO_CS")]
            [#assign LSM6DSO_CS_PORT = IpName]
            [#assign LSM6DSO_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LIS2DW12 BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LIS2DW12SpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LIS2DW12I2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LIS2DW12_CS")]
            [#assign LIS2DW12_CS_PORT = IpName]
            [#assign LIS2DW12_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LIS2MDL BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LIS2MDLSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LIS2MDLI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LIS2MDL_CS")]
            [#assign LIS2MDL_CS_PORT = IpName]
            [#assign LIS2MDL_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("HTS221 BUS IO driver")]
            [#if IpInstance?contains("I2C")]
              [#assign HTS221I2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LPS22HB BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LPS22HBSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LPS22HBI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LPS22HB_CS")]
            [#assign LPS22HB_CS_PORT = IpName]
            [#assign LPS22HB_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LPS22HH BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LPS22HHSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LPS22HHI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LPS22HH_CS")]
            [#assign LPS22HH_CS_PORT = IpName]
            [#assign LPS22HH_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("STTS751 BUS IO driver")]
            [#if IpInstance?contains("I2C")]
              [#assign STTS751I2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSOX BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LSM6DSOXSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LSM6DSOXI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSOX_CS")]
            [#assign LSM6DSOX_CS_PORT = IpName]
            [#assign LSM6DSOX_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LPS33HW BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LPS33HWSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LPS33HWI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LPS33HW_CS")]
            [#assign LPS33HW_CS_PORT = IpName]
            [#assign LPS33HW_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LIS2DH12 BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LIS2DH12SpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LIS2DH12I2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LIS2DH12_CS")]
            [#assign LIS2DH12_CS_PORT = IpName]
            [#assign LIS2DH12_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("ASM330LHH BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign ASM330LHHSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign ASM330LHHI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("ASM330LHH_CS")]
            [#assign ASM330LHH_CS_PORT = IpName]
            [#assign ASM330LHH_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("ISM330DLC BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign ISM330DLCSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign ISM330DLCI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("ISM330DLC_CS")]
            [#assign ISM330DLC_CS_PORT = IpName]
            [#assign ISM330DLC_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("ISM303DAC BUS IO driver")]
            [#if IpInstance?contains("I2C")]
              [#assign ISM303DACI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("IIS2DLPC BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign IIS2DLPCSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign IIS2DLPCI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("IIS2DLPC_CS")]
            [#assign IIS2DLPC_CS_PORT = IpName]
            [#assign IIS2DLPC_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("IIS2MDC BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign IIS2MDCSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign IIS2MDCI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("IIS2MDC_CS")]
            [#assign IIS2MDC_CS_PORT = IpName]
            [#assign IIS2MDC_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("ISM330DHCX BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign ISM330DHCXSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign ISM330DHCXI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("ISM330DHCX_CS")]
            [#assign ISM330DHCX_CS_PORT = IpName]
            [#assign ISM330DHCX_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LSM6DSR BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LSM6DSRSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LSM6DSRI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSR_CS")]
            [#assign LSM6DSR_CS_PORT = IpName]
            [#assign LSM6DSR_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("AIS2DW12 BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign AIS2DW12SpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign AIS2DW12I2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("AIS2DW12_CS")]
            [#assign AIS2DW12_CS_PORT = IpName]
            [#assign AIS2DW12_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("STTS22H BUS IO driver")]
            [#if IpInstance?contains("I2C")]
              [#assign STTS22HI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("A3G4250D BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign A3G4250DSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign A3G4250DI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("A3G4250D_CS")]
            [#assign A3G4250D_CS_PORT = IpName]
            [#assign A3G4250D_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("AIS328DQ BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign AIS328DQSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign AIS328DQI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("AIS328DQ_CS")]
            [#assign AIS328DQ_CS_PORT = IpName]
            [#assign AIS328DQ_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("AIS3624DQ BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign AIS3624DQSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign AIS3624DQI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("AIS3624DQ_CS")]
            [#assign AIS3624DQ_CS_PORT = IpName]
            [#assign AIS3624DQ_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("H3LIS331DL BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign H3LIS331DLSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign H3LIS331DLI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("H3LIS331DL_CS")]
            [#assign H3LIS331DL_CS_PORT = IpName]
            [#assign H3LIS331DL_CS_PIN = IpInstance]
          [/#if]
          [#if variables.value?contains("LSM6DSRX BUS IO driver")]
            [#if IpInstance?contains("SPI")]
              [#assign LSM6DSRXSpiInstance = IpInstance]
            [/#if]
            [#if IpInstance?contains("I2C")]
              [#assign LSM6DSRXI2CInstance = IpInstance]
            [/#if]
          [/#if]
          [#if variables.value?contains("LSM6DSRX_CS")]
            [#assign LSM6DSRX_CS_PORT = IpName]
            [#assign LSM6DSRX_CS_PIN = IpInstance]
          [/#if]
        [/#list]
      [/#if]
    [/#if]
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
[#assign useHTS221I2C = false]
[#assign useLPS22HBI2C = false]
[#assign useLPS22HBSPI = false]
[#assign useLPS22HHI2C = false]
[#assign useLPS22HHSPI = false]
[#assign useSTTS751I2C = false]
[#assign useLSM6DSOXI2C = false]
[#assign useLSM6DSOXSPI = false]
[#assign useLPS33HWI2C = false]
[#assign useLPS33HWSPI = false]
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
[#assign useSTTS22HI2C = false]
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

[#if define?contains("HTS221_HUMTEMP_I2C")]
[#assign useHTS221I2C = true]
[/#if]

[#if define?contains("LPS22HB_PRESSTEMP_I2C")]
[#assign useLPS22HBI2C = true]
[/#if]

[#if define?contains("LPS22HB_PRESSTEMP_SPI")]
[#assign useLPS22HBSPI = true]
[/#if]

[#if define?contains("LPS22HH_PRESSTEMP_I2C")]
[#assign useLPS22HHI2C = true]
[/#if]

[#if define?contains("LPS22HH_PRESSTEMP_SPI")]
[#assign useLPS22HHSPI = true]
[/#if]

[#if define?contains("STTS751_TEMP_I2C")]
[#assign useSTTS751I2C = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR_I2C")]
[#assign useLSM6DSOXI2C = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR_SPI")]
[#assign useLSM6DSOXSPI = true]
[/#if]

[#if define?contains("LPS33HW_PRESSTEMP_I2C")]
[#assign useLPS33HWI2C = true]
[/#if]

[#if define?contains("LPS33HW_PRESSTEMP_SPI")]
[#assign useLPS33HWSPI = true]
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

[#if define?contains("STTS22H_TEMP_I2C")]
[#assign useSTTS22HI2C = true]
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CUSTOM_MEMS_CONF_H__
#define __CUSTOM_MEMS_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}_bus.h"
#include "${BoardName}_errno.h"

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

[#if useLSM6DSLI2C || useLSM6DSLSPI]
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSL_0        1U
[/#if]

[#if useLSM303AGRI2C]
#define USE_CUSTOM_MOTION_SENSOR_LSM303AGR_ACC_0  1U
#define USE_CUSTOM_MOTION_SENSOR_LSM303AGR_MAG_0  1U
[/#if]

[#if useLIS3MDLI2C || useLIS3MDLSPI]
#define USE_CUSTOM_MOTION_SENSOR_LIS3MDL_0        1U
[/#if]

[#if useLSM6DSOI2C || useLSM6DSOSPI]
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSO_0        1U
[/#if]

[#if useLIS2DW12I2C || useLIS2DW12SPI]
#define USE_CUSTOM_MOTION_SENSOR_LIS2DW12_0       1U
[/#if]

[#if useLIS2MDLI2C || useLIS2MDLSPI]
#define USE_CUSTOM_MOTION_SENSOR_LIS2MDL_0        1U
[/#if]

[#if useHTS221I2C]
#define USE_CUSTOM_ENV_SENSOR_HTS221_0            1U
[/#if]

[#if useLPS22HBI2C || useLPS22HBSPI]
#define USE_CUSTOM_ENV_SENSOR_LPS22HB_0           1U
[/#if]

[#if useLPS22HHI2C || useLPS22HHSPI]
#define USE_CUSTOM_ENV_SENSOR_LPS22HH_0           1U
[/#if]

[#if useSTTS751I2C]
#define USE_CUSTOM_ENV_SENSOR_STTS751_0           1U
[/#if]

[#if useLSM6DSOXI2C || useLSM6DSOXSPI]
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSOX_0       1U
[/#if]

[#if useLPS33HWI2C || useLPS33HWSPI]
#define USE_CUSTOM_ENV_SENSOR_LPS33HW_0           1U
[/#if]

[#if useLIS2DH12I2C || useLIS2DH12SPI]
#define USE_CUSTOM_MOTION_SENSOR_LIS2DH12_0       1U
[/#if]

[#if useASM330LHHI2C || useASM330LHHSPI]
#define USE_CUSTOM_MOTION_SENSOR_ASM330LHH_0      1U
[/#if]

[#if useISM330DLCI2C || useISM330DLCSPI]
#define USE_CUSTOM_MOTION_SENSOR_ISM330DLC_0      1U
[/#if]

[#if useISM303DACI2C]
#define USE_CUSTOM_MOTION_SENSOR_ISM303DAC_ACC_0  1U
#define USE_CUSTOM_MOTION_SENSOR_ISM303DAC_MAG_0  1U
[/#if]

[#if useIIS2DLPCI2C || useIIS2DLPCSPI]
#define USE_CUSTOM_MOTION_SENSOR_IIS2DLPC_0       1U
[/#if]

[#if useIIS2MDCI2C || useIIS2MDCSPI]
#define USE_CUSTOM_MOTION_SENSOR_IIS2MDC_0        1U
[/#if]

[#if useISM330DHCXI2C || useISM330DHCXSPI]
#define USE_CUSTOM_MOTION_SENSOR_ISM330DHCX_0     1U
[/#if]

[#if useLSM6DSRI2C || useLSM6DSRSPI]
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSR_0        1U
[/#if]

[#if useAIS2DW12I2C || useAIS2DW12SPI]
#define USE_CUSTOM_MOTION_SENSOR_AIS2DW12_0       1U
[/#if]

[#if useSTTS22HI2C]
#define USE_CUSTOM_ENV_SENSOR_STTS22H_0           1U
[/#if]

[#if useA3G4250DI2C || useA3G4250DSPI]
#define USE_CUSTOM_MOTION_SENSOR_A3G4250D_0        1U
[/#if]

[#if useAIS328DQI2C || useAIS328DQSPI]
#define USE_CUSTOM_MOTION_SENSOR_AIS328DQ_0        1U
[/#if]

[#if useAIS3624DQI2C || useAIS3624DQSPI]
#define USE_CUSTOM_MOTION_SENSOR_AIS3624DQ_0        1U
[/#if]

[#if useH3LIS331DLI2C || useH3LIS331DLSPI]
#define USE_CUSTOM_MOTION_SENSOR_H3LIS331DL_0        1U
[/#if]

[#if useLSM6DSRXI2C || useLSM6DSRXSPI]
#define USE_CUSTOM_MOTION_SENSOR_LSM6DSRX_0        1U
[/#if]

[#if LSM6DSLSpiInstance != ""]
#define CUSTOM_LSM6DSL_0_SPI_Init BSP_${LSM6DSLSpiInstance}_Init
#define CUSTOM_LSM6DSL_0_SPI_DeInit BSP_${LSM6DSLSpiInstance}_DeInit
#define CUSTOM_LSM6DSL_0_SPI_Send BSP_${LSM6DSLSpiInstance}_Send
#define CUSTOM_LSM6DSL_0_SPI_Recv BSP_${LSM6DSLSpiInstance}_Recv
[/#if]

[#if LSM6DSL_CS_PORT != ""]
#define CUSTOM_LSM6DSL_0_CS_PORT ${LSM6DSL_CS_PORT}
[/#if]
[#if LSM6DSL_CS_PIN != ""]
#define CUSTOM_LSM6DSL_0_CS_PIN ${LSM6DSL_CS_PIN}
[/#if]

[#if LSM6DSLI2CInstance != ""]
#define CUSTOM_LSM6DSL_0_I2C_Init BSP_${LSM6DSLI2CInstance}_Init
#define CUSTOM_LSM6DSL_0_I2C_DeInit BSP_${LSM6DSLI2CInstance}_DeInit
#define CUSTOM_LSM6DSL_0_I2C_ReadReg BSP_${LSM6DSLI2CInstance}_ReadReg
#define CUSTOM_LSM6DSL_0_I2C_WriteReg BSP_${LSM6DSLI2CInstance}_WriteReg
[/#if]

[#if LSM303AGRI2CInstance != ""]
#define CUSTOM_LSM303AGR_0_I2C_Init BSP_${LSM303AGRI2CInstance}_Init
#define CUSTOM_LSM303AGR_0_I2C_DeInit BSP_${LSM303AGRI2CInstance}_DeInit
#define CUSTOM_LSM303AGR_0_I2C_ReadReg BSP_${LSM303AGRI2CInstance}_ReadReg
#define CUSTOM_LSM303AGR_0_I2C_WriteReg BSP_${LSM303AGRI2CInstance}_WriteReg
[/#if]

[#if LIS3MDLSpiInstance != ""]
#define CUSTOM_LIS3MDL_0_SPI_Init BSP_${LIS3MDLSpiInstance}_Init
#define CUSTOM_LIS3MDL_0_SPI_DeInit BSP_${LIS3MDLSpiInstance}_DeInit
#define CUSTOM_LIS3MDL_0_SPI_Send BSP_${LIS3MDLSpiInstance}_Send
#define CUSTOM_LIS3MDL_0_SPI_Recv BSP_${LIS3MDLSpiInstance}_Recv
[/#if]

[#if LIS3MDL_CS_PORT != ""]
#define CUSTOM_LIS3MDL_0_CS_PORT ${LIS3MDL_CS_PORT}
[/#if]
[#if LIS3MDL_CS_PIN != ""]
#define CUSTOM_LIS3MDL_0_CS_PIN ${LIS3MDL_CS_PIN}
[/#if]

[#if LIS3MDLI2CInstance != ""]
#define CUSTOM_LIS3MDL_0_I2C_Init BSP_${LIS3MDLI2CInstance}_Init
#define CUSTOM_LIS3MDL_0_I2C_DeInit BSP_${LIS3MDLI2CInstance}_DeInit
#define CUSTOM_LIS3MDL_0_I2C_ReadReg BSP_${LIS3MDLI2CInstance}_ReadReg
#define CUSTOM_LIS3MDL_0_I2C_WriteReg BSP_${LIS3MDLI2CInstance}_WriteReg
[/#if]

[#if LSM6DSOSpiInstance != ""]
#define CUSTOM_LSM6DSO_0_SPI_Init BSP_${LSM6DSOSpiInstance}_Init
#define CUSTOM_LSM6DSO_0_SPI_DeInit BSP_${LSM6DSOSpiInstance}_DeInit
#define CUSTOM_LSM6DSO_0_SPI_Send BSP_${LSM6DSOSpiInstance}_Send
#define CUSTOM_LSM6DSO_0_SPI_Recv BSP_${LSM6DSOSpiInstance}_Recv
[/#if]

[#if LSM6DSO_CS_PORT != ""]
#define CUSTOM_LSM6DSO_0_CS_PORT ${LSM6DSO_CS_PORT}
[/#if]
[#if LSM6DSO_CS_PIN != ""]
#define CUSTOM_LSM6DSO_0_CS_PIN ${LSM6DSO_CS_PIN}
[/#if]

[#if LSM6DSOI2CInstance != ""]
#define CUSTOM_LSM6DSO_0_I2C_Init BSP_${LSM6DSOI2CInstance}_Init
#define CUSTOM_LSM6DSO_0_I2C_DeInit BSP_${LSM6DSOI2CInstance}_DeInit
#define CUSTOM_LSM6DSO_0_I2C_ReadReg BSP_${LSM6DSOI2CInstance}_ReadReg
#define CUSTOM_LSM6DSO_0_I2C_WriteReg BSP_${LSM6DSOI2CInstance}_WriteReg
[/#if]

[#if LIS2DW12SpiInstance != ""]
#define CUSTOM_LIS2DW12_0_SPI_Init BSP_${LIS2DW12SpiInstance}_Init
#define CUSTOM_LIS2DW12_0_SPI_DeInit BSP_${LIS2DW12SpiInstance}_DeInit
#define CUSTOM_LIS2DW12_0_SPI_Send BSP_${LIS2DW12SpiInstance}_Send
#define CUSTOM_LIS2DW12_0_SPI_Recv BSP_${LIS2DW12SpiInstance}_Recv
[/#if]

[#if LIS2DW12_CS_PORT != ""]
#define CUSTOM_LIS2DW12_0_CS_PORT ${LIS2DW12_CS_PORT}
[/#if]
[#if LIS2DW12_CS_PIN != ""]
#define CUSTOM_LIS2DW12_0_CS_PIN ${LIS2DW12_CS_PIN}
[/#if]

[#if LIS2DW12I2CInstance != ""]
#define CUSTOM_LIS2DW12_0_I2C_Init BSP_${LIS2DW12I2CInstance}_Init
#define CUSTOM_LIS2DW12_0_I2C_DeInit BSP_${LIS2DW12I2CInstance}_DeInit
#define CUSTOM_LIS2DW12_0_I2C_ReadReg BSP_${LIS2DW12I2CInstance}_ReadReg
#define CUSTOM_LIS2DW12_0_I2C_WriteReg BSP_${LIS2DW12I2CInstance}_WriteReg
[/#if]

[#if LIS2MDLSpiInstance != ""]
#define CUSTOM_LIS2MDL_0_SPI_Init BSP_${LIS2MDLSpiInstance}_Init
#define CUSTOM_LIS2MDL_0_SPI_DeInit BSP_${LIS2MDLSpiInstance}_DeInit
#define CUSTOM_LIS2MDL_0_SPI_Send BSP_${LIS2MDLSpiInstance}_Send
#define CUSTOM_LIS2MDL_0_SPI_Recv BSP_${LIS2MDLSpiInstance}_Recv
[/#if]

[#if LIS2MDL_CS_PORT != ""]
#define CUSTOM_LIS2MDL_0_CS_PORT ${LIS2MDL_CS_PORT}
[/#if]
[#if LIS2MDL_CS_PIN != ""]
#define CUSTOM_LIS2MDL_0_CS_PIN ${LIS2MDL_CS_PIN}
[/#if]

[#if LIS2MDLI2CInstance != ""]
#define CUSTOM_LIS2MDL_0_I2C_Init BSP_${LIS2MDLI2CInstance}_Init
#define CUSTOM_LIS2MDL_0_I2C_DeInit BSP_${LIS2MDLI2CInstance}_DeInit
#define CUSTOM_LIS2MDL_0_I2C_ReadReg BSP_${LIS2MDLI2CInstance}_ReadReg
#define CUSTOM_LIS2MDL_0_I2C_WriteReg BSP_${LIS2MDLI2CInstance}_WriteReg
[/#if]

[#if HTS221I2CInstance != ""]
#define CUSTOM_HTS221_0_I2C_Init BSP_${HTS221I2CInstance}_Init
#define CUSTOM_HTS221_0_I2C_DeInit BSP_${HTS221I2CInstance}_DeInit
#define CUSTOM_HTS221_0_I2C_ReadReg BSP_${HTS221I2CInstance}_ReadReg
#define CUSTOM_HTS221_0_I2C_WriteReg BSP_${HTS221I2CInstance}_WriteReg
[/#if]

[#if LPS22HBSpiInstance != ""]
#define CUSTOM_LPS22HB_0_SPI_Init BSP_${LPS22HBSpiInstance}_Init
#define CUSTOM_LPS22HB_0_SPI_DeInit BSP_${LPS22HBSpiInstance}_DeInit
#define CUSTOM_LPS22HB_0_SPI_Send BSP_${LPS22HBSpiInstance}_Send
#define CUSTOM_LPS22HB_0_SPI_Recv BSP_${LPS22HBSpiInstance}_Recv
[/#if]

[#if LPS22HB_CS_PORT != ""]
#define CUSTOM_LPS22HB_0_CS_PORT ${LPS22HB_CS_PORT}
[/#if]
[#if LPS22HB_CS_PIN != ""]
#define CUSTOM_LPS22HB_0_CS_PIN ${LPS22HB_CS_PIN}
[/#if]

[#if LPS22HBI2CInstance != ""]
#define CUSTOM_LPS22HB_0_I2C_Init BSP_${LPS22HBI2CInstance}_Init
#define CUSTOM_LPS22HB_0_I2C_DeInit BSP_${LPS22HBI2CInstance}_DeInit
#define CUSTOM_LPS22HB_0_I2C_ReadReg BSP_${LPS22HBI2CInstance}_ReadReg
#define CUSTOM_LPS22HB_0_I2C_WriteReg BSP_${LPS22HBI2CInstance}_WriteReg
[/#if]

[#if LPS22HHSpiInstance != ""]
#define CUSTOM_LPS22HH_0_SPI_Init BSP_${LPS22HHSpiInstance}_Init
#define CUSTOM_LPS22HH_0_SPI_DeInit BSP_${LPS22HHSpiInstance}_DeInit
#define CUSTOM_LPS22HH_0_SPI_Send BSP_${LPS22HHSpiInstance}_Send
#define CUSTOM_LPS22HH_0_SPI_Recv BSP_${LPS22HHSpiInstance}_Recv
[/#if]

[#if LPS22HH_CS_PORT != ""]
#define CUSTOM_LPS22HH_0_CS_PORT ${LPS22HH_CS_PORT}
[/#if]
[#if LPS22HH_CS_PIN != ""]
#define CUSTOM_LPS22HH_0_CS_PIN ${LPS22HH_CS_PIN}
[/#if]

[#if LPS22HHI2CInstance != ""]
#define CUSTOM_LPS22HH_0_I2C_Init BSP_${LPS22HHI2CInstance}_Init
#define CUSTOM_LPS22HH_0_I2C_DeInit BSP_${LPS22HHI2CInstance}_DeInit
#define CUSTOM_LPS22HH_0_I2C_ReadReg BSP_${LPS22HHI2CInstance}_ReadReg
#define CUSTOM_LPS22HH_0_I2C_WriteReg BSP_${LPS22HHI2CInstance}_WriteReg
[/#if]

[#if STTS751I2CInstance != ""]
#define CUSTOM_STTS751_0_I2C_Init BSP_${STTS751I2CInstance}_Init
#define CUSTOM_STTS751_0_I2C_DeInit BSP_${STTS751I2CInstance}_DeInit
#define CUSTOM_STTS751_0_I2C_ReadReg BSP_${STTS751I2CInstance}_ReadReg
#define CUSTOM_STTS751_0_I2C_WriteReg BSP_${STTS751I2CInstance}_WriteReg
[/#if]

[#if LSM6DSOXSpiInstance != ""]
#define CUSTOM_LSM6DSOX_0_SPI_Init BSP_${LSM6DSOXSpiInstance}_Init
#define CUSTOM_LSM6DSOX_0_SPI_DeInit BSP_${LSM6DSOXSpiInstance}_DeInit
#define CUSTOM_LSM6DSOX_0_SPI_Send BSP_${LSM6DSOXSpiInstance}_Send
#define CUSTOM_LSM6DSOX_0_SPI_Recv BSP_${LSM6DSOXSpiInstance}_Recv
[/#if]

[#if LSM6DSOX_CS_PORT != ""]
#define CUSTOM_LSM6DSOX_0_CS_PORT ${LSM6DSOX_CS_PORT}
[/#if]
[#if LSM6DSOX_CS_PIN != ""]
#define CUSTOM_LSM6DSOX_0_CS_PIN ${LSM6DSOX_CS_PIN}
[/#if]

[#if LSM6DSOXI2CInstance != ""]
#define CUSTOM_LSM6DSOX_0_I2C_Init BSP_${LSM6DSOXI2CInstance}_Init
#define CUSTOM_LSM6DSOX_0_I2C_DeInit BSP_${LSM6DSOXI2CInstance}_DeInit
#define CUSTOM_LSM6DSOX_0_I2C_ReadReg BSP_${LSM6DSOXI2CInstance}_ReadReg
#define CUSTOM_LSM6DSOX_0_I2C_WriteReg BSP_${LSM6DSOXI2CInstance}_WriteReg
[/#if]

[#if LPS33HWSpiInstance != ""]
#define CUSTOM_LPS33HW_0_SPI_Init BSP_${LPS33HWSpiInstance}_Init
#define CUSTOM_LPS33HW_0_SPI_DeInit BSP_${LPS33HWSpiInstance}_DeInit
#define CUSTOM_LPS33HW_0_SPI_Send BSP_${LPS33HWSpiInstance}_Send
#define CUSTOM_LPS33HW_0_SPI_Recv BSP_${LPS33HWSpiInstance}_Recv
[/#if]

[#if LPS33HW_CS_PORT != ""]
#define CUSTOM_LPS33HW_0_CS_PORT ${LPS33HW_CS_PORT}
[/#if]
[#if LPS33HW_CS_PIN != ""]
#define CUSTOM_LPS33HW_0_CS_PIN ${LPS33HW_CS_PIN}
[/#if]

[#if LPS33HWI2CInstance != ""]
#define CUSTOM_LPS33HW_0_I2C_Init BSP_${LPS33HWI2CInstance}_Init
#define CUSTOM_LPS33HW_0_I2C_DeInit BSP_${LPS33HWI2CInstance}_DeInit
#define CUSTOM_LPS33HW_0_I2C_ReadReg BSP_${LPS33HWI2CInstance}_ReadReg
#define CUSTOM_LPS33HW_0_I2C_WriteReg BSP_${LPS33HWI2CInstance}_WriteReg
[/#if]

[#if LIS2DH12SpiInstance != ""]
#define CUSTOM_LIS2DH12_0_SPI_Init BSP_${LIS2DH12SpiInstance}_Init
#define CUSTOM_LIS2DH12_0_SPI_DeInit BSP_${LIS2DH12SpiInstance}_DeInit
#define CUSTOM_LIS2DH12_0_SPI_Send BSP_${LIS2DH12SpiInstance}_Send
#define CUSTOM_LIS2DH12_0_SPI_Recv BSP_${LIS2DH12SpiInstance}_Recv
[/#if]

[#if LIS2DH12_CS_PORT != ""]
#define CUSTOM_LIS2DH12_0_CS_PORT ${LIS2DH12_CS_PORT}
[/#if]
[#if LIS2DH12_CS_PIN != ""]
#define CUSTOM_LIS2DH12_0_CS_PIN ${LIS2DH12_CS_PIN}
[/#if]

[#if LIS2DH12I2CInstance != ""]
#define CUSTOM_LIS2DH12_0_I2C_Init BSP_${LIS2DH12I2CInstance}_Init
#define CUSTOM_LIS2DH12_0_I2C_DeInit BSP_${LIS2DH12I2CInstance}_DeInit
#define CUSTOM_LIS2DH12_0_I2C_ReadReg BSP_${LIS2DH12I2CInstance}_ReadReg
#define CUSTOM_LIS2DH12_0_I2C_WriteReg BSP_${LIS2DH12I2CInstance}_WriteReg
[/#if]

[#if ASM330LHHSpiInstance != ""]
#define CUSTOM_ASM330LHH_0_SPI_Init BSP_${ASM330LHHSpiInstance}_Init
#define CUSTOM_ASM330LHH_0_SPI_DeInit BSP_${ASM330LHHSpiInstance}_DeInit
#define CUSTOM_ASM330LHH_0_SPI_Send BSP_${ASM330LHHSpiInstance}_Send
#define CUSTOM_ASM330LHH_0_SPI_Recv BSP_${ASM330LHHSpiInstance}_Recv
[/#if]

[#if ASM330LHH_CS_PORT != ""]
#define CUSTOM_ASM330LHH_0_CS_PORT ${ASM330LHH_CS_PORT}
[/#if]
[#if ASM330LHH_CS_PIN != ""]
#define CUSTOM_ASM330LHH_0_CS_PIN ${ASM330LHH_CS_PIN}
[/#if]

[#if ASM330LHHI2CInstance != ""]
#define CUSTOM_ASM330LHH_0_I2C_Init BSP_${ASM330LHHI2CInstance}_Init
#define CUSTOM_ASM330LHH_0_I2C_DeInit BSP_${ASM330LHHI2CInstance}_DeInit
#define CUSTOM_ASM330LHH_0_I2C_ReadReg BSP_${ASM330LHHI2CInstance}_ReadReg
#define CUSTOM_ASM330LHH_0_I2C_WriteReg BSP_${ASM330LHHI2CInstance}_WriteReg
[/#if]

[#if ISM330DLCSpiInstance != ""]
#define CUSTOM_ISM330DLC_0_SPI_Init BSP_${ISM330DLCSpiInstance}_Init
#define CUSTOM_ISM330DLC_0_SPI_DeInit BSP_${ISM330DLCSpiInstance}_DeInit
#define CUSTOM_ISM330DLC_0_SPI_Send BSP_${ISM330DLCSpiInstance}_Send
#define CUSTOM_ISM330DLC_0_SPI_Recv BSP_${ISM330DLCSpiInstance}_Recv
[/#if]

[#if ISM330DLC_CS_PORT != ""]
#define CUSTOM_ISM330DLC_0_CS_PORT ${ISM330DLC_CS_PORT}
[/#if]
[#if ISM330DLC_CS_PIN != ""]
#define CUSTOM_ISM330DLC_0_CS_PIN ${ISM330DLC_CS_PIN}
[/#if]

[#if ISM330DLCI2CInstance != ""]
#define CUSTOM_ISM330DLC_0_I2C_Init BSP_${ISM330DLCI2CInstance}_Init
#define CUSTOM_ISM330DLC_0_I2C_DeInit BSP_${ISM330DLCI2CInstance}_DeInit
#define CUSTOM_ISM330DLC_0_I2C_ReadReg BSP_${ISM330DLCI2CInstance}_ReadReg
#define CUSTOM_ISM330DLC_0_I2C_WriteReg BSP_${ISM330DLCI2CInstance}_WriteReg
[/#if]

[#if ISM303DACI2CInstance != ""]
#define CUSTOM_ISM303DAC_0_I2C_Init BSP_${ISM303DACI2CInstance}_Init
#define CUSTOM_ISM303DAC_0_I2C_DeInit BSP_${ISM303DACI2CInstance}_DeInit
#define CUSTOM_ISM303DAC_0_I2C_ReadReg BSP_${ISM303DACI2CInstance}_ReadReg
#define CUSTOM_ISM303DAC_0_I2C_WriteReg BSP_${ISM303DACI2CInstance}_WriteReg
[/#if]

[#if IIS2DLPCSpiInstance != ""]
#define CUSTOM_IIS2DLPC_0_SPI_Init BSP_${IIS2DLPCSpiInstance}_Init
#define CUSTOM_IIS2DLPC_0_SPI_DeInit BSP_${IIS2DLPCSpiInstance}_DeInit
#define CUSTOM_IIS2DLPC_0_SPI_Send BSP_${IIS2DLPCSpiInstance}_Send
#define CUSTOM_IIS2DLPC_0_SPI_Recv BSP_${IIS2DLPCSpiInstance}_Recv
[/#if]

[#if IIS2DLPC_CS_PORT != ""]
#define CUSTOM_IIS2DLPC_0_CS_PORT ${IIS2DLPC_CS_PORT}
[/#if]
[#if IIS2DLPC_CS_PIN != ""]
#define CUSTOM_IIS2DLPC_0_CS_PIN ${IIS2DLPC_CS_PIN}
[/#if]

[#if IIS2DLPCI2CInstance != ""]
#define CUSTOM_IIS2DLPC_0_I2C_Init BSP_${IIS2DLPCI2CInstance}_Init
#define CUSTOM_IIS2DLPC_0_I2C_DeInit BSP_${IIS2DLPCI2CInstance}_DeInit
#define CUSTOM_IIS2DLPC_0_I2C_ReadReg BSP_${IIS2DLPCI2CInstance}_ReadReg
#define CUSTOM_IIS2DLPC_0_I2C_WriteReg BSP_${IIS2DLPCI2CInstance}_WriteReg
[/#if]

[#if IIS2MDCSpiInstance != ""]
#define CUSTOM_IIS2MDC_0_SPI_Init BSP_${IIS2MDCSpiInstance}_Init
#define CUSTOM_IIS2MDC_0_SPI_DeInit BSP_${IIS2MDCSpiInstance}_DeInit
#define CUSTOM_IIS2MDC_0_SPI_Send BSP_${IIS2MDCSpiInstance}_Send
#define CUSTOM_IIS2MDC_0_SPI_Recv BSP_${IIS2MDCSpiInstance}_Recv
[/#if]

[#if IIS2MDC_CS_PORT != ""]
#define CUSTOM_IIS2MDC_0_CS_PORT ${IIS2MDC_CS_PORT}
[/#if]
[#if IIS2MDC_CS_PIN != ""]
#define CUSTOM_IIS2MDC_0_CS_PIN ${IIS2MDC_CS_PIN}
[/#if]

[#if IIS2MDCI2CInstance != ""]
#define CUSTOM_IIS2MDC_0_I2C_Init BSP_${IIS2MDCI2CInstance}_Init
#define CUSTOM_IIS2MDC_0_I2C_DeInit BSP_${IIS2MDCI2CInstance}_DeInit
#define CUSTOM_IIS2MDC_0_I2C_ReadReg BSP_${IIS2MDCI2CInstance}_ReadReg
#define CUSTOM_IIS2MDC_0_I2C_WriteReg BSP_${IIS2MDCI2CInstance}_WriteReg
[/#if]

[#if ISM330DHCXSpiInstance != ""]
#define CUSTOM_ISM330DHCX_0_SPI_Init BSP_${ISM330DHCXSpiInstance}_Init
#define CUSTOM_ISM330DHCX_0_SPI_DeInit BSP_${ISM330DHCXSpiInstance}_DeInit
#define CUSTOM_ISM330DHCX_0_SPI_Send BSP_${ISM330DHCXSpiInstance}_Send
#define CUSTOM_ISM330DHCX_0_SPI_Recv BSP_${ISM330DHCXSpiInstance}_Recv
[/#if]

[#if ISM330DHCX_CS_PORT != ""]
#define CUSTOM_ISM330DHCX_0_CS_PORT ${ISM330DHCX_CS_PORT}
[/#if]
[#if ISM330DHCX_CS_PIN != ""]
#define CUSTOM_ISM330DHCX_0_CS_PIN ${ISM330DHCX_CS_PIN}
[/#if]

[#if ISM330DHCXI2CInstance != ""]
#define CUSTOM_ISM330DHCX_0_I2C_Init BSP_${ISM330DHCXI2CInstance}_Init
#define CUSTOM_ISM330DHCX_0_I2C_DeInit BSP_${ISM330DHCXI2CInstance}_DeInit
#define CUSTOM_ISM330DHCX_0_I2C_ReadReg BSP_${ISM330DHCXI2CInstance}_ReadReg
#define CUSTOM_ISM330DHCX_0_I2C_WriteReg BSP_${ISM330DHCXI2CInstance}_WriteReg
[/#if]

[#if LSM6DSRSpiInstance != ""]
#define CUSTOM_LSM6DSR_0_SPI_Init BSP_${LSM6DSRSpiInstance}_Init
#define CUSTOM_LSM6DSR_0_SPI_DeInit BSP_${LSM6DSRSpiInstance}_DeInit
#define CUSTOM_LSM6DSR_0_SPI_Send BSP_${LSM6DSRSpiInstance}_Send
#define CUSTOM_LSM6DSR_0_SPI_Recv BSP_${LSM6DSRSpiInstance}_Recv
[/#if]

[#if LSM6DSR_CS_PORT != ""]
#define CUSTOM_LSM6DSR_0_CS_PORT ${LSM6DSR_CS_PORT}
[/#if]
[#if LSM6DSR_CS_PIN != ""]
#define CUSTOM_LSM6DSR_0_CS_PIN ${LSM6DSR_CS_PIN}
[/#if]

[#if LSM6DSRI2CInstance != ""]
#define CUSTOM_LSM6DSR_0_I2C_Init BSP_${LSM6DSRI2CInstance}_Init
#define CUSTOM_LSM6DSR_0_I2C_DeInit BSP_${LSM6DSRI2CInstance}_DeInit
#define CUSTOM_LSM6DSR_0_I2C_ReadReg BSP_${LSM6DSRI2CInstance}_ReadReg
#define CUSTOM_LSM6DSR_0_I2C_WriteReg BSP_${LSM6DSRI2CInstance}_WriteReg
[/#if]

[#if AIS2DW12SpiInstance != ""]
#define CUSTOM_AIS2DW12_0_SPI_Init BSP_${AIS2DW12SpiInstance}_Init
#define CUSTOM_AIS2DW12_0_SPI_DeInit BSP_${AIS2DW12SpiInstance}_DeInit
#define CUSTOM_AIS2DW12_0_SPI_Send BSP_${AIS2DW12SpiInstance}_Send
#define CUSTOM_AIS2DW12_0_SPI_Recv BSP_${AIS2DW12SpiInstance}_Recv
[/#if]

[#if AIS2DW12_CS_PORT != ""]
#define CUSTOM_AIS2DW12_0_CS_PORT ${AIS2DW12_CS_PORT}
[/#if]
[#if AIS2DW12_CS_PIN != ""]
#define CUSTOM_AIS2DW12_0_CS_PIN ${AIS2DW12_CS_PIN}
[/#if]

[#if AIS2DW12I2CInstance != ""]
#define CUSTOM_AIS2DW12_0_I2C_Init BSP_${AIS2DW12I2CInstance}_Init
#define CUSTOM_AIS2DW12_0_I2C_DeInit BSP_${AIS2DW12I2CInstance}_DeInit
#define CUSTOM_AIS2DW12_0_I2C_ReadReg BSP_${AIS2DW12I2CInstance}_ReadReg
#define CUSTOM_AIS2DW12_0_I2C_WriteReg BSP_${AIS2DW12I2CInstance}_WriteReg
[/#if]

[#if STTS22HI2CInstance != ""]
#define CUSTOM_STTS22H_0_I2C_Init BSP_${STTS22HI2CInstance}_Init
#define CUSTOM_STTS22H_0_I2C_DeInit BSP_${STTS22HI2CInstance}_DeInit
#define CUSTOM_STTS22H_0_I2C_ReadReg BSP_${STTS22HI2CInstance}_ReadReg
#define CUSTOM_STTS22H_0_I2C_WriteReg BSP_${STTS22HI2CInstance}_WriteReg
[/#if]

[#if A3G4250DSpiInstance != ""]
#define CUSTOM_A3G4250D_0_SPI_Init BSP_${A3G4250DSpiInstance}_Init
#define CUSTOM_A3G4250D_0_SPI_DeInit BSP_${A3G4250DSpiInstance}_DeInit
#define CUSTOM_A3G4250D_0_SPI_Send BSP_${A3G4250DSpiInstance}_Send
#define CUSTOM_A3G4250D_0_SPI_Recv BSP_${A3G4250DSpiInstance}_Recv
[/#if]

[#if A3G4250D_CS_PORT != ""]
#define CUSTOM_A3G4250D_0_CS_PORT ${A3G4250D_CS_PORT}
[/#if]
[#if A3G4250D_CS_PIN != ""]
#define CUSTOM_A3G4250D_0_CS_PIN ${A3G4250D_CS_PIN}
[/#if]

[#if A3G4250DI2CInstance != ""]
#define CUSTOM_A3G4250D_0_I2C_Init BSP_${A3G4250DI2CInstance}_Init
#define CUSTOM_A3G4250D_0_I2C_DeInit BSP_${A3G4250DI2CInstance}_DeInit
#define CUSTOM_A3G4250D_0_I2C_ReadReg BSP_${A3G4250DI2CInstance}_ReadReg
#define CUSTOM_A3G4250D_0_I2C_WriteReg BSP_${A3G4250DI2CInstance}_WriteReg
[/#if]

[#if AIS328DQSpiInstance != ""]
#define CUSTOM_AIS328DQ_0_SPI_Init BSP_${AIS328DQSpiInstance}_Init
#define CUSTOM_AIS328DQ_0_SPI_DeInit BSP_${AIS328DQSpiInstance}_DeInit
#define CUSTOM_AIS328DQ_0_SPI_Send BSP_${AIS328DQSpiInstance}_Send
#define CUSTOM_AIS328DQ_0_SPI_Recv BSP_${AIS328DQSpiInstance}_Recv
[/#if]

[#if AIS328DQ_CS_PORT != ""]
#define CUSTOM_AIS328DQ_0_CS_PORT ${AIS328DQ_CS_PORT}
[/#if]
[#if AIS328DQ_CS_PIN != ""]
#define CUSTOM_AIS328DQ_0_CS_PIN ${AIS328DQ_CS_PIN}
[/#if]

[#if AIS328DQI2CInstance != ""]
#define CUSTOM_AIS328DQ_0_I2C_Init BSP_${AIS328DQI2CInstance}_Init
#define CUSTOM_AIS328DQ_0_I2C_DeInit BSP_${AIS328DQI2CInstance}_DeInit
#define CUSTOM_AIS328DQ_0_I2C_ReadReg BSP_${AIS328DQI2CInstance}_ReadReg
#define CUSTOM_AIS328DQ_0_I2C_WriteReg BSP_${AIS328DQI2CInstance}_WriteReg
[/#if]

[#if AIS3624DQSpiInstance != ""]
#define CUSTOM_AIS3624DQ_0_SPI_Init BSP_${AIS3624DQSpiInstance}_Init
#define CUSTOM_AIS3624DQ_0_SPI_DeInit BSP_${AIS3624DQSpiInstance}_DeInit
#define CUSTOM_AIS3624DQ_0_SPI_Send BSP_${AIS3624DQSpiInstance}_Send
#define CUSTOM_AIS3624DQ_0_SPI_Recv BSP_${AIS3624DQSpiInstance}_Recv
[/#if]

[#if AIS3624DQ_CS_PORT != ""]
#define CUSTOM_AIS3624DQ_0_CS_PORT ${AIS3624DQ_CS_PORT}
[/#if]
[#if AIS3624DQ_CS_PIN != ""]
#define CUSTOM_AIS3624DQ_0_CS_PIN ${AIS3624DQ_CS_PIN}
[/#if]

[#if AIS3624DQI2CInstance != ""]
#define CUSTOM_AIS3624DQ_0_I2C_Init BSP_${AIS3624DQI2CInstance}_Init
#define CUSTOM_AIS3624DQ_0_I2C_DeInit BSP_${AIS3624DQI2CInstance}_DeInit
#define CUSTOM_AIS3624DQ_0_I2C_ReadReg BSP_${AIS3624DQI2CInstance}_ReadReg
#define CUSTOM_AIS3624DQ_0_I2C_WriteReg BSP_${AIS3624DQI2CInstance}_WriteReg
[/#if]

[#if H3LIS331DLSpiInstance != ""]
#define CUSTOM_H3LIS331DL_0_SPI_Init BSP_${H3LIS331DLSpiInstance}_Init
#define CUSTOM_H3LIS331DL_0_SPI_DeInit BSP_${H3LIS331DLSpiInstance}_DeInit
#define CUSTOM_H3LIS331DL_0_SPI_Send BSP_${H3LIS331DLSpiInstance}_Send
#define CUSTOM_H3LIS331DL_0_SPI_Recv BSP_${H3LIS331DLSpiInstance}_Recv
[/#if]

[#if H3LIS331DL_CS_PORT != ""]
#define CUSTOM_H3LIS331DL_0_CS_PORT ${H3LIS331DL_CS_PORT}
[/#if]
[#if H3LIS331DL_CS_PIN != ""]
#define CUSTOM_H3LIS331DL_0_CS_PIN ${H3LIS331DL_CS_PIN}
[/#if]

[#if H3LIS331DLI2CInstance != ""]
#define CUSTOM_H3LIS331DL_0_I2C_Init BSP_${H3LIS331DLI2CInstance}_Init
#define CUSTOM_H3LIS331DL_0_I2C_DeInit BSP_${H3LIS331DLI2CInstance}_DeInit
#define CUSTOM_H3LIS331DL_0_I2C_ReadReg BSP_${H3LIS331DLI2CInstance}_ReadReg
#define CUSTOM_H3LIS331DL_0_I2C_WriteReg BSP_${H3LIS331DLI2CInstance}_WriteReg
[/#if]

[#if LSM6DSRXSpiInstance != ""]
#define CUSTOM_LSM6DSRX_0_SPI_Init BSP_${LSM6DSRXSpiInstance}_Init
#define CUSTOM_LSM6DSRX_0_SPI_DeInit BSP_${LSM6DSRXSpiInstance}_DeInit
#define CUSTOM_LSM6DSRX_0_SPI_Send BSP_${LSM6DSRXSpiInstance}_Send
#define CUSTOM_LSM6DSRX_0_SPI_Recv BSP_${LSM6DSRXSpiInstance}_Recv
[/#if]

[#if LSM6DSRX_CS_PORT != ""]
#define CUSTOM_LSM6DSRX_0_CS_PORT ${LSM6DSRX_CS_PORT}
[/#if]
[#if LSM6DSRX_CS_PIN != ""]
#define CUSTOM_LSM6DSRX_0_CS_PIN ${LSM6DSRX_CS_PIN}
[/#if]

[#if LSM6DSRXI2CInstance != ""]
#define CUSTOM_LSM6DSRX_0_I2C_Init BSP_${LSM6DSRXI2CInstance}_Init
#define CUSTOM_LSM6DSRX_0_I2C_DeInit BSP_${LSM6DSRXI2CInstance}_DeInit
#define CUSTOM_LSM6DSRX_0_I2C_ReadReg BSP_${LSM6DSRXI2CInstance}_ReadReg
#define CUSTOM_LSM6DSRX_0_I2C_WriteReg BSP_${LSM6DSRXI2CInstance}_WriteReg
[/#if]

#ifdef __cplusplus
}
#endif

#endif /* __CUSTOM_MEMS_CONF_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
