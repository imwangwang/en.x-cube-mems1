[#ftl]
/**
 ******************************************************************************
 * @file    lps33hw_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the LPS33HW settings
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
#ifndef __LPS33HW_SETTINGS_H__
#define __LPS33HW_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LPS33HW_ODR")]
      [#assign ODR_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_value == "1Hz"][#-- ####################################### --]
#define LPS33HW_ODR 1.0f /* ODR = 1.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "10Hz"][#-- ####################################### --]
#define LPS33HW_ODR 10.0f /* ODR = 10.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "25Hz"][#-- ####################################### --]
#define LPS33HW_ODR 25.0f /* ODR = 25.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "50Hz"][#-- ####################################### --]
#define LPS33HW_ODR 50.0f /* ODR = 50.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_value == "75Hz"][#-- ####################################### --]
#define LPS33HW_ODR 75.0f /* ODR = 75.0Hz */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __LPS33HW_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
