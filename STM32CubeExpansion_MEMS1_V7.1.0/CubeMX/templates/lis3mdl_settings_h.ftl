[#ftl]
/**
 ******************************************************************************
 * @file    lis3mdl_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the LIS3MDL settings
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
#ifndef __LIS3MDL_SETTINGS_H__
#define __LIS3MDL_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LIS3MDL_ODR_MAG")]
      [#assign ODR_MAG_value = value]
    [/#if]
    [#if name.contains("LIS3MDL_FS_MAG")]
      [#assign FS_MAG_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_MAG_value == "0.625Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 0.625f /* ODR = 0.625Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "1.25Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 1.25f /* ODR = 1.25Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "2.5Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 2.5f /* ODR = 2.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "5Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 5.0f /* ODR = 5.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "10Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 10.0f /* ODR = 10.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "20Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 20.0f /* ODR = 20.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "40Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 40.0f /* ODR = 40.0Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "80Hz"][#-- ####################################### --]
#define LIS3MDL_MAG_ODR 80.0f /* ODR = 80.0Hz */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "4gauss"][#-- ####################################### --]
#define LIS3MDL_MAG_FS 4 /* FS = 4gauss */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "8gauss"][#-- ####################################### --]
#define LIS3MDL_MAG_FS 8 /* FS = 8gauss */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "12gauss"][#-- ####################################### --]
#define LIS3MDL_MAG_FS 12 /* FS = 12gauss */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "16gauss"][#-- ####################################### --]
#define LIS3MDL_MAG_FS 16 /* FS = 16gauss */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __LIS3MDL_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
