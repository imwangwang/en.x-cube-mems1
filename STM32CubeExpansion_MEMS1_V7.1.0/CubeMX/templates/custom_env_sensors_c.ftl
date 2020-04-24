[#ftl]
/**
 ******************************************************************************
 * @file    custom_env_sensors.c
 * @author  MEMS Application Team
 * @brief   This file provides BSP Environmental Sensors interface for custom boards
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

[#assign useHTS221I2C = false]
[#assign useLPS22HBI2C = false]
[#assign useLPS22HBSPI = false]
[#assign useLPS22HHI2C = false]
[#assign useLPS22HHSPI = false]
[#assign useSTTS751I2C = false]
[#assign useLPS33HWI2C = false]
[#assign useLPS33HWSPI = false]
[#assign useSTTS22HI2C = false]

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

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LPS22HB_SA0")]
      [#assign LPS22HB_SA0_value = value]
    [/#if]

    [#if name.contains("LPS22HH_SA0")]
      [#assign LPS22HH_SA0_value = value]
    [/#if]

    [#if name.contains("STTS751_ADDR")]
      [#assign STTS751_ADDR_value = value]
    [/#if]

    [#if name.contains("LPS33HW_SA0")]
      [#assign LPS33HW_SA0_value = value]
    [/#if]

    [#if name.contains("STTS22H_ADDR")]
      [#assign STTS22H_ADDR_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]

/* Includes ------------------------------------------------------------------*/
#include "custom_env_sensors.h"

extern void *EnvCompObj[CUSTOM_ENV_INSTANCES_NBR]; /* This "redundant" line is here to fulfil MISRA C-2012 rule 8.4 */
void *EnvCompObj[CUSTOM_ENV_INSTANCES_NBR];

/* We define a jump table in order to get the correct index from the desired function. */
/* This table should have a size equal to the maximum value of a function plus 1.      */
static uint32_t FunctionIndex[5] = {0,0,1,1,2};
static ENV_SENSOR_FuncDrv_t *EnvFuncDrv[CUSTOM_ENV_INSTANCES_NBR][CUSTOM_ENV_FUNCTIONS_NBR];
static ENV_SENSOR_CommonDrv_t *EnvDrv[CUSTOM_ENV_INSTANCES_NBR];
static CUSTOM_ENV_SENSOR_Ctx_t EnvCtx[CUSTOM_ENV_INSTANCES_NBR];

[#if useHTS221I2C]
#if (USE_CUSTOM_ENV_SENSOR_HTS221_0 == 1)
static int32_t HTS221_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useLPS22HBI2C || useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
static int32_t LPS22HB_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useLPS22HHI2C || useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
static int32_t LPS22HH_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useSTTS751I2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS751_0 == 1)
static int32_t STTS751_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useLPS33HWI2C || useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
static int32_t LPS33HW_0_Probe(uint32_t Functions);
#endif
[/#if]

[#if useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
static int32_t CUSTOM_LPS22HB_0_Init(void);
static int32_t CUSTOM_LPS22HB_0_DeInit(void);
static int32_t CUSTOM_LPS22HB_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LPS22HB_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
static int32_t CUSTOM_LPS22HH_0_Init(void);
static int32_t CUSTOM_LPS22HH_0_DeInit(void);
static int32_t CUSTOM_LPS22HH_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LPS22HH_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
static int32_t CUSTOM_LPS33HW_0_Init(void);
static int32_t CUSTOM_LPS33HW_0_DeInit(void);
static int32_t CUSTOM_LPS33HW_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
static int32_t CUSTOM_LPS33HW_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len);
#endif
[/#if]

[#if useSTTS22HI2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS22H_0 == 1)
static int32_t STTS22H_0_Probe(uint32_t Functions);
#endif
[/#if]

/**
 * @brief  Initializes the environmental sensor
 * @param  Instance environmental sensor instance to be used
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_Init(uint32_t Instance, uint32_t Functions)
{
  int32_t ret = BSP_ERROR_NONE;
  uint32_t function = ENV_TEMPERATURE;
  uint32_t i;
  uint32_t component_functions = 0;
  CUSTOM_ENV_SENSOR_Capabilities_t cap;

  switch (Instance)
  {
[#if useHTS221I2C]
#if (USE_CUSTOM_ENV_SENSOR_HTS221_0 == 1)
    case CUSTOM_HTS221_0:
      if (HTS221_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
      }
      break;
#endif
[/#if]
[#if useLPS22HBI2C || useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
    case CUSTOM_LPS22HB_0:
      if (LPS22HB_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
      }
      break;
#endif
[/#if]
[#if useLPS22HHI2C || useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
    case CUSTOM_LPS22HH_0:
      if (LPS22HH_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
      }
      break;
#endif
[/#if]
[#if useSTTS751I2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS751_0 == 1)
    case CUSTOM_STTS751_0:
      if (STTS751_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
      }
      break;
#endif
[/#if]
[#if useLPS33HWI2C || useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
    case CUSTOM_LPS33HW_0:
      if (LPS33HW_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
      }
      break;
#endif
[/#if]
[#if useSTTS22HI2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS22H_0 == 1)
    case CUSTOM_STTS22H_0:
      if (STTS22H_0_Probe(Functions) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_NO_INIT;
      }
      if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], (void *)&cap) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_UNKNOWN_COMPONENT;
      }
      if (cap.Temperature == 1U)
      {
        component_functions |= ENV_TEMPERATURE;
      }
      if (cap.Humidity == 1U)
      {
        component_functions |= ENV_HUMIDITY;
      }
      if (cap.Pressure == 1U)
      {
        component_functions |= ENV_PRESSURE;
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

  for (i = 0; i < CUSTOM_ENV_FUNCTIONS_NBR; i++)
  {
    if (((Functions & function) == function) && ((component_functions & function) == function))
    {
      if (EnvFuncDrv[Instance][FunctionIndex[function]]->Enable(EnvCompObj[Instance]) != BSP_ERROR_NONE)
      {
        return BSP_ERROR_COMPONENT_FAILURE;
      }
    }
    function = function << 1;
  }

  return ret;
}


/**
 * @brief  Deinitialize environmental sensor sensor
 * @param  Instance environmental sensor instance to be used
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_DeInit(uint32_t Instance)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (EnvDrv[Instance]->DeInit(EnvCompObj[Instance]) != BSP_ERROR_NONE)
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
 * @brief  Get environmental sensor instance capabilities
 * @param  Instance Environmental sensor instance
 * @param  Capabilities pointer to Environmental sensor capabilities
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_GetCapabilities(uint32_t Instance, CUSTOM_ENV_SENSOR_Capabilities_t *Capabilities)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (EnvDrv[Instance]->GetCapabilities(EnvCompObj[Instance], Capabilities) != BSP_ERROR_NONE)
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
 * @param  Instance environmental sensor instance to be used
 * @param  Id WHOAMI value
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_ReadID(uint32_t Instance, uint8_t *Id)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else if (EnvDrv[Instance]->ReadID(EnvCompObj[Instance], Id) != BSP_ERROR_NONE)
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
 * @brief  Enable environmental sensor
 * @param  Instance environmental sensor instance to be used
 * @param  Function Environmental sensor function. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_Enable(uint32_t Instance, uint32_t Function)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((EnvCtx[Instance].Functions & Function) == Function)
    {
      if (EnvFuncDrv[Instance][FunctionIndex[Function]]->Enable(EnvCompObj[Instance]) != BSP_ERROR_NONE)
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
 * @brief  Disable environmental sensor
 * @param  Instance environmental sensor instance to be used
 * @param  Function Environmental sensor function. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_Disable(uint32_t Instance, uint32_t Function)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((EnvCtx[Instance].Functions & Function) == Function)
    {
      if (EnvFuncDrv[Instance][FunctionIndex[Function]]->Disable(EnvCompObj[Instance]) != BSP_ERROR_NONE)
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
 * @brief  Get environmental sensor Output Data Rate
 * @param  Instance environmental sensor instance to be used
 * @param  Function Environmental sensor function. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @param  Odr pointer to Output Data Rate read value
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_GetOutputDataRate(uint32_t Instance, uint32_t Function, float *Odr)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((EnvCtx[Instance].Functions & Function) == Function)
    {
      if (EnvFuncDrv[Instance][FunctionIndex[Function]]->GetOutputDataRate(EnvCompObj[Instance], Odr) != BSP_ERROR_NONE)
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
 * @brief  Set environmental sensor Output Data Rate
 * @param  Instance environmental sensor instance to be used
 * @param  Function Environmental sensor function. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @param  Odr Output Data Rate value to be set
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_SetOutputDataRate(uint32_t Instance, uint32_t Function, float Odr)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((EnvCtx[Instance].Functions & Function) == Function)
    {
      if (EnvFuncDrv[Instance][FunctionIndex[Function]]->SetOutputDataRate(EnvCompObj[Instance], Odr) != BSP_ERROR_NONE)
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
 * @brief  Get environmental sensor value
 * @param  Instance environmental sensor instance to be used
 * @param  Function Environmental sensor function. Could be :
 *         - ENV_TEMPERATURE
 *         - ENV_PRESSURE
 *         - ENV_HUMIDITY
 * @param  Value pointer to environmental sensor value
 * @retval BSP status
 */
int32_t CUSTOM_ENV_SENSOR_GetValue(uint32_t Instance, uint32_t Function, float *Value)
{
  int32_t ret;

  if (Instance >= CUSTOM_ENV_INSTANCES_NBR)
  {
    ret = BSP_ERROR_WRONG_PARAM;
  }
  else
  {
    if ((EnvCtx[Instance].Functions & Function) == Function)
    {
      if (EnvFuncDrv[Instance][FunctionIndex[Function]]->GetValue(EnvCompObj[Instance], Value) != BSP_ERROR_NONE)
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

[#if useHTS221I2C]
#if (USE_CUSTOM_ENV_SENSOR_HTS221_0 == 1)
/**
 * @brief  Register Bus IOs for HTS221 instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_HUMIDITY
 * @retval BSP status
 */
static int32_t HTS221_0_Probe(uint32_t Functions)
{
  HTS221_IO_t            io_ctx;
  uint8_t                id;
  int32_t                ret = BSP_ERROR_NONE;
  static HTS221_Object_t hts221_obj_0;
  HTS221_Capabilities_t  cap;

  /* Configure the environmental sensor driver */
  io_ctx.BusType     = HTS221_I2C_BUS; /* I2C */
  io_ctx.Address     = HTS221_I2C_ADDRESS;
  io_ctx.Init        = CUSTOM_HTS221_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_HTS221_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_HTS221_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_HTS221_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (HTS221_RegisterBusIO(&hts221_obj_0, &io_ctx) != HTS221_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (HTS221_ReadID(&hts221_obj_0, &id) != HTS221_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != HTS221_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)HTS221_GetCapabilities(&hts221_obj_0, &cap);
    EnvCtx[CUSTOM_HTS221_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                   uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_HTS221_0] = &hts221_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_HTS221_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&HTS221_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_HTS221_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&HTS221_TEMP_Driver;

      if (EnvDrv[CUSTOM_HTS221_0]->Init(EnvCompObj[CUSTOM_HTS221_0]) != HTS221_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY) && (cap.Humidity == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_HTS221_0][FunctionIndex[ENV_HUMIDITY]] = (ENV_SENSOR_FuncDrv_t *)(void *)&HTS221_HUM_Driver;

      if (EnvDrv[CUSTOM_HTS221_0]->Init(EnvCompObj[CUSTOM_HTS221_0]) != HTS221_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLPS22HBI2C]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
/**
 * @brief  Register Bus IOs for LPS22HB instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS22HB_0_Probe(uint32_t Functions)
{
  LPS22HB_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS22HB_Object_t lps22hb_obj_0;
  LPS22HB_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS22HB_I2C_BUS; /* I2C */
[#if LPS22HB_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LPS22HB_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LPS22HB_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LPS22HB_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LPS22HB_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LPS22HB_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS22HB_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS22HB_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS22HB_RegisterBusIO(&lps22hb_obj_0, &io_ctx) != LPS22HB_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS22HB_ReadID(&lps22hb_obj_0, &id) != LPS22HB_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS22HB_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS22HB_GetCapabilities(&lps22hb_obj_0, &cap);

    EnvCtx[CUSTOM_LPS22HB_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS22HB_0] = &lps22hb_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS22HB_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS22HB_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HB_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HB_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS22HB_0]->Init(EnvCompObj[CUSTOM_LPS22HB_0]) != LPS22HB_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HB_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HB_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS22HB_0]->Init(EnvCompObj[CUSTOM_LPS22HB_0]) != LPS22HB_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLPS22HBSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HB_0 == 1)
/**
 * @brief  Register Bus IOs for LPS22HB instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS22HB_0_Probe(uint32_t Functions)
{
  LPS22HB_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS22HB_Object_t lps22hb_obj_0;
  LPS22HB_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS22HB_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LPS22HB_0_Init;
  io_ctx.DeInit      = CUSTOM_LPS22HB_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS22HB_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS22HB_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS22HB_RegisterBusIO(&lps22hb_obj_0, &io_ctx) != LPS22HB_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS22HB_ReadID(&lps22hb_obj_0, &id) != LPS22HB_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS22HB_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS22HB_GetCapabilities(&lps22hb_obj_0, &cap);

    EnvCtx[CUSTOM_LPS22HB_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS22HB_0] = &lps22hb_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS22HB_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS22HB_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HB_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HB_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS22HB_0]->Init(EnvCompObj[CUSTOM_LPS22HB_0]) != LPS22HB_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HB_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HB_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS22HB_0]->Init(EnvCompObj[CUSTOM_LPS22HB_0]) != LPS22HB_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LPS22HB
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HB_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS22HB_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LPS22HB
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HB_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS22HB_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LPS22HB
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HB_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HB_0_CS_PORT, CUSTOM_LPS22HB_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS22HB_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS22HB_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HB_0_CS_PORT, CUSTOM_LPS22HB_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LPS22HB
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HB_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HB_0_CS_PORT, CUSTOM_LPS22HB_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS22HB_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS22HB_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HB_0_CS_PORT, CUSTOM_LPS22HB_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useLPS22HHI2C]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
/**
 * @brief  Register Bus IOs for LPS22HH instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS22HH_0_Probe(uint32_t Functions)
{
  LPS22HH_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS22HH_Object_t lps22hh_obj_0;
  LPS22HH_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS22HH_I2C_BUS; /* I2C */
[#if LPS22HH_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LPS22HH_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LPS22HH_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LPS22HH_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LPS22HH_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LPS22HH_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS22HH_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS22HH_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS22HH_RegisterBusIO(&lps22hh_obj_0, &io_ctx) != LPS22HH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS22HH_ReadID(&lps22hh_obj_0, &id) != LPS22HH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS22HH_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS22HH_GetCapabilities(&lps22hh_obj_0, &cap);

    EnvCtx[CUSTOM_LPS22HH_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS22HH_0] = &lps22hh_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS22HH_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS22HH_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HH_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HH_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS22HH_0]->Init(EnvCompObj[CUSTOM_LPS22HH_0]) != LPS22HH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HH_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HH_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS22HH_0]->Init(EnvCompObj[CUSTOM_LPS22HH_0]) != LPS22HH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLPS22HHSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS22HH_0 == 1)
/**
 * @brief  Register Bus IOs for LPS22HH instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS22HH_0_Probe(uint32_t Functions)
{
  LPS22HH_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS22HH_Object_t lps22hh_obj_0;
  LPS22HH_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS22HH_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LPS22HH_0_Init;
  io_ctx.DeInit      = CUSTOM_LPS22HH_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS22HH_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS22HH_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS22HH_RegisterBusIO(&lps22hh_obj_0, &io_ctx) != LPS22HH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS22HH_ReadID(&lps22hh_obj_0, &id) != LPS22HH_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS22HH_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS22HH_GetCapabilities(&lps22hh_obj_0, &cap);

    EnvCtx[CUSTOM_LPS22HH_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS22HH_0] = &lps22hh_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS22HH_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS22HH_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HH_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HH_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS22HH_0]->Init(EnvCompObj[CUSTOM_LPS22HH_0]) != LPS22HH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS22HH_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS22HH_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS22HH_0]->Init(EnvCompObj[CUSTOM_LPS22HH_0]) != LPS22HH_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LPS22HH
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HH_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS22HH_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LPS22HH
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HH_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS22HH_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LPS22HH
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HH_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HH_0_CS_PORT, CUSTOM_LPS22HH_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS22HH_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS22HH_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HH_0_CS_PORT, CUSTOM_LPS22HH_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LPS22HH
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LPS22HH_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HH_0_CS_PORT, CUSTOM_LPS22HH_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS22HH_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS22HH_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS22HH_0_CS_PORT, CUSTOM_LPS22HH_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useSTTS751I2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS751_0 == 1)
/**
 * @brief  Register Bus IOs for STTS751 instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE
 * @retval BSP status
 */
static int32_t STTS751_0_Probe(uint32_t Functions)
{
  STTS751_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static STTS751_Object_t stts751_obj_0;
  STTS751_Capabilities_t  cap;

  /* Configure the environmental sensor driver */
  io_ctx.BusType     = STTS751_I2C_BUS; /* I2C */
[#if STTS751_ADDR_value == "STTS751_0_PULLUP_7.5K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_0xxxx_ADD_7K5; /* Product ID 0 and Pull-Up resistor 7.5K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_0_PULLUP_12K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_0xxxx_ADD_12K; /* Product ID 0 and Pull-Up resistor 12K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_0_PULLUP_20K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_0xxxx_ADD_20K; /* Product ID 0 and Pull-Up resistor 20K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_0_PULLUP_33K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_0xxxx_ADD_33K; /* Product ID 0 and Pull-Up resistor 33K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_1_PULLUP_7.5K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_1xxxx_ADD_7K5; /* Product ID 1 and Pull-Up resistor 7.5K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_1_PULLUP_12K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_1xxxx_ADD_12K; /* Product ID 1 and Pull-Up resistor 12K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_1_PULLUP_20K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_1xxxx_ADD_20K; /* Product ID 1 and Pull-Up resistor 20K */
[/#if][#-- ################################################################# --]
[#if STTS751_ADDR_value == "STTS751_1_PULLUP_33K"][#-- ####################################### --]
  io_ctx.Address     = STTS751_1xxxx_ADD_33K; /* Product ID 1 and Pull-Up resistor 33K */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_STTS751_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_STTS751_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_STTS751_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_STTS751_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (STTS751_RegisterBusIO(&stts751_obj_0, &io_ctx) != STTS751_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (STTS751_ReadID(&stts751_obj_0, &id) != STTS751_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != STTS751_ID_MAN)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)STTS751_GetCapabilities(&stts751_obj_0, &cap);
    EnvCtx[CUSTOM_STTS751_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                   uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_STTS751_0] = &stts751_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_STTS751_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&STTS751_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_STTS751_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&STTS751_TEMP_Driver;

      if (EnvDrv[CUSTOM_STTS751_0]->Init(EnvCompObj[CUSTOM_STTS751_0]) != STTS751_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLPS33HWI2C]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
/**
 * @brief  Register Bus IOs for LPS33HW instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS33HW_0_Probe(uint32_t Functions)
{
  LPS33HW_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS33HW_Object_t lps33hw_obj_0;
  LPS33HW_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS33HW_I2C_BUS; /* I2C */
[#if LPS33HW_SA0_value == "VDD"][#-- ####################################### --]
  io_ctx.Address     = LPS33HW_I2C_ADD_H; /* SA0 = VDD */
[/#if][#-- ################################################################# --]
[#if LPS33HW_SA0_value == "GND"][#-- ####################################### --]
  io_ctx.Address     = LPS33HW_I2C_ADD_L; /* SA0 = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_LPS33HW_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_LPS33HW_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS33HW_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS33HW_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS33HW_RegisterBusIO(&lps33hw_obj_0, &io_ctx) != LPS33HW_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS33HW_ReadID(&lps33hw_obj_0, &id) != LPS33HW_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS33HW_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS33HW_GetCapabilities(&lps33hw_obj_0, &cap);

    EnvCtx[CUSTOM_LPS33HW_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS33HW_0] = &lps33hw_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS33HW_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS33HW_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS33HW_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS33HW_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS33HW_0]->Init(EnvCompObj[CUSTOM_LPS33HW_0]) != LPS33HW_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS33HW_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS33HW_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS33HW_0]->Init(EnvCompObj[CUSTOM_LPS33HW_0]) != LPS33HW_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

[#if useLPS33HWSPI]
#if (USE_CUSTOM_ENV_SENSOR_LPS33HW_0 == 1)
/**
 * @brief  Register Bus IOs for LPS33HW instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE and/or ENV_PRESSURE
 * @retval BSP status
 */
static int32_t LPS33HW_0_Probe(uint32_t Functions)
{
  LPS33HW_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static LPS33HW_Object_t lps33hw_obj_0;
  LPS33HW_Capabilities_t  cap;

  /* Configure the pressure driver */
  io_ctx.BusType     = LPS33HW_SPI_4WIRES_BUS; /* SPI 4-Wires */
  io_ctx.Address     = 0x0;
  io_ctx.Init        = CUSTOM_LPS33HW_0_Init;
  io_ctx.DeInit      = CUSTOM_LPS33HW_0_DeInit;
  io_ctx.ReadReg     = CUSTOM_LPS33HW_0_ReadReg;
  io_ctx.WriteReg    = CUSTOM_LPS33HW_0_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (LPS33HW_RegisterBusIO(&lps33hw_obj_0, &io_ctx) != LPS33HW_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (LPS33HW_ReadID(&lps33hw_obj_0, &id) != LPS33HW_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != LPS33HW_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)LPS33HW_GetCapabilities(&lps33hw_obj_0, &cap);

    EnvCtx[CUSTOM_LPS33HW_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                    uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_LPS33HW_0] = &lps33hw_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_LPS33HW_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&LPS33HW_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS33HW_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS33HW_TEMP_Driver;

      if (EnvDrv[CUSTOM_LPS33HW_0]->Init(EnvCompObj[CUSTOM_LPS33HW_0]) != LPS33HW_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE) && (cap.Pressure == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_LPS33HW_0][FunctionIndex[ENV_PRESSURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&LPS33HW_PRESS_Driver;

      if (EnvDrv[CUSTOM_LPS33HW_0]->Init(EnvCompObj[CUSTOM_LPS33HW_0]) != LPS33HW_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}

/**
 * @brief  Initialize SPI bus for LPS33HW
 * @retval BSP status
 */
static int32_t CUSTOM_LPS33HW_0_Init(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS33HW_0_SPI_Init() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  DeInitialize SPI bus for LPS33HW
 * @retval BSP status
 */
static int32_t CUSTOM_LPS33HW_0_DeInit(void)
{
  int32_t ret = BSP_ERROR_UNKNOWN_FAILURE;

  if(CUSTOM_LPS33HW_0_SPI_DeInit() == BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_NONE;
  }

  return ret;
}

/**
 * @brief  Write register by SPI bus for LPS33HW
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be written
 * @param  pdata the pointer to the data to be written
 * @param  len the length of the data to be written
 * @retval BSP status
 */
static int32_t CUSTOM_LPS33HW_0_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS33HW_0_CS_PORT, CUSTOM_LPS33HW_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS33HW_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS33HW_0_SPI_Send(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS33HW_0_CS_PORT, CUSTOM_LPS33HW_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}

/**
 * @brief  Read register by SPI bus for LPS33HW
 * @param  Addr not used, it is only for BSP compatibility
 * @param  Reg the starting register address to be read
 * @param  pdata the pointer to the data to be read
 * @param  len the length of the data to be read
 * @retval BSP status
 */
static int32_t CUSTOM_LPS33HW_0_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pdata, uint16_t len)
{
  int32_t ret = BSP_ERROR_NONE;
  uint8_t dataReg = (uint8_t)Reg;

  dataReg |= 0x80;

  /* CS Enable */
  HAL_GPIO_WritePin(CUSTOM_LPS33HW_0_CS_PORT, CUSTOM_LPS33HW_0_CS_PIN, GPIO_PIN_RESET);

  if (CUSTOM_LPS33HW_0_SPI_Send(&dataReg, 1) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  if (CUSTOM_LPS33HW_0_SPI_Recv(pdata, len) != BSP_ERROR_NONE)
  {
    ret = BSP_ERROR_UNKNOWN_FAILURE;
  }

  /* CS Disable */
  HAL_GPIO_WritePin(CUSTOM_LPS33HW_0_CS_PORT, CUSTOM_LPS33HW_0_CS_PIN, GPIO_PIN_SET);

  return ret;
}
#endif
[/#if]

[#if useSTTS22HI2C]
#if (USE_CUSTOM_ENV_SENSOR_STTS22H_0 == 1)
/**
 * @brief  Register Bus IOs for STTS22H instance
 * @param  Functions Environmental sensor functions. Could be :
 *         - ENV_TEMPERATURE
 * @retval BSP status
 */
static int32_t STTS22H_0_Probe(uint32_t Functions)
{
  STTS22H_IO_t            io_ctx;
  uint8_t                 id;
  int32_t                 ret = BSP_ERROR_NONE;
  static STTS22H_Object_t stts22h_obj_0;
  STTS22H_Capabilities_t  cap;

  /* Configure the environmental sensor driver */
  io_ctx.BusType     = STTS22H_I2C_BUS; /* I2C */
[#if STTS22H_ADDR_value == "STTS22H_I2C_ADD_H"][#-- ####################################### --]
  io_ctx.Address     = STTS22H_I2C_ADD_H; /* ADDR pin = VDD */
[/#if][#-- ################################################################# --]
[#if STTS22H_ADDR_value == "STTS22H_I2C_ADD_L"][#-- ####################################### --]
  io_ctx.Address     = STTS22H_I2C_ADD_L; /* ADDR pin = GND */
[/#if][#-- ################################################################# --]
  io_ctx.Init        = CUSTOM_STTS22H_0_I2C_Init;
  io_ctx.DeInit      = CUSTOM_STTS22H_0_I2C_DeInit;
  io_ctx.ReadReg     = CUSTOM_STTS22H_0_I2C_ReadReg;
  io_ctx.WriteReg    = CUSTOM_STTS22H_0_I2C_WriteReg;
  io_ctx.GetTick     = BSP_GetTick;

  if (STTS22H_RegisterBusIO(&stts22h_obj_0, &io_ctx) != STTS22H_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (STTS22H_ReadID(&stts22h_obj_0, &id) != STTS22H_OK)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else if (id != STTS22H_ID)
  {
    ret = BSP_ERROR_UNKNOWN_COMPONENT;
  }
  else
  {
    (void)STTS22H_GetCapabilities(&stts22h_obj_0, &cap);
    EnvCtx[CUSTOM_STTS22H_0].Functions = ((uint32_t)cap.Temperature) | ((uint32_t)cap.Pressure << 1) | ((
                                   uint32_t)cap.Humidity << 2);

    EnvCompObj[CUSTOM_STTS22H_0] = &stts22h_obj_0;
    /* The second cast (void *) is added to bypass Misra R11.3 rule */
    EnvDrv[CUSTOM_STTS22H_0] = (ENV_SENSOR_CommonDrv_t *)(void *)&STTS22H_COMMON_Driver;

    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_TEMPERATURE) == ENV_TEMPERATURE) && (cap.Temperature == 1U))
    {
      /* The second cast (void *) is added to bypass Misra R11.3 rule */
      EnvFuncDrv[CUSTOM_STTS22H_0][FunctionIndex[ENV_TEMPERATURE]] = (ENV_SENSOR_FuncDrv_t *)(void *)&STTS22H_TEMP_Driver;

      if (EnvDrv[CUSTOM_STTS22H_0]->Init(EnvCompObj[CUSTOM_STTS22H_0]) != STTS22H_OK)
      {
        ret = BSP_ERROR_COMPONENT_FAILURE;
      }
      else
      {
        ret = BSP_ERROR_NONE;
      }
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_HUMIDITY) == ENV_HUMIDITY))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
    if ((ret == BSP_ERROR_NONE) && ((Functions & ENV_PRESSURE) == ENV_PRESSURE))
    {
      /* Return an error if the application try to initialize a function not supported by the component */
      ret = BSP_ERROR_COMPONENT_FAILURE;
    }
  }

  return ret;
}
#endif
[/#if]

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
