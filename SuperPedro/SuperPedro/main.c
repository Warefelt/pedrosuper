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
#include "randomNum.h"

#include <time.h>
#include <stdlib.h>


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
uint32_t seed;

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
    //ascii_init();     //todo?
    
    seed = 1337;
    seedRng(&seed, seed);

	clear_backBuffer();
	graphic_draw_screen();

}











void loop(){
	//(splash start)	
    
	//
	//	
    //drawGround(64, 191);
	
	while(1){
		//
		//ändra Pedros properties
		if(getDistance() % 32 == 0 && getVelx < 0){
			loadNewLevelSegmentLeft();
		}
		if(getDistance() % 32 == 0 && getVelx >= 0){
			loadNewLevelSegmentRight();
		}
		
		move();			//flyttar hela skärmen så det ser ut som att Pedro rör sig
        
//        char* buffer;
//        itoa(getDistance(), buffer, 10);
//        stringToAscii();
			
		//win/loss
		if(touchesPepper() == 1){
			break;		//startar om spelet från början
		}
		/*if(Pedro.distance == ){
			onWin();
		}*/
	}
	
}



void loadNewLevelSegmentLeft(){
    loadLvl(0);  //64px wide
}

void loadNewLevelSegmentRight(){
    loadLvl(192);
}


//bör fungera
void loadPepperAt(int addr, int page){
		char b[][2]= 
				{
				{0b11111000, 0b00000111}, 
				{0b00001100, 0b00011100}, 
				{0b00000100, 0b00110000},
				{0b00001100, 0b11100000},
				{0b11101000, 0b10000111},
				{0b00011100, 0b11011000},
				{0b00000110, 0b01100000}, 
				{0b00000111, 0b00100000},
				{0b00001111, 0b00100000},
				{0b00001011, 0b01100000},
				{0b00111001, 0b11010000}, 
				{0b11001101, 0b10001111},
				{0b00000100, 0b11000000}, 
				{0b00000100, 0b01100000},
				{0b00001100, 0b00110000},
				{0b11111000, 0b00011111}
				};
     
		for(int j = 0; j < 2; j++){
			for(int i = 0; i < 16; i++){
				byteToBuffer(addr + i, page + j, b[i][j]);
			}
		}
}


//bör fungera
void loadPepperStrip(int start, char type){
	
	switch(type){
		case '_': 
			break;
		case 'o': 
			loadPepperAt(start, 6);
			break;
		case '8':
			loadPepperAt(start, 6);
			loadPepperAt(start, 4);
			break;
			
	}
}


void loadLvl(int start){        //loads a 64px wide levelstrip of new peppers into the backBuffer (starting at start, moving right)
	//int seed = getDistance();
    int rand = (nextRnd(&seed) % 19);
	//int type = nextRnd() % 20;      // Returns a pseudo-random integer between 0 and 10, några olika varianter 1=____, 2=_oo_, 3=_8__, 4=_o_o mm.
    char PepperStrips[][4] = { "____", "_oo_", "_8__", "_o_o", "o__o", "_o__", "__8_", "_o8_", "__o_", "____", "____", "o___", "___o", "o_o_", "_8o_","_o__","__o_","o___", "___o","____"};
	
	
	for(int i = 0; i < 4; i++){
		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
	}
	//drawGround(start, start+63);
    
}

/*
void drawGround(int from, int to){
    char c = 0b10000000;
    for(from; from <= to; from++){
        backBuffer[from][7] |= c;
    }
}
*/


void onWin(){
	//ska vi ha med denna?
}
























void main(void){
    init();
	while(1){
		loop();
	}
}

