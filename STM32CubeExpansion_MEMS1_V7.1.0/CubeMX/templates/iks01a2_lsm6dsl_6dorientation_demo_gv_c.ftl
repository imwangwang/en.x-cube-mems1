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

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static uint8_t SendOrientationRequest  = 0;
static char dataOut[MAX_BUF_SIZE];
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_IKS01A2_LSM6DSL_6DOrientation_Init(void);
static void MX_IKS01A2_LSM6DSL_6DOrientation_Process(void);
static void Send_Orientation(void);
