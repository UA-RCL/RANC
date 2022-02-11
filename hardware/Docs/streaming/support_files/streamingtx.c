/******************************************************************************
*
* Copyright (C) 2010 - 2017 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/
/*****************************************************************************/
/*****************************************************************************/
/**
 *
 * @file streamingtx.c
 *
 * Created for Dr. Akoglu's Reconfigurable Computing Lab at the University of
 * Arizona
 *
 * This file sends an AXI stream of packets into the rancNetwork.
 * It is meant to be used in tandem with `streamingrx.c`, and receives
 * external pointers to DMA and Interrupt flags from the rx codes so that it
 * can operate correctly.
 *
 * To see the debug print, you need a Uart16550 or uartlite in your system,
 * and please set "-DDEBUG" in your compiler options. You need to rebuild your
 * software executable.
 *
 * Make sure that MEMORY_BASE is defined properly as per the HW system. The
 * h/w system built in Area mode has a maximum DDR memory limit of 64MB. In
 * throughput mode, it is 512MB.  These limits are need to ensured for
 * proper operation of this code.
 *
 *
 * ***************************************************************************
 */

/***************************** Include Files *********************************/

#include "xaxidma.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "xgpiops.h"
#include "xsdps.h"
#include "ff.h"

#ifdef XPAR_UARTNS550_0_BASEADDR
#include "xuartns550_l.h"       /* to use uartns550 */
#endif


#ifdef XPAR_INTC_0_DEVICE_ID
 #include "xintc.h"
#else
 #include "xscugic.h"
#endif

/************************** Constant Definitions *****************************/

/*
 * Device hardware build related constants.
 */

#ifdef XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#elif XPAR_MIG7SERIES_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG7SERIES_0_BASEADDR
#elif XPAR_MIG_0_BASEADDR
#define DDR_BASE_ADDR	XPAR_MIG_0_BASEADDR
#elif XPAR_PSU_DDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#endif

#ifndef DDR_BASE_ADDR
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)

/* GPIO Parameters
 */
#define EMIO_BASE	78

/*
 * Buffer and Buffer Descriptor related constant definition
 */
#define MAX_PKT_LEN		0x1000

#define NUM_TICKS		10000

#define MAX_PACKETS_PER_IMAGE 256*4

/************************** Debug Definitions *****************************/
//#define PRINT_DEBUG

/******************************* SD CARD *************************************/

typedef unsigned char bool_t;

typedef enum xilSDResult
{
   XILSD_SUCCESS = 0,
   XILSD_NO_CARD,
   XILSD_WRITE_PROTECTION,
   XILSD_ERR_WRITING,
   XILSD_ERR_READING
} xilSDResult_t;

#define SD_DEVICE_ID    XPAR_XSDPS_0_DEVICE_ID
#define SD_BASEADDR     XPAR_PS7_SD_0_BASEADDR
#define SD_CLK_FREQ_HZ  XPAR_PS7_SD_0_SDIO_CLK_FREQ_HZ

#define CARD_INSERTED(a) ((a & XSDPS_PSR_CARD_INSRT_MASK) >> 16) ? TRUE : FALSE
#define WRITE_PROTECTED(a) ((a & XSDPS_PSR_WPS_PL_MASK) >> 18) ? TRUE :FALSE

bool_t isCardInTheSocket(void);
bool_t isCardWriteProtected(void);
bool_t xilSdInit(void);
xilSDResult_t xilSdWrite(uint8_t* buff, uint32_t blkId, uint32_t numBlks);
xilSDResult_t xilSdRead(uint8_t* buff, uint32_t blkId, uint32_t numBlks);

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/
#ifndef DEBUG
extern void xil_printf(const char *format, ...);
#endif

#ifdef XPAR_UARTNS550_0_BASEADDR
static void Uart550_Setup(void);
#endif

u32 SetupInputs(u8* base_addr, FIL* packet_count_ptr, FIL* packet_file_ptr, u8* packet_counts, u8* packets);
void SetupInputsHardcoded(u8* base_addr, int tick);


/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */

static XGpioPs pins; /* Instance of the GPIO Pins */

/*
 * Flags interrupt handlers use to notify the application context the events.
 */
volatile int TxDone;
volatile int Error;

/*
 * Communication between tx and rx
 */
#define COMM_VAL (*(volatile unsigned long *)(0x800000000))
#define TxDone (*(volatile int *)(0x800000010))
#define TickOccurred (*(volatile int *)(0x800000020))
#define AXI_PTR (*(volatile unsigned long *)(0x800000030))

/************************** SD Card Variable Definitions *****************************/
static FIL PacketFileObject;		/* File object */
static FIL PacketCountFileObject;		/* File object */
static FATFS fatfs;
/*
 * To test logical drive 0, FileName should be "0:/<File name>" or
 * "<file_name>". For logical drive 1, FileName should be "1:/<file_name>"
 */
static char PacketFileName[32] = "data.bin";
static char PacketCountFileName[32] = "count.bin";
static char *PacketFile;
static char *PacketCountFile;

#ifdef __ICCARM__
#pragma data_alignment = 32
u8 DestinationAddress[10*1024*1024];
#pragma data_alignment = 4
#else
u8 Packets[MAX_PACKETS_PER_IMAGE*4] __attribute__ ((aligned(32)));
u8 PacketCounts[4] __attribute__ ((aligned(32)));
#endif

/*****************************************************************************/
/**
*
* Main function
*
* This function is the main entry of the streaming transmission.
* It does the following:
*	Waits for the dma system to be initialized by the rx code.
*	Initializes GPIO
*	Starts the tick
*	Loops through the following code:
*		Submit a transfer
*		Wait for the transfer to finish
*		Flush TX buffer
*	Waits for the rx to finish
*	Stops the tick
*
* @param	None
*
* @return
*		- XST_SUCCESS if example finishes successfully
*		- XST_FAILURE if example fails.
*
* @note		None.
*
******************************************************************************/
int main(void)
{
	int numTicks = NUM_TICKS;
	int Status;
	int Tick;
	u8 *TxBufferPtr;
	FRESULT Res;			// Result of SD Card
	u32 num_packets = 0; 	// The number of packets to send over dma

	TxBufferPtr = (u8 *)TX_BUFFER_BASE ;
#ifdef PRINT_DEBUG
	xil_printf("\r\n[TX] --- Entering main() --- \r\n");
#endif
	TCHAR *Path = "0:/";

	// Register volume work area, initialize device
	Res = f_mount(&fatfs, Path, 0);

	if (Res != FR_OK) {
		xil_printf("[TX] SD Card mounting failed \r\n");
		return XST_FAILURE;
	}

	PacketFile = (char *)PacketFileName;
	PacketCountFile = (char *)PacketCountFileName;

	Res = f_open(&PacketCountFileObject, PacketCountFile, FA_READ);
	if (Res) {
		xil_printf("[TX] PacketCountFile open failed \r\n");
		return XST_FAILURE;
	}

	Res = f_open(&PacketFileObject, PacketFile, FA_READ);
	if (Res) {
		xil_printf("[TX] PacketFile open failed \r\n");
		return XST_FAILURE;
	}

	Res = f_lseek(&PacketCountFileObject, 0);
		if (Res) {
			xil_printf("[TX] SD Card f_lseek failed on PacketCountFileObject \r\n");
			return XST_FAILURE;
		}

	// Pointer to beginning of file .
	Res = f_lseek(&PacketFileObject, 0);
	if (Res) {
		xil_printf("[TX] SD Card f_lseek failed on PacketFileObject \r\n");
		return XST_FAILURE;
	}

	/* Wait for synchronization signal */
	while (COMM_VAL != 1) {
		/* NOP */
	}
	/* Send response */
	COMM_VAL = 0;

	/* Setup GPIO */
	XGpioPs_Config *ConfigPtrGpio;
	ConfigPtrGpio = XGpioPs_LookupConfig(0);
	XGpioPs_CfgInitialize(&pins, ConfigPtrGpio, ConfigPtrGpio -> BaseAddr);
	XGpioPs_SetDirectionPin(&pins, EMIO_BASE, 1);
	XGpioPs_SetOutputEnablePin(&pins, EMIO_BASE, 1);
	/* GPIO en is active low */
	XGpioPs_WritePin(&pins, EMIO_BASE, 0x0);

	/* FIXME: Deal with error flag */
	Error = 0;

	// Need to do this long before "XAxiDma_SimpleTransfer". Not sure why.
	num_packets = SetupInputs(TxBufferPtr, &PacketCountFileObject, &PacketFileObject, PacketCounts, Packets);
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);

	/* Initialize flags before start transfer test  */
	TxDone = 0;
	TickOccurred = 0;

	/* Send synchronization signal*/
	COMM_VAL = 1;
	/* Wait for response */
	while(COMM_VAL != 0) {
		/* NOP */
	}

	/* Start tick */
	XGpioPs_WritePin(&pins, EMIO_BASE, 0x1);

	/* Send and receive data */
	for(Tick = 0; Tick < numTicks; Tick ++) {

		Status = XAxiDma_SimpleTransfer((XAxiDma *) AXI_PTR,(UINTPTR) TxBufferPtr,
						num_packets*4, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			xil_printf("[TX] Failed sending dma. Tick: %d\r\n", Tick);
			return XST_FAILURE;
		}

		/*
		 * Wait TX done and RX done
		 */
		while (!TxDone && !Error) {
			/* NOP */
		}

		/* Flush TX cache */
		Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);

		TxDone = 0;

		if (Error) {
			xil_printf("[TX] Transmission failed\r\n");
			goto Done;
		}

		if (Tick < numTicks - 1) {
			num_packets = SetupInputs(TxBufferPtr, &PacketCountFileObject, &PacketFileObject, PacketCounts, Packets);
		}

		Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, MAX_PKT_LEN);

		/* Wait for tick */
		while(!TickOccurred) {
			/* NOP */
		}
		TickOccurred = 0;
	}

	/* Wait for synchronization signal */
	while (COMM_VAL != 1) {
		/* NOP */
	}
	/* Send response */
	COMM_VAL = 0;

	/* Turn off tick */
	XGpioPs_WritePin(&pins, EMIO_BASE, 0x0);

Done:
#ifdef PRINT_DEBUG
	xil_printf("[TX] --- Exiting main() --- \r\n");
#endif
	return XST_SUCCESS;
}

u32 SetupInputs(u8* base_addr, FIL* packet_count_ptr, FIL* packet_file_ptr, u8* packet_counts, u8* packets) {
	FRESULT Res = f_read(packet_count_ptr, (void*)packet_counts, 4,
				NULL);
	if (Res) {
		xil_printf("[TX] PacketCountFileObject read failed \r\n");
		return 0;
	}
	u32 first_byte = packet_counts[0];
	u32 second_byte = packet_counts[1];
	u32 third_byte = packet_counts[2];
	u32 fourth_byte = packet_counts[3];
	u32 value = fourth_byte << 24 | third_byte << 16 | second_byte << 8 | first_byte;
	// Read data from file
	Res = f_read(packet_file_ptr, (void*)packets, value*4,
			NULL);

	if (Res) {
		xil_printf("[TX] PacketFileObject read failed \r\n");
		return 0;
	}
	for(int i = 0; i < value * 4; i++) {
		base_addr[i] = packets[i];
	}
	return value;
}
