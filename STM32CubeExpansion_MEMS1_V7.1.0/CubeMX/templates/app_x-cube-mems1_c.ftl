[#ftl]
/**
  ******************************************************************************
  * File Name          : ${name?replace(".","_")?lower_case}.c
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

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "app_x-cube-mems1.h"
#include "main.h"
#include <stdio.h>
[#if includes??]
[#list includes as include]
#include "${include}"
[/#list]
[/#if]

[#assign useIKS01A3DATALOGTERMINALDEMO = false]
[#assign useIKS01A3LIS2DW126DORIENTATIONDEMO = false]
[#assign useIKS01A3LIS2DW12SELFTESTDEMO = false]
[#assign useIKS01A3LIS2DW12WAKEUPDEMO = false]
[#assign useIKS01A3LIS2MDLSELFTESTDEMO = false]
[#assign useIKS01A3LPS22HHFIFOMODEDEMO = false]
[#assign useIKS01A3LSM6DSO6DORIENTATIONDEMO = false]
[#assign useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO = false]
[#assign useIKS01A3LSM6DSOFIFOMODEDEMO = false]
[#assign useIKS01A3LSM6DSOFREEFALLDEMO = false]
[#assign useIKS01A3LSM6DSOPEDOMETERDEMO = false]
[#assign useIKS01A3LSM6DSOSELFTESTDEMO = false]
[#assign useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO = false]
[#assign useIKS01A3LSM6DSOTILTDEMO = false]
[#assign useIKS01A3LSM6DSOWAKEUPDEMO = false]
[#assign useIKS01A3STTS751TEMPERATURELIMITDEMO = false]

[#assign useIKS01A3INTENSITYDETECTIONDEMO = false]
[#assign useIKS01A3DATALOGFUSIONDEMO = false]
[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = false]
[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useIKS01A3TILTSENSINGDEMO = false]
[#assign useIKS01A3VERTICALCONTEXTDEMO = false]
[#assign useIKS01A3CARRYPOSITIONDEMO = false]
[#assign useIKS01A3ECOMPASSDEMO = false]
[#assign useIKS01A3GESTURERECOGNITIONDEMO = false]

[#assign useIKS01A2DATALOGTERMINALDEMO = false]
[#assign useIKS01A2LPS22HBFIFOMODEDEMO = false]
[#assign useIKS01A2LSM6DSL6DORIENTATIONDEMO = false]
[#assign useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO = false]
[#assign useIKS01A2LSM6DSLFIFOLOWPOWERDEMO = false]
[#assign useIKS01A2LSM6DSLFIFOMODEDEMO = false]
[#assign useIKS01A2LSM6DSLFREEFALLDEMO = false]
[#assign useIKS01A2LSM6DSLMULTIEVENTDEMO = false]
[#assign useIKS01A2LSM6DSLPEDOMETERDEMO = false]
[#assign useIKS01A2LSM6DSLSELFTESTDEMO = false]
[#assign useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO = false]
[#assign useIKS01A2LSM6DSLTILTDEMO = false]
[#assign useIKS01A2LSM6DSLWAKEUPDEMO = false]

[#assign useIKS01A2INTENSITYDETECTIONDEMO = false]
[#assign useIKS01A2DATALOGFUSIONDEMO = false]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = false]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = false]
[#assign useIKS01A2TILTSENSINGDEMO = false]
[#assign useIKS01A2VERTICALCONTEXTDEMO = false]
[#assign useIKS01A2CARRYPOSITIONDEMO = false]
[#assign useIKS01A2ECOMPASSDEMO = false]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = false]

[#assign useIKS02A1DATALOGTERMINALDEMO = false]
[#assign useDATALOGTERMINALDEMO = false]
[#assign useLPS22HBFIFOMODEDEMO = false]
[#assign useLSM6DSL6DORIENTATIONDEMO = false]
[#assign useLSM6DSLFIFOCONTINUOUSMODEDEMO = false]
[#assign useLSM6DSLFIFOLOWPOWERDEMO = false]
[#assign useLSM6DSLFIFOMODEDEMO = false]
[#assign useLSM6DSLFREEFALLDEMO = false]
[#assign useLSM6DSLMULTIEVENTDEMO = false]
[#assign useLSM6DSLPEDOMETERDEMO = false]
[#assign useLSM6DSLSELFTESTDEMO = false]
[#assign useLSM6DSLSINGLEDOUBLETAPDEMO = false]
[#assign useLSM6DSLTILTDEMO = false]
[#assign useLSM6DSLWAKEUPDEMO = false]
[#assign useLIS2DW126DORIENTATIONDEMO = false]
[#assign useLIS2DW12SELFTESTDEMO = false]
[#assign useLIS2DW12WAKEUPDEMO = false]
[#assign useLIS2MDLSELFTESTDEMO = false]
[#assign useLPS22HHFIFOMODEDEMO = false]
[#assign useLSM6DSO6DORIENTATIONDEMO = false]
[#assign useLSM6DSOFIFOCONTINUOUSMODEDEMO = false]
[#assign useLSM6DSOFIFOMODEDEMO = false]
[#assign useLSM6DSOFREEFALLDEMO = false]
[#assign useLSM6DSOPEDOMETERDEMO = false]
[#assign useLSM6DSOSELFTESTDEMO = false]
[#assign useLSM6DSOSINGLEDOUBLETAPDEMO = false]
[#assign useLSM6DSOTILTDEMO = false]
[#assign useLSM6DSOWAKEUPDEMO = false]
[#assign useSTTS751TEMPERATURELIMITDEMO = false]

[#assign useCUSTOMINTENSITYDETECTIONDEMO = false]
[#assign useCUSTOMDATALOGFUSIONDEMO = false]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = false]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = false]
[#assign useCUSTOMTILTSENSINGDEMO = false]
[#assign useCUSTOMVERTICALCONTEXTDEMO = false]
[#assign useCUSTOMCARRYPOSITIONDEMO = false]
[#assign useCUSTOMECOMPASSDEMO = false]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("IKS01A3_DATALOGTERMINAL_DEMO")]
[#assign useIKS01A3DATALOGTERMINALDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LIS2DW12_6DORIENTATION_DEMO")]
[#assign useIKS01A3LIS2DW126DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LIS2DW12_SELFTEST_DEMO")]
[#assign useIKS01A3LIS2DW12SELFTESTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LIS2DW12_WAKEUP_DEMO")]
[#assign useIKS01A3LIS2DW12WAKEUPDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LIS2MDL_SELFTEST_DEMO")]
[#assign useIKS01A3LIS2MDLSELFTESTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LPS22HH_FIFOMODE_DEMO")]
[#assign useIKS01A3LPS22HHFIFOMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_6DORIENTATION_DEMO")]
[#assign useIKS01A3LSM6DSO6DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_FIFOCONTINUOUSMODE_DEMO")]
[#assign useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_FIFOMODE_DEMO")]
[#assign useIKS01A3LSM6DSOFIFOMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_FREEFALL_DEMO")]
[#assign useIKS01A3LSM6DSOFREEFALLDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_PEDOMETER_DEMO")]
[#assign useIKS01A3LSM6DSOPEDOMETERDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_SELFTEST_DEMO")]
[#assign useIKS01A3LSM6DSOSELFTESTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_SINGLEDOUBLETAP_DEMO")]
[#assign useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_TILT_DEMO")]
[#assign useIKS01A3LSM6DSOTILTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_LSM6DSO_WAKEUP_DEMO")]
[#assign useIKS01A3LSM6DSOWAKEUPDEMO = true]
[/#if]

[#if define?contains("IKS01A3_STTS751_TEMPERATURELIMIT_DEMO")]
[#assign useIKS01A3STTS751TEMPERATURELIMITDEMO = true]
[/#if]

[#if define?contains("IKS01A3_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A3INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_DATALOGFUSION_DEMO")]
[#assign useIKS01A3DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A3GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A3ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A3MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_TILTSENSING_DEMO")]
[#assign useIKS01A3TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A3_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A3VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A3_CARRYPOSITION_DEMO")]
[#assign useIKS01A3CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A3_ECOMPASS_DEMO")]
[#assign useIKS01A3ECOMPASSDEMO = true]
[/#if]

[#if define?contains("IKS01A3_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A3GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_DATALOGTERMINAL_DEMO")]
[#assign useIKS01A2DATALOGTERMINALDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LPS22HB_FIFOMODE_DEMO")]
[#assign useIKS01A2LPS22HBFIFOMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_6DORIENTATION_DEMO")]
[#assign useIKS01A2LSM6DSL6DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_FIFOCONTINUOUSMODE_DEMO")]
[#assign useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_FIFOLOWPOWER_DEMO")]
[#assign useIKS01A2LSM6DSLFIFOLOWPOWERDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_FIFOMODE_DEMO")]
[#assign useIKS01A2LSM6DSLFIFOMODEDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_FREEFALL_DEMO")]
[#assign useIKS01A2LSM6DSLFREEFALLDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_MULTIEVENT_DEMO")]
[#assign useIKS01A2LSM6DSLMULTIEVENTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_PEDOMETER_DEMO")]
[#assign useIKS01A2LSM6DSLPEDOMETERDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_SELFTEST_DEMO")]
[#assign useIKS01A2LSM6DSLSELFTESTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_SINGLEDOUBLETAP_DEMO")]
[#assign useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_TILT_DEMO")]
[#assign useIKS01A2LSM6DSLTILTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_LSM6DSL_WAKEUP_DEMO")]
[#assign useIKS01A2LSM6DSLWAKEUPDEMO = true]
[/#if]

[#if define?contains("IKS01A2_INTENSITYDETECTION_DEMO")]
[#assign useIKS01A2INTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_DATALOGFUSION_DEMO")]
[#assign useIKS01A2DATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GYROSCOPECALIBRATION_DEMO")]
[#assign useIKS01A2GYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useIKS01A2ACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useIKS01A2MAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_TILTSENSING_DEMO")]
[#assign useIKS01A2TILTSENSINGDEMO = true]
[/#if]

[#if define?contains("IKS01A2_VERTICALCONTEXT_DEMO")]
[#assign useIKS01A2VERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("IKS01A2_CARRYPOSITION_DEMO")]
[#assign useIKS01A2CARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("IKS01A2_ECOMPASS_DEMO")]
[#assign useIKS01A2ECOMPASSDEMO = true]
[/#if]

[#if define?contains("IKS01A2_GESTURERECOGNITION_DEMO")]
[#assign useIKS01A2GESTURERECOGNITIONDEMO = true]
[/#if]

[#if define?contains("IKS02A1_DATALOGTERMINAL_DEMO")]
[#assign useIKS02A1DATALOGTERMINALDEMO = true]
[/#if]

[#if define?contains("GENERIC_DATALOGTERMINAL_DEMO")]
[#assign useDATALOGTERMINALDEMO = true]
[/#if]

[#if define?contains("GENERIC_LPS22HB_FIFOMODE_DEMO")]
[#assign useLPS22HBFIFOMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_6DORIENTATION_DEMO")]
[#assign useLSM6DSL6DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_FIFOCONTINUOUSMODE_DEMO")]
[#assign useLSM6DSLFIFOCONTINUOUSMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_FIFOLOWPOWER_DEMO")]
[#assign useLSM6DSLFIFOLOWPOWERDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_FIFOMODE_DEMO")]
[#assign useLSM6DSLFIFOMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_FREEFALL_DEMO")]
[#assign useLSM6DSLFREEFALLDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_MULTIEVENT_DEMO")]
[#assign useLSM6DSLMULTIEVENTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_PEDOMETER_DEMO")]
[#assign useLSM6DSLPEDOMETERDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_SELFTEST_DEMO")]
[#assign useLSM6DSLSELFTESTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_SINGLEDOUBLETAP_DEMO")]
[#assign useLSM6DSLSINGLEDOUBLETAPDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_TILT_DEMO")]
[#assign useLSM6DSLTILTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSL_WAKEUP_DEMO")]
[#assign useLSM6DSLWAKEUPDEMO = true]
[/#if]

[#if define?contains("GENERIC_LIS2DW12_6DORIENTATION_DEMO")]
[#assign useLIS2DW126DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("GENERIC_LIS2DW12_SELFTEST_DEMO")]
[#assign useLIS2DW12SELFTESTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LIS2DW12_WAKEUP_DEMO")]
[#assign useLIS2DW12WAKEUPDEMO = true]
[/#if]

[#if define?contains("GENERIC_LIS2MDL_SELFTEST_DEMO")]
[#assign useLIS2MDLSELFTESTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LPS22HH_FIFOMODE_DEMO")]
[#assign useLPS22HHFIFOMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_6DORIENTATION_DEMO")]
[#assign useLSM6DSO6DORIENTATIONDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_FIFOCONTINUOUSMODE_DEMO")]
[#assign useLSM6DSOFIFOCONTINUOUSMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_FIFOMODE_DEMO")]
[#assign useLSM6DSOFIFOMODEDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_FREEFALL_DEMO")]
[#assign useLSM6DSOFREEFALLDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_PEDOMETER_DEMO")]
[#assign useLSM6DSOPEDOMETERDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_SELFTEST_DEMO")]
[#assign useLSM6DSOSELFTESTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_SINGLEDOUBLETAP_DEMO")]
[#assign useLSM6DSOSINGLEDOUBLETAPDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_TILT_DEMO")]
[#assign useLSM6DSOTILTDEMO = true]
[/#if]

[#if define?contains("GENERIC_LSM6DSO_WAKEUP_DEMO")]
[#assign useLSM6DSOWAKEUPDEMO = true]
[/#if]

[#if define?contains("GENERIC_STTS751_TEMPERATURELIMIT_DEMO")]
[#assign useSTTS751TEMPERATURELIMITDEMO = true]
[/#if]

[#if define?contains("CUSTOM_INTENSITYDETECTION_DEMO")]
[#assign useCUSTOMINTENSITYDETECTIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_DATALOGFUSION_DEMO")]
[#assign useCUSTOMDATALOGFUSIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GYROSCOPECALIBRATION_DEMO")]
[#assign useCUSTOMGYROSCOPECALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ACCELEROMETERCALIBRATION_DEMO")]
[#assign useCUSTOMACCELEROMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_MAGNETOMETERCALIBRATION_DEMO")]
[#assign useCUSTOMMAGNETOMETERCALIBRATIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_TILTSENSING_DEMO")]
[#assign useCUSTOMTILTSENSINGDEMO = true]
[/#if]

[#if define?contains("CUSTOM_VERTICALCONTEXT_DEMO")]
[#assign useCUSTOMVERTICALCONTEXTDEMO = true]
[/#if]

[#if define?contains("CUSTOM_CARRYPOSITION_DEMO")]
[#assign useCUSTOMCARRYPOSITIONDEMO = true]
[/#if]

[#if define?contains("CUSTOM_ECOMPASS_DEMO")]
[#assign useCUSTOMECOMPASSDEMO = true]
[/#if]

[#if define?contains("CUSTOM_GESTURERECOGNITION_DEMO")]
[#assign useCUSTOMGESTURERECOGNITIONDEMO = true]
[/#if]

[/#list]
[/#if]

[#if useIKS01A3DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_datalogterminal_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW126DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW12SELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_selftest_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW12WAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_wakeup_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LIS2MDLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2mdl_selftest_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LPS22HHFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lps22hh_fifomode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSO6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifocontinuousmode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifomode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_freefall_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_pedometer_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_selftest_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_singledoubletap_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_tilt_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_wakeup_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3STTS751TEMPERATURELIMITDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_stts751_temperaturelimit_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_datalogterminal_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LPS22HBFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lps22hb_fifomode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSL6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifocontinuousmode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOLOWPOWERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifolowpower_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifomode_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_freefall_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLMULTIEVENTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_multievent_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_pedometer_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_selftest_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_singledoubletap_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_tilt_demo_gv.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_wakeup_demo_gv.tmp"/]
[/#if]

[#if useIKS02A1DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks02a1_datalogterminal_demo_gv.tmp"/]
[/#if]

[#if useDATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/datalogterminal_demo_gv.tmp"/]
[/#if]

[#if useLPS22HBFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lps22hb_fifomode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSL6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifocontinuousmode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLFIFOLOWPOWERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifolowpower_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifomode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_freefall_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLMULTIEVENTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_multievent_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_pedometer_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_selftest_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_singledoubletap_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_tilt_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSLWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_wakeup_demo_gv.tmp"/]
[/#if]

[#if useLIS2DW126DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useLIS2DW12SELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_selftest_demo_gv.tmp"/]
[/#if]

[#if useLIS2DW12WAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_wakeup_demo_gv.tmp"/]
[/#if]

[#if useLIS2MDLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2mdl_selftest_demo_gv.tmp"/]
[/#if]

[#if useLPS22HHFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lps22hh_fifomode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSO6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_6dorientation_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_fifocontinuousmode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_fifomode_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_freefall_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_pedometer_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_selftest_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_singledoubletap_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_tilt_demo_gv.tmp"/]
[/#if]

[#if useLSM6DSOWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_wakeup_demo_gv.tmp"/]
[/#if]

[#if useSTTS751TEMPERATURELIMITDEMO]
[@common.optinclude name=mxTmpFolder + "/stts751_temperaturelimit_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_intensitydetection_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_datalogfusion_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_gyroscopecalibration_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_accelerometercalibration_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_magnetometercalibration_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO]
[@common.optinclude name=mxTmpFolder + "/app_tiltsensing_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO]
[@common.optinclude name=mxTmpFolder + "/app_verticalcontext_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_carryposition_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO]
[@common.optinclude name=mxTmpFolder + "/app_ecompass_demo_gv.tmp"/]
[/#if]

[#if useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_gesturerecognition_demo_gv.tmp"/]
[/#if]

void ${fctName}(void)
{
  /* USER CODE BEGIN SV */

  /* USER CODE END SV */

  /* USER CODE BEGIN ${fctName?replace("MX_","")}_PreTreatment */

  /* USER CODE END ${fctName?replace("MX_","")}_PreTreatment */

  /* Initialize the peripherals and the MEMS components */
  [#if useIKS01A3DATALOGTERMINALDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_datalogterminal_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LIS2DW126DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LIS2DW12SELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_selftest_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LIS2DW12WAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LIS2MDLSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lis2mdl_selftest_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LPS22HHFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lps22hh_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSO6DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifocontinuousmode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOFREEFALLDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_freefall_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOPEDOMETERDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_pedometer_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_selftest_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_singledoubletap_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOTILTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_tilt_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3LSM6DSOWAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3STTS751TEMPERATURELIMITDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a3_stts751_temperaturelimit_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2DATALOGTERMINALDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_datalogterminal_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LPS22HBFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lps22hb_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSL6DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifocontinuousmode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOLOWPOWERDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifolowpower_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLFREEFALLDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_freefall_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLMULTIEVENTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_multievent_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLPEDOMETERDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_pedometer_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_selftest_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_singledoubletap_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLTILTDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_tilt_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A2LSM6DSLWAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useIKS02A1DATALOGTERMINALDEMO]
  [@common.optinclude name=mxTmpFolder + "/iks02a1_datalogterminal_demo_init.tmp"/]
  [/#if]

  [#if useDATALOGTERMINALDEMO]
  [@common.optinclude name=mxTmpFolder + "/datalogterminal_demo_init.tmp"/]
  [/#if]

  [#if useLPS22HBFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lps22hb_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSL6DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLFIFOCONTINUOUSMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifocontinuousmode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLFIFOLOWPOWERDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifolowpower_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLFREEFALLDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_freefall_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLMULTIEVENTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_multievent_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLPEDOMETERDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_pedometer_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_selftest_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLSINGLEDOUBLETAPDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_singledoubletap_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLTILTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_tilt_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSLWAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dsl_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useLIS2DW126DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/lis2dw12_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useLIS2DW12SELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lis2dw12_selftest_demo_init.tmp"/]
  [/#if]

  [#if useLIS2DW12WAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/lis2dw12_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useLIS2MDLSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lis2mdl_selftest_demo_init.tmp"/]
  [/#if]

  [#if useLPS22HHFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lps22hh_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSO6DORIENTATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_6dorientation_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOFIFOCONTINUOUSMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_fifocontinuousmode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOFIFOMODEDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_fifomode_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOFREEFALLDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_freefall_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOPEDOMETERDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_pedometer_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOSELFTESTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_selftest_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOSINGLEDOUBLETAPDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_singledoubletap_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOTILTDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_tilt_demo_init.tmp"/]
  [/#if]

  [#if useLSM6DSOWAKEUPDEMO]
  [@common.optinclude name=mxTmpFolder + "/lsm6dso_wakeup_demo_init.tmp"/]
  [/#if]

  [#if useSTTS751TEMPERATURELIMITDEMO]
  [@common.optinclude name=mxTmpFolder + "/stts751_temperaturelimit_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_intensitydetection_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_datalogfusion_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_gyroscopecalibration_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_accelerometercalibration_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_magnetometercalibration_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_tiltsensing_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_verticalcontext_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_carryposition_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_ecompass_demo_init.tmp"/]
  [/#if]

  [#if useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
  [@common.optinclude name=mxTmpFolder + "/app_gesturerecognition_demo_init.tmp"/]
  [/#if]

  /* USER CODE BEGIN ${fctName?replace("MX_","")}_PostTreatment */

  /* USER CODE END ${fctName?replace("MX_","")}_PostTreatment */
}

/*
 * LM background task
 */
void ${fctProcessName}(void)
{
  /* USER CODE BEGIN ${fctProcessName?replace("MX_","")}_PreTreatment */

  /* USER CODE END ${fctProcessName?replace("MX_","")}_PreTreatment */

  [#if useIKS01A3DATALOGTERMINALDEMO]
  MX_IKS01A3_DataLogTerminal_Process();
  [/#if]

  [#if useIKS01A3LIS2DW126DORIENTATIONDEMO]
  MX_IKS01A3_LIS2DW12_6DOrientation_Process();
  [/#if]

  [#if useIKS01A3LIS2DW12SELFTESTDEMO]
  MX_IKS01A3_LIS2DW12_SelfTest_Process();
  [/#if]

  [#if useIKS01A3LIS2DW12WAKEUPDEMO]
  MX_IKS01A3_LIS2DW12_WakeUp_Process();
  [/#if]

  [#if useIKS01A3LIS2MDLSELFTESTDEMO]
  MX_IKS01A3_LIS2MDL_SelfTest_Process();
  [/#if]

  [#if useIKS01A3LPS22HHFIFOMODEDEMO]
  MX_IKS01A3_LPS22HH_FIFOMode_Process();
  [/#if]

  [#if useIKS01A3LSM6DSO6DORIENTATIONDEMO]
  MX_IKS01A3_LSM6DSO_6DOrientation_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO]
  MX_IKS01A3_LSM6DSO_FIFOContinuousMode_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOFIFOMODEDEMO]
  MX_IKS01A3_LSM6DSO_FIFOMode_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOFREEFALLDEMO]
  MX_IKS01A3_LSM6DSO_FreeFall_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOPEDOMETERDEMO]
  MX_IKS01A3_LSM6DSO_Pedometer_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOSELFTESTDEMO]
  MX_IKS01A3_LSM6DSO_SelfTest_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO]
  MX_IKS01A3_LSM6DSO_SingleDoubleTap_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOTILTDEMO]
  MX_IKS01A3_LSM6DSO_Tilt_Process();
  [/#if]

  [#if useIKS01A3LSM6DSOWAKEUPDEMO]
  MX_IKS01A3_LSM6DSO_WakeUp_Process();
  [/#if]

  [#if useIKS01A3STTS751TEMPERATURELIMITDEMO]
  MX_IKS01A3_STTS751_TemperatureLimit_Process();
  [/#if]

  [#if useIKS01A2DATALOGTERMINALDEMO]
  MX_IKS01A2_DataLogTerminal_Process();
  [/#if]

  [#if useIKS01A2LPS22HBFIFOMODEDEMO]
  MX_IKS01A2_LPS22HB_FIFOMode_Process();
  [/#if]

  [#if useIKS01A2LSM6DSL6DORIENTATIONDEMO]
  MX_IKS01A2_LSM6DSL_6DOrientation_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO]
  MX_IKS01A2_LSM6DSL_FIFOContinuousMode_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOLOWPOWERDEMO]
  MX_IKS01A2_LSM6DSL_FIFOLowPower_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLFIFOMODEDEMO]
  MX_IKS01A2_LSM6DSL_FIFOMode_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLFREEFALLDEMO]
  MX_IKS01A2_LSM6DSL_FreeFall_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLMULTIEVENTDEMO]
  MX_IKS01A2_LSM6DSL_MultiEvent_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLPEDOMETERDEMO]
  MX_IKS01A2_LSM6DSL_Pedometer_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLSELFTESTDEMO]
  MX_IKS01A2_LSM6DSL_SelfTest_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO]
  MX_IKS01A2_LSM6DSL_SingleDoubleTap_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLTILTDEMO]
  MX_IKS01A2_LSM6DSL_Tilt_Process();
  [/#if]

  [#if useIKS01A2LSM6DSLWAKEUPDEMO]
  MX_IKS01A2_LSM6DSL_WakeUp_Process();
  [/#if]

  [#if useIKS02A1DATALOGTERMINALDEMO]
  MX_IKS02A1_DataLogTerminal_Process();
  [/#if]

  [#if useDATALOGTERMINALDEMO]
  MX_DataLogTerminal_Process();
  [/#if]

  [#if useLPS22HBFIFOMODEDEMO]
  MX_LPS22HB_FIFOMode_Process();
  [/#if]

  [#if useLSM6DSL6DORIENTATIONDEMO]
  MX_LSM6DSL_6DOrientation_Process();
  [/#if]

  [#if useLSM6DSLFIFOCONTINUOUSMODEDEMO]
  MX_LSM6DSL_FIFOContinuousMode_Process();
  [/#if]

  [#if useLSM6DSLFIFOLOWPOWERDEMO]
  MX_LSM6DSL_FIFOLowPower_Process();
  [/#if]

  [#if useLSM6DSLFIFOMODEDEMO]
  MX_LSM6DSL_FIFOMode_Process();
  [/#if]

  [#if useLSM6DSLFREEFALLDEMO]
  MX_LSM6DSL_FreeFall_Process();
  [/#if]

  [#if useLSM6DSLMULTIEVENTDEMO]
  MX_LSM6DSL_MultiEvent_Process();
  [/#if]

  [#if useLSM6DSLPEDOMETERDEMO]
  MX_LSM6DSL_Pedometer_Process();
  [/#if]

  [#if useLSM6DSLSELFTESTDEMO]
  MX_LSM6DSL_SelfTest_Process();
  [/#if]

  [#if useLSM6DSLSINGLEDOUBLETAPDEMO]
  MX_LSM6DSL_SingleDoubleTap_Process();
  [/#if]

  [#if useLSM6DSLTILTDEMO]
  MX_LSM6DSL_Tilt_Process();
  [/#if]

  [#if useLSM6DSLWAKEUPDEMO]
  MX_LSM6DSL_WakeUp_Process();
  [/#if]

  [#if useLIS2DW126DORIENTATIONDEMO]
  MX_LIS2DW12_6DOrientation_Process();
  [/#if]

  [#if useLIS2DW12SELFTESTDEMO]
  MX_LIS2DW12_SelfTest_Process();
  [/#if]

  [#if useLIS2DW12WAKEUPDEMO]
  MX_LIS2DW12_WakeUp_Process();
  [/#if]

  [#if useLIS2MDLSELFTESTDEMO]
  MX_LIS2MDL_SelfTest_Process();
  [/#if]

  [#if useLPS22HHFIFOMODEDEMO]
  MX_LPS22HH_FIFOMode_Process();
  [/#if]

  [#if useLSM6DSO6DORIENTATIONDEMO]
  MX_LSM6DSO_6DOrientation_Process();
  [/#if]

  [#if useLSM6DSOFIFOCONTINUOUSMODEDEMO]
  MX_LSM6DSO_FIFOContinuousMode_Process();
  [/#if]

  [#if useLSM6DSOFIFOMODEDEMO]
  MX_LSM6DSO_FIFOMode_Process();
  [/#if]

  [#if useLSM6DSOFREEFALLDEMO]
  MX_LSM6DSO_FreeFall_Process();
  [/#if]

  [#if useLSM6DSOPEDOMETERDEMO]
  MX_LSM6DSO_Pedometer_Process();
  [/#if]

  [#if useLSM6DSOSELFTESTDEMO]
  MX_LSM6DSO_SelfTest_Process();
  [/#if]

  [#if useLSM6DSOSINGLEDOUBLETAPDEMO]
  MX_LSM6DSO_SingleDoubleTap_Process();
  [/#if]

  [#if useLSM6DSOTILTDEMO]
  MX_LSM6DSO_Tilt_Process();
  [/#if]

  [#if useLSM6DSOWAKEUPDEMO]
  MX_LSM6DSO_WakeUp_Process();
  [/#if]

  [#if useSTTS751TEMPERATURELIMITDEMO]
  MX_STTS751_TemperatureLimit_Process();
  [/#if]

  [#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO]
  MX_IntensityDetection_Process();
  [/#if]

  [#if useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO]
  MX_DataLogFusion_Process();
  [/#if]

  [#if useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO]
  MX_GyroscopeCalibration_Process();
  [/#if]

  [#if useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO]
  MX_AccelerometerCalibration_Process();
  [/#if]

  [#if useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO]
  MX_MagnetometerCalibration_Process();
  [/#if]

  [#if useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO]
  MX_TiltSensing_Process();
  [/#if]

  [#if useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO]
  MX_VerticalContext_Process();
  [/#if]

  [#if useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO]
  MX_CarryPosition_Process();
  [/#if]

  [#if useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO]
  MX_ECompass_Process();
  [/#if]

  [#if useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
  MX_GestureRecognition_Process();
  [/#if]

  /* USER CODE BEGIN ${fctProcessName?replace("MX_","")}_PostTreatment */

  /* USER CODE END ${fctProcessName?replace("MX_","")}_PostTreatment */
}

[#if useIKS01A3DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_datalogterminal_demo.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW126DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_6dorientation_demo.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW12SELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_selftest_demo.tmp"/]
[/#if]

[#if useIKS01A3LIS2DW12WAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2dw12_wakeup_demo.tmp"/]
[/#if]

[#if useIKS01A3LIS2MDLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lis2mdl_selftest_demo.tmp"/]
[/#if]

[#if useIKS01A3LPS22HHFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lps22hh_fifomode_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSO6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_6dorientation_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifocontinuousmode_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_fifomode_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_freefall_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_pedometer_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_selftest_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_singledoubletap_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_tilt_demo.tmp"/]
[/#if]

[#if useIKS01A3LSM6DSOWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_lsm6dso_wakeup_demo.tmp"/]
[/#if]

[#if useIKS01A3STTS751TEMPERATURELIMITDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a3_stts751_temperaturelimit_demo.tmp"/]
[/#if]

[#if useIKS01A2DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_datalogterminal_demo.tmp"/]
[/#if]

[#if useIKS01A2LPS22HBFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lps22hb_fifomode_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSL6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_6dorientation_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifocontinuousmode_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOLOWPOWERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifolowpower_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_fifomode_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_freefall_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLMULTIEVENTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_multievent_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_pedometer_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_selftest_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_singledoubletap_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_tilt_demo.tmp"/]
[/#if]

[#if useIKS01A2LSM6DSLWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/iks01a2_lsm6dsl_wakeup_demo.tmp"/]
[/#if]

[#if useIKS02A1DATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/iks02a1_datalogterminal_demo.tmp"/]
[/#if]

[#if useDATALOGTERMINALDEMO]
[@common.optinclude name=mxTmpFolder + "/datalogterminal_demo.tmp"/]
[/#if]

[#if useLPS22HBFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lps22hb_fifomode_demo.tmp"/]
[/#if]

[#if useLSM6DSL6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_6dorientation_demo.tmp"/]
[/#if]

[#if useLSM6DSLFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifocontinuousmode_demo.tmp"/]
[/#if]

[#if useLSM6DSLFIFOLOWPOWERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifolowpower_demo.tmp"/]
[/#if]

[#if useLSM6DSLFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_fifomode_demo.tmp"/]
[/#if]

[#if useLSM6DSLFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_freefall_demo.tmp"/]
[/#if]

[#if useLSM6DSLMULTIEVENTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_multievent_demo.tmp"/]
[/#if]

[#if useLSM6DSLPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_pedometer_demo.tmp"/]
[/#if]

[#if useLSM6DSLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_selftest_demo.tmp"/]
[/#if]

[#if useLSM6DSLSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_singledoubletap_demo.tmp"/]
[/#if]

[#if useLSM6DSLTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_tilt_demo.tmp"/]
[/#if]

[#if useLSM6DSLWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dsl_wakeup_demo.tmp"/]
[/#if]

[#if useLIS2DW126DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_6dorientation_demo.tmp"/]
[/#if]

[#if useLIS2DW12SELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_selftest_demo.tmp"/]
[/#if]

[#if useLIS2DW12WAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2dw12_wakeup_demo.tmp"/]
[/#if]

[#if useLIS2MDLSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lis2mdl_selftest_demo.tmp"/]
[/#if]

[#if useLPS22HHFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lps22hh_fifomode_demo.tmp"/]
[/#if]

[#if useLSM6DSO6DORIENTATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_6dorientation_demo.tmp"/]
[/#if]

[#if useLSM6DSOFIFOCONTINUOUSMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_fifocontinuousmode_demo.tmp"/]
[/#if]

[#if useLSM6DSOFIFOMODEDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_fifomode_demo.tmp"/]
[/#if]

[#if useLSM6DSOFREEFALLDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_freefall_demo.tmp"/]
[/#if]

[#if useLSM6DSOPEDOMETERDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_pedometer_demo.tmp"/]
[/#if]

[#if useLSM6DSOSELFTESTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_selftest_demo.tmp"/]
[/#if]

[#if useLSM6DSOSINGLEDOUBLETAPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_singledoubletap_demo.tmp"/]
[/#if]

[#if useLSM6DSOTILTDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_tilt_demo.tmp"/]
[/#if]

[#if useLSM6DSOWAKEUPDEMO]
[@common.optinclude name=mxTmpFolder + "/lsm6dso_wakeup_demo.tmp"/]
[/#if]

[#if useSTTS751TEMPERATURELIMITDEMO]
[@common.optinclude name=mxTmpFolder + "/stts751_temperaturelimit_demo.tmp"/]
[/#if]

[#if useIKS01A3INTENSITYDETECTIONDEMO || useIKS01A2INTENSITYDETECTIONDEMO || useCUSTOMINTENSITYDETECTIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_intensitydetection_demo.tmp"/]
[/#if]

[#if useIKS01A3DATALOGFUSIONDEMO || useIKS01A2DATALOGFUSIONDEMO || useCUSTOMDATALOGFUSIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_datalogfusion_demo.tmp"/]
[/#if]

[#if useIKS01A3GYROSCOPECALIBRATIONDEMO || useIKS01A2GYROSCOPECALIBRATIONDEMO || useCUSTOMGYROSCOPECALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_gyroscopecalibration_demo.tmp"/]
[/#if]

[#if useIKS01A3ACCELEROMETERCALIBRATIONDEMO || useIKS01A2ACCELEROMETERCALIBRATIONDEMO || useCUSTOMACCELEROMETERCALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_accelerometercalibration_demo.tmp"/]
[/#if]

[#if useIKS01A3MAGNETOMETERCALIBRATIONDEMO || useIKS01A2MAGNETOMETERCALIBRATIONDEMO || useCUSTOMMAGNETOMETERCALIBRATIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_magnetometercalibration_demo.tmp"/]
[/#if]

[#if useIKS01A3TILTSENSINGDEMO || useIKS01A2TILTSENSINGDEMO || useCUSTOMTILTSENSINGDEMO]
[@common.optinclude name=mxTmpFolder + "/app_tiltsensing_demo.tmp"/]
[/#if]

[#if useIKS01A3VERTICALCONTEXTDEMO || useIKS01A2VERTICALCONTEXTDEMO || useCUSTOMVERTICALCONTEXTDEMO]
[@common.optinclude name=mxTmpFolder + "/app_verticalcontext_demo.tmp"/]
[/#if]

[#if useIKS01A3CARRYPOSITIONDEMO || useIKS01A2CARRYPOSITIONDEMO || useCUSTOMCARRYPOSITIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_carryposition_demo.tmp"/]
[/#if]

[#if useIKS01A3ECOMPASSDEMO || useIKS01A2ECOMPASSDEMO || useCUSTOMECOMPASSDEMO]
[@common.optinclude name=mxTmpFolder + "/app_ecompass_demo.tmp"/]
[/#if]

[#if useIKS01A3GESTURERECOGNITIONDEMO || useIKS01A2GESTURERECOGNITIONDEMO || useCUSTOMGESTURERECOGNITIONDEMO]
[@common.optinclude name=mxTmpFolder + "/app_gesturerecognition_demo.tmp"/]
[/#if]

#ifdef __cplusplus
}
#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
