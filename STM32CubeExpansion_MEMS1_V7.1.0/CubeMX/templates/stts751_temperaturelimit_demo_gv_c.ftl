[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "custom_env_sensors.h"
#include "custom_env_sensors_ex.h"
#include <math.h> /* trunc */

/* Private typedef -----------------------------------------------------------*/
/**
 * @brief  Float to Integer type
 */
typedef struct displayFloatToInt_s
{
  int8_t sign; /* 0 means positive, 1 means negative*/
  uint32_t out_int;
  uint32_t out_dec;
} displayFloatToInt_t;

/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256
#define INDICATION_DELAY             100  /* LED is ON for this period [ms]. */
#define SEND_STEP_COUNT_TIMEOUT    2000U  /* Send step count to UART after this timeout [ms]. */
#define LOW_TEMPERATURE_THRESHOLD  10.0f
#define HIGH_TEMPERATURE_THRESHOLD 28.0f

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static char dataOut1[MAX_BUF_SIZE];
static char dataOut2[MAX_BUF_SIZE];
static uint32_t previous_tick = 0;
static uint8_t HighTemp = 0;
static uint8_t LowTemp = 0;
static float Temperature;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_STTS751_TemperatureLimit_Init(void);
static void MX_STTS751_TemperatureLimit_Process(void);
static uint32_t user_currentTimeGetTick(void);
static uint32_t user_currentTimeGetElapsedMS(uint32_t Tick1);
static void floatToInt(float in, displayFloatToInt_t *out_value, int32_t dec_prec);
static void Send_Temperature(void);
