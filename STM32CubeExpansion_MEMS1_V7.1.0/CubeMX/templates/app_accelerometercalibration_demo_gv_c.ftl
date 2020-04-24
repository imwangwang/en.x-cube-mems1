[#ftl]
#include "${FamilyName?lower_case}xx_hal.h"
#include "${BoardName}.h"
#include "com.h"
#include "demo_serial.h"
#include "motion_ac_manager.h"
#include "bsp_ip_conf.h"
#include "fw_version.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define ALGO_FREQ  50U /* Algorithm frequency [Hz] */
#define MOVE_THR_G  0.2f /* Recommended between 0.15 - 0.30 g, higher value will relax condition on data selection
                            for calibration but reduce the accuracy which will be around (moveThresh_g / 10) */

/* Public variables ----------------------------------------------------------*/
volatile uint8_t DataLoggerActive = 0;
volatile uint32_t SensorsEnabled = 0;
char lib_version[35];
int lib_version_len;
MAC_calibration_mode_t CalibrationMode = DYNAMIC_CALIBRATION;

/* Extern variables ----------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static const uint32_t ReportInterval = 1000 / (float)ALGO_FREQ; /* Algorithm report interval [ms]
                                                                   Note: Must be between 10 and 50 ms */
static volatile uint8_t SensorReadRequest = 0;
static MOTION_SENSOR_Axes_t AccValue;
static volatile uint32_t TimeStamp = 0;
static MAC_knobs_t Knobs;

/* Private function prototypes -----------------------------------------------*/
static void MX_AccelerometerCalibration_Init(void);
static void MX_AccelerometerCalibration_Process(void);

static void Init_Sensors(void);
static void RTC_Handler(TMsg *Msg);
static void AC_Data_Handler(TMsg *Msg);
static void Accelero_Sensor_Handler(TMsg *Msg);
static void Gyro_Sensor_Handler(TMsg *Msg);
static void Magneto_Sensor_Handler(TMsg *Msg);
static void Pressure_Sensor_Handler(TMsg *Msg);
static void Humidity_Sensor_Handler(TMsg *Msg);
static void Temperature_Sensor_Handler(TMsg *Msg);
static void TIM_Config(uint32_t Freq);
static void DWT_Start(void);
static uint32_t DWT_Stop(void);

#ifdef BSP_IP_MEMS_INT1_PIN_NUM
static void MEMS_INT1_Force_Low(void);
static void MEMS_INT1_Init(void);
#endif
