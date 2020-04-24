[#ftl]
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "custom_motion_sensors.h"
#include "custom_motion_sensors_ex.h"
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
#define G_POWER_UP_DELAY    150 /*!< Delay after gyro power-up [ms] */
#define G_ST_ENABLED_DELAY   50 /*!< Delay after gyro self-test enabled [ms] */

#define N_SAMPLES  5 /*!< Number of samples */

#define X_LO_LIM      90 /*!< Accelero low test limit [mg] */
#define X_HI_LIM    1700 /*!< Accelero high test limit [mg] */
#define G_LO_LIM  150000 /*!< Gyro low test limit [mdps] */
#define G_HI_LIM  700000 /*!< Gyro high test limit [mdps] */

#define ST_REG_COUNT  (sizeof(reg_addr) / sizeof(uint8_t))

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t PushButtonDetected = 0;
static char dataOut[MAX_BUF_SIZE];
static DEMO_STATUS DemoStatus = STATUS_SLEEP;
/* Refer to Datasheet / Application Note documents for details about following register settings */
static uint8_t reg_addr[]        = {0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19};
static uint8_t x_st_reg_values[] = {0x38, 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
static uint8_t g_st_reg_values[] = {0x00, 0x5C, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_LSM6DSL_SelfTest_Init(void);
static void MX_LSM6DSL_SelfTest_Process(void);
static void Sleep_Mode(void);
static int32_t LSM6DSL_X_SelfTest(void);
static int32_t LSM6DSL_G_SelfTest(void);
static int32_t LSM6DSL_X_Get_Data(BSP_MOTION_SENSOR_Axes_t *data);
static int32_t LSM6DSL_G_Get_Data(BSP_MOTION_SENSOR_Axes_t *data);
