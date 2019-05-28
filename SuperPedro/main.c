/*
 * 	startup.c
 *
 


#####TODO#####

-rightshift()
-fixa paprikorna? s.a ej upponer
-includes
 * app init
 * Pedro ska vända sig (spegelvänd bild) 
 * och byta mellan spritesen (animeras)













*/



#include "delays.h"
#include "keyfuncs.h"
#include "lcdascii.h"
#include "gpio.h"
#include "pedro.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}


//GLOBALS
extern char backBuffer[256][8];

//#define USBDM
#define NONSIMULATOR

void gpioInit(){
	
    GPIO_E->moder=0x55555555;		//------------------------------------------------------------------------------------------------
    GPIO_D->moder = 0x55005555;
    
	GPIO_D->otyper &= 0xFFFF00FF;
	GPIO_D->otyper |= 0x00000F00;
	// Sätter pinnar 4-0 till "pull-down"
	GPIO_D->pupdr &= 0x0000FFFF;
	GPIO_D->pupdr |= 0xFFAA0000;

}



void init(){
    #ifdef USBDM
		*((unsigned long*)0x40023830)=0x18;
    #endif
	
    gpioInit();
    
    graphic_initialize();
//    ascii_initialize();     //todo?

	clear_backBuffer();
	graphic_draw_screen();

}











void loop(){
	//(splash start)	
	//
	//	
    drawGround(0, 127);
	
	while(1){
		//
		//ändra Pedros properties
		if(backBuffer[63][7] == 0){
			loadNewLevelSegmentLeft()
		}
		if(backBuffer[192][7] == 0){
			loadNewLevelSegmentRight()
		}
		
		move();			//flyttar hela skärmen så det ser ut som att Pedro rör sig
			
		//win/loss
		if(touchesPepper() == 1){
			break;		//startar om spelet från början
		}
		/*if(Pedro.distance == ){
			onWin();
		}*/
	}
	
}


void update(){

}


void loadNewLevelSegmentLeft(){
    loadLvl(0);  //64px wide
}

void loadNewLevelSegmentRight(){
    loadLvl(192);
}

void loadLvl(int start){        //loads a 64px wide levelstrip of new peppers into the backBuffer (starting at start, moving right)
    int type;// = randomnumber, några olika varianter 1=____, 2=_oo_, 3=_8__, 4=_o_o mm.
	
	for(int i = 0; i < 64, i+=16){
		loadPepperStrip(start + i, type[i]);
	}
	drawGround(start, start+64);
    
}

void loadPepperStrip(int start, char type){
	switch(type){
		case '_': 
			break;
		case 'o': 
			//loadPepper
			break;
		case '8': 
			//loadPepperOnPepper
			break;
			
	}
}


void drawGround(int from, int to){
    char c = 0b00011000;
    for(from; from <= to; from++){
        backBuffer[64+from][7] |= c;
    }
}



void onWin(){
	//ska vi ha med denna?

}
























void main(void){
	init();
	while(1){
		loop();
	}
}

