[#ftl]
#include "iks02a1_motion_sensors.h"
#include "${BoardName}.h"
#include "math.h"

/* Private typedef -----------------------------------------------------------*/
typedef struct displayFloatToInt_s {
  int8_t sign; /* 0 means positive, 1 means negative*/
  uint32_t  out_int;
  uint32_t  out_dec;
} displayFloatToInt_t;

/* Private define ------------------------------------------------------------*/
#define MAX_BUF_SIZE 256

/* Private variables ---------------------------------------------------------*/
static volatile uint8_t PushButtonDetected = 0;
static uint8_t verbose = 1;  /* Verbose output to UART terminal ON/OFF. */
static IKS02A1_MOTION_SENSOR_Capabilities_t MotionCapabilities[IKS02A1_MOTION_INSTANCES_NBR];
static char dataOut[MAX_BUF_SIZE];
static int32_t PushButtonState = GPIO_PIN_RESET;

/* Private function prototypes -----------------------------------------------*/
static void floatToInt(float in, displayFloatToInt_t *out_value, int32_t dec_prec);
static void Accelero_Sensor_Handler(uint32_t Instance);
static void Gyro_Sensor_Handler(uint32_t Instance);
static void Magneto_Sensor_Handler(uint32_t Instance);
static void MX_IKS02A1_DataLogTerminal_Init(void);
static void MX_IKS02A1_DataLogTerminal_Process(void);
