[#ftl]
/**
 ******************************************************************************
 * @file    iis2mdc_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the IIS2MDC settings
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
#ifndef __IIS2MDC_SETTINGS_H__
#define __IIS2MDC_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("IIS2MDC_ODR_MAG")]
      [#assign ODR_MAG_value = value]
    [/#if]
    [#if name.contains("IIS2MDC_FS_MAG")]
      [#assign FS_MAG_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_MAG_value == "10Hz"][#-- ####################################### --]
#define IIS2MDC_MAG_ODR 10.0f /* ODR = 10Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "20Hz"][#-- ####################################### --]
#define IIS2MDC_MAG_ODR 20.0f /* ODR = 20Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "50Hz"][#-- ####################################### --]
#define IIS2MDC_MAG_ODR 50.0f /* ODR = 50Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "100Hz"][#-- ####################################### --]
#define IIS2MDC_MAG_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "50gauss"][#-- ####################################### --]
#define IIS2MDC_MAG_FS 50 /* FS = 50gauss */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __IIS2MDC_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
