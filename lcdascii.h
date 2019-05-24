
#ifndef LCDASCII_H
#define LCDASCII_H

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
static void graphic_write(uint8_t value, uint8_t controller);
static void graphic_write_command(uint8_t command, uint8_t controller);
static void graphic_write_data(uint8_t data, uint8_t controller);
void graphic_clear_screen(void);

uint8_t backBuffer[144][8];
void clear_backBuffer();
void pixel(int x, int y, int set);
void byteToBuffer(int addr, int page, char c);
void graphic_draw_screen(void);
;




#endif //LCDASCII_H