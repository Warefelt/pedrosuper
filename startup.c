/*
 * 	startup.c
 *
 */
#include <stdint.h>

#define GPIO_D ((volatile GPIO*) 0x40020c00)
#define GPIO_E ((volatile GPIO*) 0x40021000)

// Define values specifying particular bits in
// the control register.
#define B_E 0x40
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08 
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

// Define values specifying particular bits for
// LCD.
#define LCD_ON 0x3F // Display on
#define LCD_OFF 0x3E // Display off
#define LCD_SET_ADD 0x40 // Set horizontal coordinate
#define LCD_SET_PAGE 0xB8 // Set vertical coordinate
#define LCD_DISP_START 0xC0 // Start address
#define LCD_BUSY 0x80 // Read busy status


/// Defines a GPIO on the MD407.
typedef struct {
	uint32_t moder;
	uint16_t otyper; // +0x4
	uint16_t otReserved;
	uint32_t ospeedr; // +0x8
	uint32_t pupdr; // +0xc
	uint8_t idrLow; // +0x10
	uint8_t idrHigh; // +0x11
	uint16_t idrReserved;
	uint8_t odrLow; // +0x14
	uint8_t odrHigh; // +0x15
	uint16_t odrReserved;
} GPIO;


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

//#define USBDM
#define NONSIMULATOR

void app_init(){
	#ifdef USBDM
		*((unsigned long*)0x40023830)=0x18;
	 #endif
    
    GPIO_E->moder=0x55555555;		//------------------------------------------------------------------------------------------------
    /*
    // Sätt pinnar 7-0 till "push-pull"
	GPIO_E->otyper &= 0xFFFFFF00;
	GPIO_E->otyper |= 0x000000FF;
	
	// Sätter pinnar 4-0 till "pull-down"
	GPIO_E->pupdr &= 0xFFFFFF00;
	GPIO_E->pupdr |= 0x000000AA;*/
    
    GPIO_D->moder = 0x55005555;
    
     //Sätt pinnar 7-0 till "push-pull"
	GPIO_D->otyper &= 0xFFFF00FF;
	GPIO_D->otyper |= 0x00000F00;
	// Sätter pinnar 4-0 till "pull-down"
	GPIO_D->pupdr &= 0x0000FFFF;
	GPIO_D->pupdr |= 0xFFAA0000;
}
