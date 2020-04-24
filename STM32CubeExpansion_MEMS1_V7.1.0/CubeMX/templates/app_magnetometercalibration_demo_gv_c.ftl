[#ftl]

[#assign useCortexM0 = false]
[#assign useCortexM3 = false]
[#assign useCortexM4 = false]
[#assign useCortexM7 = false]

[#if ("${FamilyName}" == "STM32F0" || "${FamilyName}" == "STM32G0" || "${FamilyName}" == "STM32L0")]
  [#assign useCortexM0 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F1" || "${FamilyName}" == "STM32F2" || "${FamilyName}" == "STM32L1")]
  [#assign useCortexM3 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F3" || "${FamilyName}" == "STM32F4" || "${FamilyName}" == "STM32G4" || "${FamilyName}" == "STM32L4" || "${FamilyName}" == "STM32WB")]
  [#assign useCortexM4 = true]
[/#if]

[#if ("${FamilyName}" == "STM32F7" || "${FamilyName}" == "STM32H7")]
  [#assign useCortexM7 = true]
[/#if]

#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}.h"
#include "com.h"
#include "demo_serial.h"
#include "motion_mc_manager.h"
#include "bsp_ip_conf.h"
#include "fw_version.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define ALGO_FREQ  50U /* Algorithm frequency [Hz] */

/* Public variables ----------------------------------------------------------*/
volatile uint8_t DataLoggerActive = 0;
volatile uint32_t SensorsEnabled = 0;
char lib_version[35];
int lib_version_len;

/* Extern variables ----------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static const uint32_t ReportInterval = 1000 / (float)ALGO_FREQ; /* Algorithm report interval [ms]
                                                                   Note: Must be between 10 and 50 ms */

static volatile uint8_t SensorReadRequest = 0;
[#if (useCortexM7 || useCortexM4 || useCortexM3)]
static volatile uint32_t TimeStamp = 0;
[/#if]
static MOTION_SENSOR_Axes_t MagValue;

/* Private function prototypes -----------------------------------------------*/
static void MX_MagnetometerCalibration_Init(void);
static void MX_MagnetometerCalibration_Process(void);

static void Init_Sensors(void);
static void RTC_Handler(TMsg *Msg);
static void MC_Data_Handler(TMsg *Msg);
static void Accelero_Sensor_Handler(TMsg *Msg);
static void Gyro_Sensor_Handler(TMsg *Msg);
static void Magneto_Sensor_Handler(TMsg *Msg);
static void Pressure_Sensor_Handler(TMsg *Msg);
static void Humidity_Sensor_Handler(TMsg *Msg);
static void Temperature_Sensor_Handler(TMsg *Msg);
static void TIM_Config(uint32_t Freq);
[#if !useCortexM0]
static void DWT_Start(void);
static uint32_t DWT_Stop(void);
[/#if]

#ifdef BSP_IP_MEMS_INT1_PIN_NUM
static void MEMS_INT1_Force_Low(void);
static void MEMS_INT1_Init(void);
#endif
