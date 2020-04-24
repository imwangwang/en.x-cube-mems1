[#ftl]
/**
 ******************************************************************************
 * @file    a3g4250d_settings.h
 * @author  MEMS Application Team
 * @brief   This file contains definitions for the A3G4250D settings
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
#ifndef __A3G4250D_SETTINGS_H__
#define __A3G4250D_SETTINGS_H__

#ifdef __cplusplus
extern "C" {
#endif

[#compress]

[#list SWIPdatas as SWIP]
[#if SWIP.defines??]
  [#list SWIP.defines as definition]
    [#assign value = definition.value]
    [#assign name = definition.name]

    [#if name.contains("A3G4250D_ODR_GYRO")]
      [#assign ODR_GYRO_value = value]
    [/#if]
    [#if name.contains("A3G4250D_FS_GYRO")]
      [#assign FS_GYRO_value = value]
    [/#if]

  [/#list]
[/#if]
[/#list]
[/#compress]

[#if ODR_GYRO_value == "100Hz"][#-- ####################################### --]
#define A3G4250D_GYRO_ODR 100.0f /* ODR = 100Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "200Hz"][#-- ####################################### --]
#define A3G4250D_GYRO_ODR 200.0f /* ODR = 200Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "400Hz"][#-- ####################################### --]
#define A3G4250D_GYRO_ODR 400.0f /* ODR = 400Hz */
[/#if][#-- ################################################################# --]

[#if ODR_GYRO_value == "800Hz"][#-- ####################################### --]
#define A3G4250D_GYRO_ODR 800.0f /* ODR = 800Hz */
[/#if][#-- ################################################################# --]

[#if FS_GYRO_value == "245dps"][#-- ####################################### --]
#define A3G4250D_GYRO_FS 245 /* FS = 245dps */
[/#if][#-- ################################################################# --]

#ifdef __cplusplus
}
#endif

#endif /* __A3G4250D_SETTINGS_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
