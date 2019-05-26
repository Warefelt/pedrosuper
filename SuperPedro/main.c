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

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main4\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}


//GLOBALS

//keyboard interrupts



void init(){
	//
	//	
	//	lcd
	//	ascii
	//	kbd
	//	
	//	interrupts?
	//	
	//	
	jumppressed = 0;
}











void loop(){
	//(splash start)	
	//
	//	
	while(1){
		update();
	}
	//	
	//	
	//	
	//	
	//	
}


void update(){
	//
	//ändra Pedros properties
	if(backBuffer[63] == 0){
		loadNewLevelSegment()
	}
    if(backBuffer[1216] == 0){
		loadNewLevelSegment()
	}
	
	Pedro.move(Pedro);	//flyttar hela skärmen så det ser ut som att Pedro rör sig
    	
	//win/loss
	if(Pedro.touchesPepper() == 1){
		onLoss();
	}
/*	if(Pedro.distance == ){
		onWin();
	}*/
	
}




void onLoss(){
	
}
void onWin(){
	
}






























void main(void){
	init();
	while(1){
		loop();
	}
}

