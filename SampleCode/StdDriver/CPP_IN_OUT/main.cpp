/**************************************************************************//**
 * @file     main.c
 * @version  V3.00
 * @brief    Show how to set GPIO pin mode and use pin data input/output control.
 *
 * SPDX-License-Identifier: Apache-2.0
 * @copyright (C) 2018 Nuvoton Technology Corp. All rights reserved.
 ******************************************************************************/
#include "stdio.h"
#include "NuMicro.h"
#include <iostream>
//#include <typeinfo>
#include <vector>
#include <string>
#include "TScheduler.hpp"

//#include "common.hpp"

#define CLOCKS_PER_TICK   (SystemCoreClock/1000)

#ifdef __cplusplus
extern "C" {
#endif
volatile uint32_t tick_acc = 0;
void SysTick_Handler(void)
{
    tick_acc ++;
}
#include <stdint.h>
uint32_t millis(void)
{
    return tick_acc;
}
#ifdef __cplusplus
}
#endif

using namespace std;

void SYS_Init(void)
{
    /* Unlock protected registers */
    SYS_UnlockReg();

    /* Enable HIRC */
    CLK_EnableXtalRC(CLK_PWRCTL_HIRCEN_Msk);

    /* Waiting for HIRC clock ready */
    CLK_WaitClockReady(CLK_STATUS_HIRCSTB_Msk);

    /* Switch HCLK clock source to HIRC */
    CLK_SetHCLK(CLK_CLKSEL0_HCLKSEL_HIRC, CLK_CLKDIV0_HCLK(1));

    /* Set both PCLK0 and PCLK1 as HCLK/2 */
    CLK->PCLKDIV = (CLK_PCLKDIV_APB0DIV_DIV2 | CLK_PCLKDIV_APB1DIV_DIV2);

    /* Switch UART0 clock source to HIRC */
    CLK_SetModuleClock(UART0_MODULE, CLK_CLKSEL1_UART0SEL_HIRC, CLK_CLKDIV0_UART0(1));

    /* Enable UART peripheral clock */
    CLK_EnableModuleClock(UART0_MODULE);

    /* Update System Core Clock */
    /* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
    SystemCoreClockUpdate();

    /*----------------------------------------------------------------------*/
    /* Init I/O Multi-function                                              */
    /*----------------------------------------------------------------------*/
    /* Set GPB multi-function pins for UART0 RXD and TXD */
    SYS->GPB_MFPH = (SYS->GPB_MFPH & ~(SYS_GPB_MFPH_PB12MFP_Msk | SYS_GPB_MFPH_PB13MFP_Msk)) |
                    (SYS_GPB_MFPH_PB12MFP_UART0_RXD | SYS_GPB_MFPH_PB13MFP_UART0_TXD);

    /* Lock protected registers */
    SYS_LockReg();
}

/*----------------------------------------------------------------------*/
/* Init UART0                                                           */
/*----------------------------------------------------------------------*/
void UART0_Init(void)
{
    /* Reset UART0 */
    SYS_ResetModule(UART0_RST);

    /* Configure UART0 and set UART0 baud rate */
    UART_Open(UART0, 115200);
}


extern "C" void GPABGH_IRQHandler(void)
{
    volatile uint32_t temp;

    /* To check if PB.2 interrupt occurred */
    if(GPIO_GET_INT_FLAG(PB, BIT2))
    {
        GPIO_CLR_INT_FLAG(PB, BIT2);
        //printf("PB.2 INT occurred.\n");
    }
    else
    {
        /* Un-expected interrupt. Just clear all PB interrupts */
        temp = PB->INTSRC;
        PB->INTSRC = temp;
        //printf("Un-expected interrupts.\n");
    }
}

using TS::Scheduler;

Scheduler runner;

volatile uint32_t t0=0;
volatile uint32_t t1=0;

void task0Callback();
void task1Callback();
TS::Task task0(1000, TASK_FOREVER, &task0Callback);
TS::Task task1(2000, TASK_FOREVER, &task1Callback);
void task0Callback() {
	   t0++;
     printf("t0=%d\n\r",t0);
}
void task1Callback() {
     t1++;
     printf("t1=%d\n\r",t1);
	   if (t1==10)
		 {
			 printf("stop t1");
		 task1.disable();
		 }
}
int32_t main(void)
{
    /* Init System, IP clock and multi-function I/O. */
    SYS_Init();
 SysTick_Config(CLOCKS_PER_TICK);
    /* Init UART0 for printf */
    UART0_Init();
    printf("test\n\r");
    cout << "m031 cout" << endl;
    cout << "SystemCoreClock=" << SystemCoreClock << endl;
  
  /* Configure PB.2 as Input mode and enable interrupt by rising edge trigger */
    GPIO_SetMode(PB, BIT2, GPIO_MODE_QUASI);
    GPIO_EnableInt(PB, 2, GPIO_INT_FALLING);
    NVIC_EnableIRQ(GPIO_PAPBPGPH_IRQn);

    /* Enable interrupt de-bounce function and select de-bounce sampling cycle time is 1024 clocks of LIRC clock */
    GPIO_SET_DEBOUNCE_TIME(GPIO_DBCTL_DBCLKSRC_LIRC, GPIO_DBCTL_DBCLKSEL_1024);
    GPIO_ENABLE_DEBOUNCE(PB, BIT2);
	

    runner.init();
    
    runner.addTask(task0);
    task0.enable();
    runner.addTask(task1);
    task1.enable();
    while (1) {
        runner.execute(); 
    }
	
    while(1);
}
