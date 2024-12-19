#include "NuMicro.h"
#include <stdio.h>
#if 1
#ifdef  __CC_ARM
#pragma import(__use_no_semihosting)

#elif defined ( __GNUC__ ) || defined (__clang__)
//__asm (".global __use_no_semihosting\n\t");   
#endif


#define DEBUG_PORT   UART0
int stdout_putchar (int ch) { 	
while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk){
};

    if(ch == '\n')
    {
        DEBUG_PORT->DAT = '\r';
        while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);
    }
    DEBUG_PORT->DAT = ch;
	return ch;
}

#endif
