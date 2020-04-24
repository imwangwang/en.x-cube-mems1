[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "iks01a2_motion_sensors.h"
#include "iks01a2_motion_sensors_ex.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define INDICATION_DELAY  100 /* LED is ON for this period [ms]. */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static uint8_t FreeFallEnableRequest = 1;
static uint8_t FreeFallDisableRequest = 0;
static uint8_t FreeFallEnabled = 0;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_IKS01A2_LSM6DSL_FreeFall_Init(void);
static void MX_IKS01A2_LSM6DSL_FreeFall_Process(void);
