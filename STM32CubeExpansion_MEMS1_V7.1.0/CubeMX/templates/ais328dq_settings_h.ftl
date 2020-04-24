[#ftl]
/**
 ******************************************************************************
 * @file    ais328dq_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the AIS328DQ settings
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
#ifndef __AIS328DQ_SETTINGS_H__
#define __AIS328DQ_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("AIS328DQ_ODR_ACC")]
      [#assign ODR_ACC_value = value]
    [/#if]
    [#if name.contains("AIS328DQ_FS_ACC")]
      [#assign FS_ACC_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_ACC_value == "0.5Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 0.5f /* ODR = 0.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "1Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 1.0f /* ODR = 1Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "2Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 2.0f /* ODR = 2Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "5Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 5.0f /* ODR = 5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "10Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 10.0f /* ODR = 10Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "50Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 50.0f /* ODR = 50Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "100Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "400Hz"][#-- ####################################### --]
#define AIS328DQ_ACC_ODR 400.0f /* ODR = 400Hz */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "2g"][#-- ####################################### --]
#define AIS328DQ_ACC_FS 2 /* FS = 2g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "4g"][#-- ####################################### --]
#define AIS328DQ_ACC_FS 4 /* FS = 4g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "8g"][#-- ####################################### --]
#define AIS328DQ_ACC_FS 8 /* FS = 8g */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __AIS328DQ_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
