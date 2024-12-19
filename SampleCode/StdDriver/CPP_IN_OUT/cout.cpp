#if 0
//#include <stdio.h>
#include "NuMicro.h"



// Çë²»Òª¹´Ñ¡Use MicroLib
#ifdef __MICROLIB
#error "Please do not use MicroLib!"
#endif
#define DEBUG_PORT   UART0
extern "C"
{
	static void SendChar_ToUART(int ch)
{
    while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);

    if(ch == '\n')
    {
        DEBUG_PORT->DAT = '\r';
        while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);
    }
    DEBUG_PORT->DAT = ch;
}
	
  void _sys_exit(int returncode)
  {
    //printf("Exited! returncode=%d\n", returncode);
    while (1);
  }
  
  void _ttywrch(int ch)
  {
    SendChar_ToUART(ch);
  }
}


  struct MyFile
  {
    int handle;
    /* Whatever you require here. If the only file you are using is */
    /* standard output using printf() for debugging, no file handling */
    /* is required. */
  };
  typedef struct MyFile FILE;
 // FILE __stdin = {0};
 //FILE __stdout = {1};
  //FILE __stderr = {2};
 #define EOF (-1)
  static char GetChar(void)
{
	    while(1)
    {
        if((DEBUG_PORT->FIFOSTS & UART_FIFOSTS_RXEMPTY_Msk) == 0)
        {
            return (DEBUG_PORT->DAT);
        }
    }
	}
	#if 1
  int fgetc(FILE *stream)
  {
   return (GetChar());
  }
  
  int fputc(int c, FILE *stream)
  {
    if (stream->handle == 1 || stream->handle == 2)
    {
      _ttywrch(c);
      return c;
    }
    return EOF;
  }
  
  int fclose(FILE * stream)
  {
    return 0;
  }
  
  int fseek(FILE *stream, long int offset, int whence)
  {
    return -1;
  }
  
  int fflush(FILE *stream)
  {
    if (stream->handle == 1 || stream->handle == 2)
		{
		while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);
		}   
    return 0;
  }
	#endif

#endif

#if 1
#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "NuMicro.h"
#ifdef  __CC_ARM
#pragma import(__use_no_semihosting)
struct __FILE 
{ 
	int handle; 
}; 

FILE __stdout;       
//??_sys_exit()??????????    
void _sys_exit(int x) 
{ 
	x = x; 
} 
#elif defined ( __GNUC__ ) || defined (__clang__)
//__asm (".global __use_no_semihosting\n\t");   
#endif

#define DEBUG_PORT   UART0

int stdout_putchar (int ch) {
  //__asm("BKPT 0");
  return (ch);
}


#if 0
int fputc(int ch, FILE *f)
{ 	
while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);

    if(ch == '\n')
    {
        DEBUG_PORT->DAT = '\r';
        while(DEBUG_PORT->FIFOSTS & UART_FIFOSTS_TXFULL_Msk);
    }
    DEBUG_PORT->DAT = ch;
	return ch;
}
#endif
#endif
