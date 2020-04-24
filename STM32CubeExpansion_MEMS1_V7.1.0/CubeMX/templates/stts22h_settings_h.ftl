[#ftl]
/**
 ******************************************************************************
 * @file    stts22h_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the STTS22H settings
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
#ifndef __STTS22H_SETTINGS_H__
#define __STTS22H_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("STTS22H_ODR")]
      [#assign ODR_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_value == "1Hz"][#-- ####################################### --]
#define STTS22H_ODR 1.0f /* ODR = 1.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "25Hz"][#-- ####################################### --]
#define STTS22H_ODR 25.0f /* ODR = 25.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "50Hz"][#-- ####################################### --]
#define STTS22H_ODR 50.0f /* ODR = 50.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "100Hz"][#-- ####################################### --]
#define STTS22H_ODR 100.0f /* ODR = 100.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "200Hz"][#-- ####################################### --]
#define STTS22H_ODR 200.0f /* ODR = 200.0Hz */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __STTS22H_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
