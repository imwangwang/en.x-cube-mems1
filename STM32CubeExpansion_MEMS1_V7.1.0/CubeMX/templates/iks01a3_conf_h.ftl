[#ftl]
/**
 ******************************************************************************
 * @file    iks01a3_conf.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the MEMS components bus interfaces
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

#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}_bus.h"
#include "${BoardName}_errno.h"

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign IKS01A3I2CInstance = ""]

[#list BspIpDatas as SWIP]
  [#if SWIP.variables??]
    [#list SWIP.variables as variables]
      [#if variables.name?contains("IpInstance")]
        [#assign IpInstance = variables.value]
      [/#if]
      [#if variables.name?contains("IpName")]
        [#assign IpName = variables.value]
      [/#if]
      [#if variables.value?contains("IKS01A3 BUS IO driver")]
        [#assign IKS01A3I2CInstance = IpInstance]
      [/#if]
    [/#list]
  [/#if]
[/#list]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __IKS01A3_CONF_H__
#define __IKS01A3_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif

/* USER CODE BEGIN 1 */
#define USE_IKS01A3_ENV_SENSOR_HTS221_0                1U
#define USE_IKS01A3_ENV_SENSOR_LPS22HH_0               1U
#define USE_IKS01A3_ENV_SENSOR_STTS751_0               1U

#define USE_IKS01A3_MOTION_SENSOR_LSM6DSO_0            1U
#define USE_IKS01A3_MOTION_SENSOR_LIS2DW12_0           1U
#define USE_IKS01A3_MOTION_SENSOR_LIS2MDL_0            1U
/* USER CODE END 1 */

[#if IKS01A3I2CInstance != ""]
#define IKS01A3_I2C_Init BSP_${IKS01A3I2CInstance}_Init
#define IKS01A3_I2C_DeInit BSP_${IKS01A3I2CInstance}_DeInit
#define IKS01A3_I2C_ReadReg BSP_${IKS01A3I2CInstance}_ReadReg
#define IKS01A3_I2C_WriteReg BSP_${IKS01A3I2CInstance}_WriteReg
#define IKS01A3_GetTick BSP_GetTick
[/#if]

#ifdef __cplusplus
}
#endif

#endif /* __IKS01A3_CONF_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
