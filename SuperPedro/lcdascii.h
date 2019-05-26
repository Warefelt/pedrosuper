
#ifndef LCDASCII_H
#define LCDASCII_H

#include <stdint.h>


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


//helper funcs
static void graphic_ctrl_bit_set(uint8_t x);        //set R/W, En, RESET, etc.
static void graphic_ctrl_bit_clear(uint8_t x);      //clear R/W, En, RESET, etc.
static void select_controller(uint8_t controller);  //CS1/CS2/both/none

//misc
void graphic_initialize(void);
static void graphic_wait_ready(void);


//read
static uint8_t graphic_read(uint8_t controller);
static uint8_t graphic_read_data(uint8_t controller);

//write
void graphic_write(uint8_t value, uint8_t controller);
void graphic_write_command(uint8_t command, uint8_t controller);
void graphic_write_data(uint8_t data, uint8_t controller);
void graphic_clear_screen(void);

void clear_backBuffer();
void pixel(int x, int y, int set);
void byteToBuffer(int addr, int page, char c);
void graphic_draw_screen(void);


void shiftRight();
void shiftLeft();



#endif //LCDASCII_H
