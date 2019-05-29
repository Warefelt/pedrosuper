#include "delays.h"

void delay_250ns(){
    *STK_CTRL=0;
    *STK_LOAD=1;//168/4-1;
    *STK_VAL=0;
    *STK_CTRL=5;
    while((*STK_CTRL & 0x10000)==0);
    *STK_CTRL=0;
}

void delay_500ns(){
	*STK_CTRL=0;
    *STK_LOAD=1;//168/2-1;
    *STK_VAL=0;
    *STK_CTRL=5;
    while((*STK_CTRL & 0x10000)==0);
    *STK_CTRL=0;
}

void delaymicros(int micros){
    #ifdef NONSIMULATOR
		//micros *= 1000;
	#endif
    for(int i = 0; i < micros * 2; i++){
        delay_500ns();
    }
}


void delaymillis(int millis){
	delaymicros(millis);// * 1000);
}
