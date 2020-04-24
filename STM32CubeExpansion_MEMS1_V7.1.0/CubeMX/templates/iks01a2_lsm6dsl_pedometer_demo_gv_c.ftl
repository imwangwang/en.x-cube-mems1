[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "iks01a2_motion_sensors.h"
#include "iks01a2_motion_sensors_ex.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256
#define INDICATION_DELAY           100  /* LED is ON for this period [ms]. */
#define SEND_STEP_COUNT_TIMEOUT  3000U  /* Send step count to UART after this timeout [ms]. */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static uint8_t StepCountResetRequest = 0;
static char dataOut[MAX_BUF_SIZE];
static uint16_t StepCount = 0;
static uint32_t previous_tick = 0;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_IKS01A2_LSM6DSL_Pedometer_Init(void);
static void MX_IKS01A2_LSM6DSL_Pedometer_Process(void);
static uint32_t user_currentTimeGetTick(void);
static uint32_t user_currentTimeGetElapsedMS(uint32_t Tick1);
static void Send_Step_Count(void);
