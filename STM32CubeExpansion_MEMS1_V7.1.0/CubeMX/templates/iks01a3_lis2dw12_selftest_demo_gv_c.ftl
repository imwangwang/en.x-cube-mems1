[#ftl]
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "iks01a3_motion_sensors.h"
#include "iks01a3_motion_sensors_ex.h"
#include <stdlib.h> /* abs */

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  STATUS_SELFTEST,
  STATUS_SLEEP
} DEMO_STATUS;

/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256
#define INDICATION_DELAY  1000 /* LED is ON for this period [ms]. */

#define X_POWER_UP_DELAY    100 /*!< Delay after accelero power-up [ms] */
#define X_ST_ENABLED_DELAY  100 /*!< Delay after accelero self-test enabled [ms] */

#define N_SAMPLES  5 /*!< Number of samples */

#define X_LO_LIM      70 /*!< Accelero low test limit [mg] */
#define X_HI_LIM    1500 /*!< Accelero high test limit [mg] */

#define ST_REG_COUNT  (sizeof(reg_addr) / sizeof(uint8_t))

#define LIS2DW12_ST_DISABLE  0U
#define LIS2DW12_ST_POSITIVE 1U
#define LIS2DW12_ST_NEGATIVE 2U

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t PushButtonDetected = 0;
static char dataOut[MAX_BUF_SIZE];
static DEMO_STATUS DemoStatus = STATUS_SLEEP;
/* Refer to Datasheet / Application Note documents for details about following register settings */
static uint8_t reg_addr[]        = {0x21, 0x22, 0x23, 0x24, 0x25, 0x20};
static uint8_t x_st_reg_values[] = {0x0C, 0x00, 0x00, 0x00, 0x10, 0x44};
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_IKS01A3_LIS2DW12_SelfTest_Init(void);
static void MX_IKS01A3_LIS2DW12_SelfTest_Process(void);
static void Sleep_Mode(void);
static int32_t LIS2DW12_X_SelfTest(void);
static int32_t LIS2DW12_X_Get_Data(IKS01A3_MOTION_SENSOR_Axes_t *data);
