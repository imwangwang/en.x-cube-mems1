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
 * @brief  Handle DEMO State Machine
 */
typedef enum
{
  STATUS_IDLE,
  STATUS_SET_FIFO_MODE,
  STATUS_FIFO_RUN,
  STATUS_FIFO_DOWNLOAD,
  STATUS_SET_FIFO_BYPASS_MODE
} DEMO_FIFO_STATUS_t;

/**
 * @brief  FIFO Interrupt type
 */
typedef enum
{
  FIFO_INTERRUPT_THRESHOLD,
  FIFO_INTERRUPT_FULL,
  FIFO_INTERRUPT_OVERRUN
} FIFO_INTERRUPT_t;

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
#define FIFO_WATERMARK    5 /*!< FIFO size limit */
#define FIFO_INTERRUPT    FIFO_INTERRUPT_THRESHOLD /*!< Chosen FIFO INTERRUPT event type */
#define FIFO_MAX_SAMPLES  32U

#define LPS22HB_SAMPLE_ODR      10.0f /*!< Sample Output Data Rate [Hz] */

#define ENABLE  1 /*!< Enable LPS22HB FIFO functions */

#define INDICATION_DELAY  100 /* LED is ON for this period [ms]. */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static DEMO_FIFO_STATUS_t DemoFifoStatus = STATUS_SET_FIFO_BYPASS_MODE;
static char dataOut[MAX_BUF_SIZE];
static uint8_t fifo_flag = 0;
static uint8_t num_samples = 0;
static uint8_t prev_num_samples = 0;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_LPS22HB_FIFOMode_Init(void);
static void MX_LPS22HB_FIFOMode_Process(void);
static int32_t LPS22HB_FIFO_Set_Bypass_Mode(void);
static int32_t LPS22HB_FIFO_Set_FIFO_Mode(void);
static int32_t LPS22HB_Read_All_FIFO_Data(void);
static int32_t LPS22HB_FIFO_Demo_Config(void);
static void Print_Configuration(void);
static void floatToInt(float in, displayFloatToInt_t *out_value, int32_t dec_prec);
