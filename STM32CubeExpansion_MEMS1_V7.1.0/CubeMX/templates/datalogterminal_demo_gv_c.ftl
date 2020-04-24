[#ftl]

[#assign useBSPMotion = false]
[#assign useBSPEnv = false]
[#assign useLSM6DSL = false]
[#assign useLSM303AGR = false]
[#assign useLIS3MDL = false]
[#assign useHTS221 = false]
[#assign useLPS22HB = false]
[#assign useLSM6DSO = false]
[#assign useLIS2DW12 = false]
[#assign useLIS2MDL = false]
[#assign useLPS22HH = false]
[#assign useSTTS751 = false]
[#assign useLSM6DSOX = false]
[#assign useLPS33HW = false]
[#assign useLIS2DH12 = false]
[#assign useASM330LHH = false]
[#assign useISM330DLC = false]
[#assign useISM303DAC = false]
[#assign useIIS2DLPC = false]
[#assign useIIS2MDC = false]
[#assign useISM330DHCX = false]
[#assign useLSM6DSR = false]
[#assign useAIS2DW12 = false]
[#assign useSTTS22H = false]
[#assign useA3G4250D = false]
[#assign useAIS328DQ = false]
[#assign useAIS3624DQ = false]
[#assign useH3LIS331DL = false]
[#assign useLSM6DSRX = false]

[#if RTEdatas??]
[#list RTEdatas as define]

[#if define?contains("BSP_MOTION_SENSORS")]
[#assign useBSPMotion = true]
[/#if]

[#if define?contains("BSP_ENV_SENSORS")]
[#assign useBSPEnv = true]
[/#if]

[#if define?contains("LSM6DSL_ACCGYR")]
[#assign useLSM6DSL = true]
[/#if]

[#if define?contains("LSM303AGR_ACCMAG")]
[#assign useLSM303AGR = true]
[/#if]

[#if define?contains("LIS3MDL_MAG")]
[#assign useLIS3MDL = true]
[/#if]

[#if define?contains("HTS221_HUMTEMP")]
[#assign useHTS221 = true]
[/#if]

[#if define?contains("LPS22HB_PRESSTEMP")]
[#assign useLPS22HB = true]
[/#if]

[#if define?contains("LSM6DSO_ACCGYR")]
[#assign useLSM6DSO = true]
[/#if]

[#if define?contains("LIS2DW12_ACC")]
[#assign useLIS2DW12 = true]
[/#if]

[#if define?contains("LIS2MDL_MAG")]
[#assign useLIS2MDL = true]
[/#if]

[#if define?contains("LPS22HH_PRESSTEMP")]
[#assign useLPS22HH = true]
[/#if]

[#if define?contains("STTS751_TEMP")]
[#assign useSTTS751 = true]
[/#if]

[#if define?contains("LSM6DSOX_ACCGYR")]
[#assign useLSM6DSOX = true]
[/#if]

[#if define?contains("LPS33HW_PRESSTEMP")]
[#assign useLPS33HW = true]
[/#if]

[#if define?contains("LIS2DH12_ACC")]
[#assign useLIS2DH12 = true]
[/#if]

[#if define?contains("ASM330LHH_ACCGYR")]
[#assign useASM330LHH = true]
[/#if]

[#if define?contains("ISM330DLC_ACCGYR")]
[#assign useISM330DLC = true]
[/#if]

[#if define?contains("ISM303DAC_ACCMAG")]
[#assign useISM303DAC = true]
[/#if]

[#if define?contains("IIS2DLPC_ACC")]
[#assign useIIS2DLPC = true]
[/#if]

[#if define?contains("IIS2MDC_MAG")]
[#assign useIIS2MDC = true]
[/#if]

[#if define?contains("ISM330DHCX_ACCGYR")]
[#assign useISM330DHCX = true]
[/#if]

[#if define?contains("LSM6DSR_ACCGYR")]
[#assign useLSM6DSR = true]
[/#if]

[#if define?contains("AIS2DW12_ACC")]
[#assign useAIS2DW12 = true]
[/#if]

[#if define?contains("STTS22H_TEMP")]
[#assign useSTTS22H = true]
[/#if]

[#if define?contains("A3G4250D_GYR")]
[#assign useA3G4250D = true]
[/#if]

[#if define?contains("AIS328DQ_ACC")]
[#assign useAIS328DQ = true]
[/#if]

[#if define?contains("AIS3624DQ_ACC")]
[#assign useAIS3624DQ = true]
[/#if]

[#if define?contains("H3LIS331DL_ACC")]
[#assign useH3LIS331DL = true]
[/#if]

[#if define?contains("LSM6DSRX_ACCGYR")]
[#assign useLSM6DSRX = true]
[/#if]

[/#list]
[/#if]

[#if useBSPMotion]
#include "custom_motion_sensors.h"
[#if useLSM6DSL]
#include "lsm6dsl_settings.h"
[/#if]
[#if useLSM303AGR]
#include "lsm303agr_settings.h"
[/#if]
[#if useLIS3MDL]
#include "lis3mdl_settings.h"
[/#if]
[#if useLSM6DSO]
#include "lsm6dso_settings.h"
[/#if]
[#if useLIS2DW12]
#include "lis2dw12_settings.h"
[/#if]
[#if useLIS2MDL]
#include "lis2mdl_settings.h"
[/#if]
[#if useLSM6DSOX]
#include "lsm6dsox_settings.h"
[/#if]
[#if useLIS2DH12]
#include "lis2dh12_settings.h"
[/#if]
[#if useASM330LHH]
#include "asm330lhh_settings.h"
[/#if]
[#if useISM330DLC]
#include "ism330dlc_settings.h"
[/#if]
[#if useISM303DAC]
#include "ism303dac_settings.h"
[/#if]
[#if useIIS2DLPC]
#include "iis2dlpc_settings.h"
[/#if]
[#if useIIS2MDC]
#include "iis2mdc_settings.h"
[/#if]
[#if useISM330DHCX]
#include "ism330dhcx_settings.h"
[/#if]
[#if useLSM6DSR]
#include "lsm6dsr_settings.h"
[/#if]
[#if useAIS2DW12]
#include "ais2dw12_settings.h"
[/#if]
[#if useA3G4250D]
#include "a3g4250d_settings.h"
[/#if]
[#if useAIS328DQ]
#include "ais328dq_settings.h"
[/#if]
[#if useAIS3624DQ]
#include "ais3624dq_settings.h"
[/#if]
[#if useH3LIS331DL]
#include "h3lis331dl_settings.h"
[/#if]
[#if useLSM6DSRX]
#include "lsm6dsrx_settings.h"
[/#if]
[/#if]
[#if useBSPEnv]
#include "custom_env_sensors.h"
[#if useHTS221]
#include "hts221_settings.h"
[/#if]
[#if useLPS22HB]
#include "lps22hb_settings.h"
[/#if]
[#if useLPS22HH]
#include "lps22hh_settings.h"
[/#if]
[#if useSTTS751]
#include "stts751_settings.h"
[/#if]
[#if useLPS33HW]
#include "lps33hw_settings.h"
[/#if]
[#if useSTTS22H]
#include "stts22h_settings.h"
[/#if]
[/#if]
#include "${BoardName}.h"
#include "math.h"

/* Private typedef -----------------------------------------------------------*/
typedef struct displayFloatToInt_s {
  int8_t sign; /* 0 means positive, 1 means negative*/
  uint32_t  out_int;
  uint32_t  out_dec;
} displayFloatToInt_t;

/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256

/* Private variables ---------------------------------------------------------*/
static volatile uint8_t PushButtonDetected = 0;
static uint8_t verbose = 1;  /* Verbose output to UART terminal ON/OFF. */
[#if useBSPMotion]
static CUSTOM_MOTION_SENSOR_Capabilities_t MotionCapabilities[CUSTOM_MOTION_INSTANCES_NBR];
[/#if]
[#if useBSPEnv]
static CUSTOM_ENV_SENSOR_Capabilities_t EnvCapabilities[CUSTOM_ENV_INSTANCES_NBR];
[/#if]
static char dataOut[MAX_BUF_SIZE];
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void floatToInt(float in, displayFloatToInt_t *out_value, int32_t dec_prec);
[#if useBSPMotion]
static void Accelero_Sensor_Handler(uint32_t Instance);
static void Gyro_Sensor_Handler(uint32_t Instance);
static void Magneto_Sensor_Handler(uint32_t Instance);
[/#if]
[#if useBSPEnv]
static void Temp_Sensor_Handler(uint32_t Instance);
static void Hum_Sensor_Handler(uint32_t Instance);
static void Press_Sensor_Handler(uint32_t Instance);
[/#if]
static void MX_DataLogTerminal_Init(void);
static void MX_DataLogTerminal_Process(void);
