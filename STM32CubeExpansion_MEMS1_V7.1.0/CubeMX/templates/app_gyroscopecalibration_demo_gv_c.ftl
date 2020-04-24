[#ftl]

[#assign useCortexM0 = false]

[#if ("${FamilyName}" == "STM32F0" || "${FamilyName}" == "STM32G0" || "${FamilyName}" == "STM32L0")]
  [#assign useCortexM0 = true]
[/#if]

#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}.h"
#include "com.h"
#include "demo_serial.h"
#include "motion_gc_manager.h"
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
static MOTION_SENSOR_Axes_t AccValue;
static MOTION_SENSOR_Axes_t GyrValue;
static MGC_knobs_t Knobs;

/* Private function prototypes -----------------------------------------------*/
static void MX_GyroscopeCalibration_Init(void);
static void MX_GyroscopeCalibration_Process(void);

static void Init_Sensors(void);
static void RTC_Handler(TMsg *Msg);
static void GC_Data_Handler(TMsg *Msg);
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
