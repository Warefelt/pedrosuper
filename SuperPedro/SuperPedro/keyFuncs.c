#include "keyfuncs.h"
#include "gpio.h"

void kbdActivate(unsigned int row){
    switch(row){
        case 1: 
            GPIO_D->odrHigh = 0x10;
            break;
        case 2: 
            GPIO_D->odrHigh = 0x20;
            break;
        case 3: 
            GPIO_D->odrHigh = 0x40;
            break;
        case 4: 
            GPIO_D->odrHigh = 0x80;
            break;
        default: 
            GPIO_D->odrHigh = 0;
    }
}

int kbdGetCol(){                    
    if(GPIO_D->idrHigh & 8) 
        return 4;
    if(GPIO_D->idrHigh & 4) 
        return 3;
    if(GPIO_D->idrHigh & 2) 
        return 2;
    if(GPIO_D->idrHigh & 1) 
        return 1;
    return 0;
}


char isUpKey(){
	kbdActivate(3);	//row3
	kbdActivate(4);         //power off kbd-rows
	if(kbdGetCol() == 3){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
    kbdActivate(0);         //power off kbd-rows
	return 0;
}
char isRightKey(){
	kbdActivate(4);
	if(kbdGetCol() == 4){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
    kbdActivate(0);         //power off kbd-rows
    return 0;
	
}
char isLeftKey(){
	kbdActivate(4);
	if(kbdGetCol() == 2){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
    kbdActivate(0);         //power off kbd-rows
	return 0;
	
}
