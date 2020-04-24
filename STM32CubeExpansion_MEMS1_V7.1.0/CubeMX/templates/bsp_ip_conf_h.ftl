[#ftl]
/**
 ******************************************************************************
 * @file    bsp_ip_conf.h
 * @author  MEMS Application Team
 * @brief   BSP IP configuration file
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 *                        opensource.org/licenses/BSD-3-Clause
 *
 ******************************************************************************
 */

[#assign knownTIMInstance = false]
[#assign knownMEMSINT1Instance = false]

[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign TIMInstance = ""]
[#assign MEMSINT1Instance = ""]
[#assign MEMSINT1Name = ""]

[#if BspIpDatas??]
  [#list BspIpDatas as SWIP]
    [#if SWIP.variables??]
      [#list SWIP.variables as variables]
        [#if variables.name?contains("IpInstance")]
          [#assign IpInstance = variables.value]
        [/#if]
        [#if variables.name?contains("IpName")]
          [#assign IpName = variables.value]
        [/#if]
        [#if variables.value?contains("TIMER")]
          [#assign TIMInstance = IpInstance]
          [#assign knownTIMInstance = true]
        [/#if]
        [#if variables.value?contains("MEMS INT1")]
          [#assign MEMSINT1Instance = IpInstance]
          [#assign MEMSINT1Name = IpName]
          [#assign knownMEMSINT1Instance = true]
        [/#if]
      [/#list]
    [/#if]
  [/#list]
[/#if]

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BSP_IP_CONF_H__
#define __BSP_IP_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Exported variables --------------------------------------------------------*/
/* Exported defines ----------------------------------------------------------*/
[#if !knownTIMInstance]
#warning "Timer instance is unknown, please assign the proper timer handle and timer init function"
/*
Example:
extern TIM_HandleTypeDef htim3;
#define BSP_IP_TIM_Handle htim3
#define BSP_IP_TIM_Init MX_TIM3_Init
*/
[/#if]
extern TIM_HandleTypeDef h${TIMInstance?lower_case};
#define BSP_IP_TIM_Handle h${TIMInstance?lower_case}
#define BSP_IP_TIM_Init MX_${TIMInstance}_Init

[#if knownMEMSINT1Instance]
#define BSP_IP_MEMS_INT1_PIN_NUM ${MEMSINT1Instance}
#define BSP_IP_MEMS_INT1_GPIOX ${MEMSINT1Name}
[/#if]

extern RTC_HandleTypeDef hrtc;

#ifdef __cplusplus
}
#endif

#endif /* __BSP_IP_CONF_H__ */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
