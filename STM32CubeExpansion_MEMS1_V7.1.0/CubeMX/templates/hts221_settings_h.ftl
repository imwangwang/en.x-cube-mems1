[#ftl]
/**
 ******************************************************************************
 * @file    hts221_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the HTS221 settings
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
#ifndef __HTS221_SETTINGS_H__
#define __HTS221_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("HTS221_ODR")]
      [#assign ODR_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_value == "1Hz"][#-- ####################################### --]
#define HTS221_ODR 1.0f /* ODR = 1.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "7Hz"][#-- ####################################### --]
#define HTS221_ODR 7.0f /* ODR = 7.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "12.5Hz"][#-- ####################################### --]
#define HTS221_ODR 12.5f /* ODR = 12.5Hz */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __HTS221_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
