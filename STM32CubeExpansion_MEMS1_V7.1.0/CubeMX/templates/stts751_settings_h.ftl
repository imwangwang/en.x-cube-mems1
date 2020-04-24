[#ftl]
/**
 ******************************************************************************
 * @file    stts751_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the STTS751 settings
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
#ifndef __STTS751_SETTINGS_H__
#define __STTS751_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("STTS751_ODR")]
      [#assign ODR_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_value == "0.0625Hz"][#-- ####################################### --]
#define STTS751_ODR 0.0625f /* ODR = 0.0625Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "0.125Hz"][#-- ####################################### --]
#define STTS751_ODR 0.125f /* ODR = 0.125Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "0.25Hz"][#-- ####################################### --]
#define STTS751_ODR 0.25f /* ODR = 0.25Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "0.5Hz"][#-- ####################################### --]
#define STTS751_ODR 0.5f /* ODR = 0.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "1Hz"][#-- ####################################### --]
#define STTS751_ODR 1.0f /* ODR = 1.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "2Hz"][#-- ####################################### --]
#define STTS751_ODR 2.0f /* ODR = 2.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "4Hz"][#-- ####################################### --]
#define STTS751_ODR 4.0f /* ODR = 4.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "8Hz"][#-- ####################################### --]
#define STTS751_ODR 8.0f /* ODR = 8.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "16Hz"][#-- ####################################### --]
#define STTS751_ODR 16.0f /* ODR = 16.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "32Hz"][#-- ####################################### --]
#define STTS751_ODR 32.0f /* ODR = 32.0Hz */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __STTS751_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
