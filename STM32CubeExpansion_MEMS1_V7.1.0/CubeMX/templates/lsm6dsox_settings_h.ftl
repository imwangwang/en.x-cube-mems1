[#ftl]
/**
 ******************************************************************************
 * @file    lsm6dsox_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the LSM6DSOX settings
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
#ifndef __LSM6DSOX_SETTINGS_H__
#define __LSM6DSOX_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("LSM6DSOX_ODR_ACC")]
      [#assign ODR_ACC_value = value]
    [/#if]
    [#if name.contains("LSM6DSOX_FS_ACC")]
      [#assign FS_ACC_value = value]
    [/#if]
    [#if name.contains("LSM6DSOX_ODR_GYRO")]
      [#assign ODR_GYRO_value = value]
    [/#if]
    [#if name.contains("LSM6DSOX_FS_GYRO")]
      [#assign FS_GYRO_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_ACC_value == "12.5Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 12.5f /* ODR = 12.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "26Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 26.0f /* ODR = 26Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "52Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 52.0f /* ODR = 52Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "104Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 104.0f /* ODR = 104Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "208Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 208.0f /* ODR = 208Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "417Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 417.0f /* ODR = 417Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "833Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 833.0f /* ODR = 833Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "1667Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 1667.0f /* ODR = 1667Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "3333Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 3333.0f /* ODR = 3333Hz */
[/#if][#-- ################################################################# --]

[#if ODR_ACC_value == "6667Hz"][#-- ####################################### --]
#define LSM6DSOX_ACC_ODR 6667.0f /* ODR = 6667Hz */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "2g"][#-- ####################################### --]
#define LSM6DSOX_ACC_FS 2 /* FS = 2g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "4g"][#-- ####################################### --]
#define LSM6DSOX_ACC_FS 4 /* FS = 4g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "8g"][#-- ####################################### --]
#define LSM6DSOX_ACC_FS 8 /* FS = 8g */
[/#if][#-- ################################################################# --]

[#if FS_ACC_value == "16g"][#-- ####################################### --]
#define LSM6DSOX_ACC_FS 16 /* FS = 16g */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "12.5Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 12.5f /* ODR = 12.5Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "26Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 26.0f /* ODR = 26Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "52Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 52.0f /* ODR = 52Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "104Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 104.0f /* ODR = 104Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "208Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 208.0f /* ODR = 208Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "417Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 417.0f /* ODR = 417Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "833Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 833.0f /* ODR = 833Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "1667Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 1667.0f /* ODR = 1667Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "3333Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 3333.0f /* ODR = 3333Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "6667Hz"][#-- ####################################### --]
#define LSM6DSOX_GYRO_ODR 6667.0f /* ODR = 6667Hz */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "125dps"][#-- ####################################### --]
#define LSM6DSOX_GYRO_FS 125 /* FS = 125dps */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "250dps"][#-- ####################################### --]
#define LSM6DSOX_GYRO_FS 250 /* FS = 250dps */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "500dps"][#-- ####################################### --]
#define LSM6DSOX_GYRO_FS 500 /* FS = 500dps */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "1000dps"][#-- ####################################### --]
#define LSM6DSOX_GYRO_FS 1000 /* FS = 1000dps */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "2000dps"][#-- ####################################### --]
#define LSM6DSOX_GYRO_FS 2000 /* FS = 2000dps */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __LSM6DSOX_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
