[#ftl]
#include "app_mems_int_pin_a_interface.h"
#include "${FamilyName?lower_case}xx_hal.h"
#include "${FamilyName?lower_case}xx_hal_exti.h"
#include "${BoardName}.h"
#include "custom_motion_sensors.h"
#include "custom_motion_sensors_ex.h"

/* Private typedef -----------------------------------------------------------*/
/**
 * @brief  Handle DEMO State Machine
 */
typedef enum
{
  STATUS_IDLE,
  STATUS_SET_FIFO_CONTINUOUS_MODE,
  STATUS_FIFO_RUN,
  STATUS_FIFO_DOWNLOAD,
  STATUS_SET_FIFO_BYPASS_MODE
} DEMO_FIFO_STATUS_t;

/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256
#define FIFO_WATERMARK   91 /*!< FIFO size limit */
#define SAMPLE_LIST_MAX  10U /*!< Max. number of values (X,Y,Z) to be printed to UART */

#define LSM6DSL_SAMPLE_ODR      10.0f /*!< Sample Output Data Rate [Hz] */
#define LSM6DSL_FIFO_MAX_ODR  6600.0f /*!< LSM6DSL FIFO maximum ODR */

#define ENABLE  1 /*!< Enable LSM6DSL FIFO functions */

#define INDICATION_DELAY  100 /* LED is ON for this period [ms]. */

#define PATTERN_GYR_X_AXIS  0 /*!< Pattern of gyro X axis */
#define PATTERN_GYR_Y_AXIS  1 /*!< Pattern of gyro Y axis */
#define PATTERN_GYR_Z_AXIS  2 /*!< Pattern of gyro Z axis */

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile uint8_t MemsEventDetected = 0;
static volatile uint8_t PushButtonDetected = 0;
static DEMO_FIFO_STATUS_t DemoFifoStatus = STATUS_SET_FIFO_BYPASS_MODE;
static char dataOut[MAX_BUF_SIZE];
static uint8_t fifo_full_status = 0;
static uint16_t num_samples = 0;
static uint16_t prev_num_samples = 0;
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void MX_LSM6DSL_FIFOContinuousMode_Init(void);
static void MX_LSM6DSL_FIFOContinuousMode_Process(void);
static int32_t LSM6DSL_FIFO_Set_Bypass_Mode(void);
static int32_t LSM6DSL_FIFO_Set_Continuous_Mode(void);
static int32_t LSM6DSL_Read_All_FIFO_Data(void);
static int32_t LSM6DSL_Read_Single_FIFO_Pattern_Cycle(uint16_t SampleIndex);
static int32_t LSM6DSL_FIFO_Demo_Config(void);