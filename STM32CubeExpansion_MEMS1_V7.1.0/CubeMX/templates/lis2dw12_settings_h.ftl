[#ftl]
/**
 ******************************************************************************
 * @file    lis2dw12_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the LIS2DW12 settings
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
#ifndef __LIS2DW12_SETTINGS_H__
#define __LIS2DW12_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LIS2DW12_ODR_ACC")]
      [#assign ODR_ACC_value = value]
    [/#if]
    [#if name.contains("LIS2DW12_FS_ACC")]
      [#assign FS_ACC_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_ACC_value == "12.5Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 12.5f /* ODR = 12.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "25Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 25.0f /* ODR = 25Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "50Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 50.0f /* ODR = 50Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "100Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "200Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 200.0f /* ODR = 200Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "400Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 400.0f /* ODR = 400Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "800Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 800.0f /* ODR = 800Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "1600Hz"][#-- ####################################### --]
#define LIS2DW12_ACC_ODR 1600.0f /* ODR = 1600Hz */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "2g"][#-- ####################################### --]
#define LIS2DW12_ACC_FS 2 /* FS = 2g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "4g"][#-- ####################################### --]
#define LIS2DW12_ACC_FS 4 /* FS = 4g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "8g"][#-- ####################################### --]
#define LIS2DW12_ACC_FS 8 /* FS = 8g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "16g"][#-- ####################################### --]
#define LIS2DW12_ACC_FS 16 /* FS = 16g */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __LIS2DW12_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
