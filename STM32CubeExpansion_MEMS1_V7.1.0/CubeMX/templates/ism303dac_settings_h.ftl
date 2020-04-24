[#ftl]
/**
 ******************************************************************************
 * @file    ism303dac_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the ISM303DAC settings
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
#ifndef __ISM303DAC_SETTINGS_H__
#define __ISM303DAC_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("ISM303DAC_ODR_ACC")]
      [#assign ODR_ACC_value = value]
    [/#if]
    [#if name.contains("ISM303DAC_FS_ACC")]
      [#assign FS_ACC_value = value]
    [/#if]
    [#if name.contains("ISM303DAC_ODR_MAG")]
      [#assign ODR_MAG_value = value]
    [/#if]
    [#if name.contains("ISM303DAC_FS_MAG")]
      [#assign FS_MAG_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_ACC_value == "1Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 1.0f /* ODR = 1Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "12.5Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 12.5f /* ODR = 12.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "25Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 25.0f /* ODR = 25Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "50Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 50.0f /* ODR = 50Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "100Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "200Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 200.0f /* ODR = 200Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "400Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 400.0f /* ODR = 400Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "800Hz"][#-- ####################################### --]
#define ISM303DAC_ACC_ODR 800.0f /* ODR = 800Hz */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "2g"][#-- ####################################### --]
#define ISM303DAC_ACC_FS 2 /* FS = 2g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "4g"][#-- ####################################### --]
#define ISM303DAC_ACC_FS 4 /* FS = 4g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "8g"][#-- ####################################### --]
#define ISM303DAC_ACC_FS 8 /* FS = 8g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "16g"][#-- ####################################### --]
#define ISM303DAC_ACC_FS 16 /* FS = 16g */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "10Hz"][#-- ####################################### --]
#define ISM303DAC_MAG_ODR 10.0f /* ODR = 10Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "20Hz"][#-- ####################################### --]
#define ISM303DAC_MAG_ODR 20.0f /* ODR = 20Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "50Hz"][#-- ####################################### --]
#define ISM303DAC_MAG_ODR 50.0f /* ODR = 50Hz */
[/#if][#-- ################################################################# --]

[#if ODR_MAG_value == "100Hz"][#-- ####################################### --]
#define ISM303DAC_MAG_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if FS_MAG_value == "50gauss"][#-- ####################################### --]
#define ISM303DAC_MAG_FS 50 /* FS = 50gauss */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __ISM303DAC_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
