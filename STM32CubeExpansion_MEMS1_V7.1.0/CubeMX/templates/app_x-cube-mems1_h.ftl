[#ftl]
/**
  ******************************************************************************
  * File Name          : ${name?replace(".","_")?lower_case}.h
  * Description        : This file provides code for the configuration
  *                      of the ${name} instances.
  ******************************************************************************
  *
  * COPYRIGHT ${year} STMicroelectronics
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APP_X_CUBE_MEMS1_H
#define __APP_X_CUBE_MEMS1_H

#ifdef __cplusplus
 extern "C" {
#endif

[#assign useIKS01A3INTENSITYDETECTIONDEMO = false]
[#assign useIKS01A2INTENSITYDETECTIONDEMO = false]
[#assign useCUSTOMINTENSITYDETECTIONDEMO = false]

[#assign useIKS01A3DATALOGFUSIONDEMO = false]
[#assign useIKS01A2DATALOGFUSIONDEMO = false]
[#assign useCUSTOMDATALOGFUSIONDEMO = false]

[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = false]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = false]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = false]

[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = false]

[#assign useIKS01A3TILTSENSINGDEMO = false]
[#assign useIKS01A2TILTSENSINGDEMO = false]
[#assign useCUSTOMTILTSENSINGDEMO = false]

[#assign useIKS01A3VERTICALCONTEXTDEMO = false]
[#assign useIKS01A2VERTICALCONTEXTDEMO = false]
[#assign useCUSTOMVERTICALCONTEXTDEMO = false]

[#assign useIKS01A3CARRYPOSITIONDEMO = false]
[#assign useIKS01A2CARRYPOSITIONDEMO = false]
[#assign useCUSTOMCARRYPOSITIONDEMO = false]

[#assign useIKS01A3ECOMPASSDEMO = false]
[#assign useIKS01A2ECOMPASSDEMO = false]
[#assign useCUSTOMECOMPASSDEMO = false]

[#assign useIKS01A3GESTURERECOGNITIONDEMO = false]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = false]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A3INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A2INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_INTENSITYDETECTION_DEMO")]
[#assign useCUSTOMINTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_DATALOGFUSION_DEMO")]
[#assign useIKS01A3DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_DATALOGFUSION_DEMO")]
[#assign useIKS01A2DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_DATALOGFUSION_DEMO")]
[#assign useCUSTOMDATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GYROSCOPECALIBRATION_DEMO")]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_TILTSENSING_DEMO")]
[#assign useIKS01A3TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A2_TILTSENSING_DEMO")]
[#assign useIKS01A2TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("CUSTOM_TILTSENSING_DEMO")]
[#assign useCUSTOMTILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A3_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A3VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A2VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("CUSTOM_VERTICALCONTEXT_DEMO")]
[#assign useCUSTOMVERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_CARRYPOSITION_DEMO")]
[#assign useIKS01A3CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_CARRYPOSITION_DEMO")]
[#assign useIKS01A2CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_CARRYPOSITION_DEMO")]
[#assign useCUSTOMCARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ECOMPASS_DEMO")]
[#assign useIKS01A3ECOMPASSDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ECOMPASS_DEMO")]
[#assign useIKS01A2ECOMPASSDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ECOMPASS_DEMO")]
[#assign useCUSTOMECOMPASSDEMO = true]
[/#if]

[#if define?contains("IKS01A3_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A3GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GESTURERECOGNITION_DEMO")]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = true]
[/#if]

[/#list]
[/#if]

/* Includes ------------------------------------------------------------------*/
[#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A3DATALOGFUSIONDEMO || useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A3TILTSENSINGDEMO || useIKS01A3VERTICALCONTEXTDEMO || useIKS01A3CARRYPOSITIONDEMO || useIKS01A3ECOMPASSDEMO || useIKS01A3GESTURERECOGNITIONDEMO]
#include "iks01a3_mems_control.h"
#include "iks01a3_mems_control_ex.h"
[/#if]

[#if useIKS01A2INTENSITYDETECTIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useIKS01A2TILTSENSINGDEMO || useIKS01A2VERTICALCONTEXTDEMO || useIKS01A2CARRYPOSITIONDEMO || useIKS01A2ECOMPASSDEMO || useIKS01A2GESTURERECOGNITIONDEMO]
#include "iks01a2_mems_control.h"
#include "iks01a2_mems_control_ex.h"
[/#if]

[#if useCUSTOMINTENSITYDETECTIONDEMO || useCUSTOMDATALOGFUSIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO || useCUSTOMTILTSENSINGDEMO || useCUSTOMVERTICALCONTEXTDEMO || useCUSTOMCARRYPOSITIONDEMO || useCUSTOMECOMPASSDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
#include "custom_mems_control.h"
#include "custom_mems_control_ex.h"
[/#if]

/* Exported defines ----------------------------------------------------------*/
[#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A3DATALOGFUSIONDEMO || useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A3TILTSENSINGDEMO || useIKS01A3VERTICALCONTEXTDEMO || useIKS01A3CARRYPOSITIONDEMO || useIKS01A3ECOMPASSDEMO || useIKS01A3GESTURERECOGNITIONDEMO]
#define BOARD_NAME "IKS01A3"
[/#if]

[#if useIKS01A2INTENSITYDETECTIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useIKS01A2TILTSENSINGDEMO || useIKS01A2VERTICALCONTEXTDEMO || useIKS01A2CARRYPOSITIONDEMO || useIKS01A2ECOMPASSDEMO || useIKS01A2GESTURERECOGNITIONDEMO]
#define BOARD_NAME "IKS01A2"
[/#if]

[#if useCUSTOMINTENSITYDETECTIONDEMO || useCUSTOMDATALOGFUSIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO || useCUSTOMTILTSENSINGDEMO || useCUSTOMVERTICALCONTEXTDEMO || useCUSTOMCARRYPOSITIONDEMO || useCUSTOMECOMPASSDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
#define BOARD_NAME "CUSTOM"
#define USE_CUSTOM_BOARD
[/#if]

/* Exported functions --------------------------------------------------------*/
void ${fctName}(void);
void ${fctProcessName}(void);

[#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO || useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO || useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO || useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO || useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO || useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO || useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO || useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO || useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO || useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
void RTC_DateRegulate(uint8_t y, uint8_t m, uint8_t d, uint8_t dw);
void RTC_TimeRegulate(uint8_t hh, uint8_t mm, uint8_t ss);
void Get_PresentationString(char *PresentationString, uint32_t *Length);
[/#if]

#ifdef __cplusplus
}
#endif

#endif /* __APP_X_CUBE_MEMS1_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
