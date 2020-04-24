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

#define POWER_UP_DELAY    20 /*!< Delay after magneto power-up [ms] */
#define ST_ENABLED_DELAY  60 /*!< Delay after magneto self-test enabled [ms] */

#define N_SAMPLES  50 /*!< Number of samples */

#define LO_LIM   15 /*!< Magneto low test limit [mgauss] */
#define HI_LIM  500 /*!< Magneto high test limit [mgauss] */

#define ST_REG_COUNT  (sizeof(reg_addr) / sizeof(uint8_t))

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t PushButtonDetected = 0;
static char dataOut[MAX_BUF_SIZE];
static DEMO_STATUS DemoStatus = STATUS_SLEEP;
static uint8_t reg_addr[]      = {0x60, 0x61, 0x62};
static uint8_t st_reg_values[] = {0x8C, 0x02, 0x10};
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_IKS01A3_LIS2MDL_SelfTest_Init(void);
static void MX_IKS01A3_LIS2MDL_SelfTest_Process(void);

static void Sleep_Mode(void);

static int32_t LIS2MDL_SelfTest(void);
static int32_t LIS2MDL_M_Get_Data(IKS01A3_MOTION_SENSOR_Axes_t *data);
