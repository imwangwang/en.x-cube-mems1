[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "custom_motion_sensors.h"
#include "custom_motion_sensors_ex.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define INDICATION_DELAY  100 /* LED is ON for this period [ms]. */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static uint8_t TiltEnableRequest = 1;
static uint8_t TiltDisableRequest = 0;
static uint8_t TiltEnabled = 0;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_LSM6DSL_Tilt_Init(void);
static void MX_LSM6DSL_Tilt_Process(void);
