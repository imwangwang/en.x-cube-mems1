[#ftl]
/**
 ******************************************************************************
 * @file    custom_env_sensors.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the BSP Environmental Sensors interface for custom boards
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
#ifndef __CUSTOM_ENV_SENSORS_H__
#define __CUSTOM_ENV_SENSORS_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
[#if includes??]
[#list includes as include]
#include "${include}"
[/#list]
[/#if]

[#assign useHTS221I2C = false]
[#assign useLPS22HBI2C = false]
[#assign useLPS22HBSPI = false]
[#assign useLPS22HHI2C = false]
[#assign useLPS22HHSPI = false]
[#assign useSTTS751I2C = false]
[#assign useLPS33HWI2C = false]
[#assign useLPS33HWSPI = false]
[#assign useSTTS22HI2C = false]
[#assign valueMEMSInstance = "0"]

[#if RTEdatas??]
[#list RTEdatas as define]

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

[#if define?contains("LPS33HW_PRESSTEMP_I2C")]
[#assign useLPS33HWI2C = true]
[/#if]

[#if define?contains("LPS33HW_PRESSTEMP_SPI")]
[#assign useLPS33HWSPI = true]
[/#if]

[#if define?contains("STTS22H_TEMP_I2C")]
[#assign useSTTS22HI2C = true]
[/#if]

[/#list]
[/#if]

#include "custom_mems_conf.h"
#include "env_sensor.h"

[#if useHTS221I2C]
#ifndef USE_CUSTOM_ENV_SENSOR_HTS221_0
#define USE_CUSTOM_ENV_SENSOR_HTS221_0          1
#endif
[/#if]

[#if useLPS22HBI2C || useLPS22HBSPI]
#ifndef USE_CUSTOM_ENV_SENSOR_LPS22HB_0
#define USE_CUSTOM_ENV_SENSOR_LPS22HB_0         1
#endif
[/#if]

[#if useLPS22HHI2C || useLPS22HHSPI]
#ifndef USE_CUSTOM_ENV_SENSOR_LPS22HH_0
#define USE_CUSTOM_ENV_SENSOR_LPS22HH_0         1
#endif
[/#if]

[#if useSTTS751I2C]
#ifndef USE_CUSTOM_ENV_SENSOR_STTS751_0
#define USE_CUSTOM_ENV_SENSOR_STTS751_0         1
#endif
[/#if]

[#if useHTS221I2C]
#if (USE_CUSTOM_ENV_SENSOR_HTS221_0 == 1)
#include "hts221.h"
#endif
[/#if]

[#if useLPS22HBI2C || useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
#include "lps22hb.h"
#endif
[/#if]

[#if useLPS22HHI2C || useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
#include "lps22hh.h"
#endif
[/#if]

[#if useSTTS751I2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS751_0 == 1)
#include "stts751.h"
#endif
[/#if]

[#if useLPS33HWI2C || useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
#include "lps33hw.h"
#endif
[/#if]

[#if useSTTS22HI2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS22H_0 == 1)
#include "stts22h.h"
#endif
[/#if]

[#if useHTS221I2C]
#if (USE_CUSTOM_ENV_SENSOR_HTS221_0 == 1)
#define CUSTOM_HTS221_0 (${valueMEMSInstance})
#endif
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_HTS221_0"]
[/#if]

[#if useLPS22HBI2C || useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
#define CUSTOM_LPS22HB_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_LPS22HB_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_ENV_SENSOR_LPS22HB_0"]
[/#if]
[/#if]

[#if useLPS22HHI2C || useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
#define CUSTOM_LPS22HH_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_LPS22HH_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_ENV_SENSOR_LPS22HH_0"]
[/#if]
[/#if]

[#if useSTTS751I2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS751_0 == 1)
#define CUSTOM_STTS751_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_STTS751_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_ENV_SENSOR_STTS751_0"]
[/#if]
[/#if]

[#if useLPS33HWI2C || useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
#define CUSTOM_LPS33HW_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_LPS33HW_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_ENV_SENSOR_LPS33HW_0"]
[/#if]
[/#if]

[#if useSTTS22HI2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS22H_0 == 1)
#define CUSTOM_STTS22H_0 (${valueMEMSInstance})
#endif
[#if valueMEMSInstance == "0"]
[#assign valueMEMSInstance = "USE_CUSTOM_ENV_SENSOR_STTS22H_0"]
[#else]
[#assign valueMEMSInstance = valueMEMSInstance + " + USE_CUSTOM_ENV_SENSOR_STTS22H_0"]
[/#if]
[/#if]

/* Environmental Sensor instance Info */
typedef struct
{
  uint8_t Temperature;
  uint8_t Pressure;
  uint8_t Humidity;
  uint8_t LowPower;
  float   HumMaxOdr;
  float   TempMaxOdr;
  float   PressMaxOdr;
} CUSTOM_ENV_SENSOR_Capabilities_t;

typedef struct
{
  uint32_t Functions;
} CUSTOM_ENV_SENSOR_Ctx_t;

#ifndef ENV_TEMPERATURE
#define ENV_TEMPERATURE      1U
#endif
#ifndef ENV_PRESSURE
#define ENV_PRESSURE         2U
#endif
#ifndef ENV_HUMIDITY
#define ENV_HUMIDITY         4U
#endif

#define CUSTOM_ENV_FUNCTIONS_NBR    3U
#define CUSTOM_ENV_INSTANCES_NBR    (${valueMEMSInstance})

#if (CUSTOM_ENV_INSTANCES_NBR == 0)
#error "No environmental sensor instance has been selected"
#endif

int32_t CUSTOM_ENV_SENSOR_Init(uint32_t Instance, uint32_t Functions);
int32_t CUSTOM_ENV_SENSOR_DeInit(uint32_t Instance);
int32_t CUSTOM_ENV_SENSOR_GetCapabilities(uint32_t Instance, CUSTOM_ENV_SENSOR_Capabilities_t *Capabilities);
int32_t CUSTOM_ENV_SENSOR_ReadID(uint32_t Instance, uint8_t *Id);
int32_t CUSTOM_ENV_SENSOR_Enable(uint32_t Instance, uint32_t Function);
int32_t CUSTOM_ENV_SENSOR_Disable(uint32_t Instance, uint32_t Function);
int32_t CUSTOM_ENV_SENSOR_GetOutputDataRate(uint32_t Instance, uint32_t Function, float *Odr);
int32_t CUSTOM_ENV_SENSOR_SetOutputDataRate(uint32_t Instance, uint32_t Function, float Odr);
int32_t CUSTOM_ENV_SENSOR_GetValue(uint32_t Instance, uint32_t Function, float *Value);

#ifdef __cplusplus
}
#endif

#endif /* __CUSTOM_ENV_SENSORS_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
