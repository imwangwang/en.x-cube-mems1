/**
  ******************************************************************************
  * @file           : nucleo_l073rz_bus.h
  * @brief          : header file for the BSP BUS IO driver
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
*/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __NUCLEO_L073RZ_BUS_H
#define __NUCLEO_L073RZ_BUS_H

#ifdef __cplusplus
extern "C" {
#endif

#define USE_HAL_SPI_REGISTER_CALLBACKS 0
#define USE_HAL_I2C_REGISTER_CALLBACKS 0

#if (USE_HAL_I2C_REGISTER_CALLBACKS == 1)
typedef struct
{
  pI2C_CallbackTypeDef  pMspI2cInitCb;
  pI2C_CallbackTypeDef  pMspI2cDeInitCb;
} BSP_I2C_Cb_t;
#endif /* (USE_HAL_I2C_REGISTER_CALLBACKS == 1) */

#if (USE_HAL_SPI_REGISTER_CALLBACKS == 1)
typedef struct
{
  pSPI_CallbackTypeDef  pMspSpiInitCb;
  pSPI_CallbackTypeDef  pMspSpiDeInitCb;
} BSP_SPI_Cb_t;
#endif /* (USE_HAL_SPI_REGISTER_CALLBACKS == 1) */


/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
/* BUS IO driver over I2C Peripheral */
int32_t BSP_I2C1_Init(void);
int32_t BSP_I2C1_DeInit(void);
int32_t BSP_I2C1_IsReady(void);
int32_t BSP_I2C1_WriteReg(uint16_t Addr, uint16_t Reg, uint8_t *pData, uint16_t len);
int32_t BSP_I2C1_ReadReg(uint16_t Addr, uint16_t Reg, uint8_t *pData, uint16_t len);
int32_t BSP_I2C1_WriteReg16(uint16_t Addr, uint16_t Reg, uint8_t *pData, uint16_t len);
int32_t BSP_I2C1_ReadReg16(uint16_t Addr, uint16_t Reg, uint8_t *pData, uint16_t len);
int32_t BSP_I2C1_Send(uint16_t DevAddr, uint8_t *pData, uint16_t Length);
int32_t BSP_I2C1_Recv(uint16_t DevAddr, uint8_t *pData, uint16_t Length);
int32_t BSP_I2C1_SendRecv(uint16_t DevAddr, uint8_t *pTxdata, uint8_t *pRxdata, uint16_t Length);

int32_t BSP_GetTick(void);

#if (USE_HAL_SPI_REGISTER_CALLBACKS == 1)
int32_t BSP_BUS_RegisterDefaultMspCallbacks(void);
int32_t BSP_BUS_RegisterMspCallbacks(BSP_BUS_Cb_t *Callbacks);
#endif /* ((USE_HAL_I2C_REGISTER_CALLBACKS == 1) || (USE_HAL_SPI_REGISTER_CALLBACKS == 1)) */

#ifdef __cplusplus
}
#endif

#endif /* __NUCLEO_L073RZ_BUS_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/