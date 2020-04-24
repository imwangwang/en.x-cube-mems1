[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "custom_motion_sensors.h"
#include "custom_motion_sensors_ex.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum
{
  MODE_DEFAULT    = 0,
  MODE_SINGLE_TAP = 1,
  MODE_DOUBLE_TAP = 2
} Mode_t;

/* Private define ------------------------------------------------------------*/
#define SINGLE_TAP_INDICATION_DELAY  100  /* LED is ON for this period [ms]. */
#define DOUBLE_TAP_INDICATION_DELAY  100  /* LED is ON for this period [ms]. */
#define INDICATION_WAIT_DELAY        100  /* LED is locked OFF for this period [ms]. */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static uint8_t SingleTapModeRequest = 1;
static uint8_t DoubleTapModeRequest = 0;
static uint8_t DefaultModeRequest   = 0;
static Mode_t mode = MODE_DEFAULT;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_LSM6DSL_SingleDoubleTap_Init(void);
static void MX_LSM6DSL_SingleDoubleTap_Process(void);
