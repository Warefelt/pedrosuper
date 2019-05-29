#include "LcdAscii.h"
#include "gpio.h"



uint8_t backBuffer[256][8]; // 256 * 64 / 8


void graphic_ctrl_bit_set(unsigned char x){
    char c;
    c = GPIO_E->odrLow;
    c |= x;
	c &= ~B_SELECT;
    GPIO_E->odrLow = c;
}

void graphic_ctrl_bit_clear(unsigned char x){
    char c;
    c = GPIO_E->odrLow;
    c &= ~x;
	c &= ~B_SELECT;
    GPIO_E->odrLow = c;
}

static void select_controller(uint8_t controller){  //@param controller - 0/B_CS1/B_CS2/both
    switch(controller){
        case 0:             //none
            graphic_ctrl_bit_clear(B_CS1|B_CS2);
            break;
        case B_CS1 :        //CS1
            graphic_ctrl_bit_set(B_CS1);
            graphic_ctrl_bit_clear(B_CS2);
            break;
        case B_CS2 :        //CS2
            graphic_ctrl_bit_set(B_CS2);
            graphic_ctrl_bit_clear(B_CS1);
            break;
        case B_CS1|B_CS2 :  //both
            graphic_ctrl_bit_set(B_CS1|B_CS2);
            break;
    }
}

void graphic_initialize(void) {
    graphic_ctrl_bit_set(B_E);
    delaymicros(10);
    graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
    delaymillis(30);
    graphic_ctrl_bit_set(B_RST);
    delaymillis(100);
    graphic_write_command(LCD_OFF, B_CS1|B_CS2);    //cmd: LCD_OFF
    graphic_write_command(LCD_OFF, B_CS1|B_CS2);    //cmd: LCD_OFF
    graphic_write_command(LCD_ON, B_CS1|B_CS2);     //...
    graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
    graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
    graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
    select_controller(0);       //choose neither CS1/CS2
}

static void graphic_wait_ready(void) {
    uint8_t c;
    graphic_ctrl_bit_clear(B_E);
    GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
    graphic_ctrl_bit_clear(B_RS);
    graphic_ctrl_bit_set(B_RW);
    delay_500ns();
    while(1) {
        graphic_ctrl_bit_set(B_E);
        delay_500ns();
        c = GPIO_E->idrHigh & LCD_BUSY;
        graphic_ctrl_bit_clear(B_E);
        delay_500ns();
        if( c == 0 ) break;
    }
    GPIO_E->moder = 0x55555555; // 15-0 outputs
}

static uint8_t graphic_read(uint8_t controller) {
    uint8_t c;
    graphic_ctrl_bit_clear(B_E);
    GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
    graphic_ctrl_bit_set(B_RS|B_RW);
    select_controller(controller);
    delay_500ns();
    graphic_ctrl_bit_set(B_E);
    delay_500ns();
    c = GPIO_E->idrHigh;
    graphic_ctrl_bit_clear(B_E);
    GPIO_E->moder = 0x55555555; // 15-0 outputs

    if( controller & B_CS1 ) {
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    if( controller & B_CS2 ) {
        select_controller(B_CS2);
        graphic_wait_ready();
    }
    return c;
}

static uint8_t graphic_read_data(uint8_t controller) {
    graphic_read(controller);
    return graphic_read(controller);
}

void graphic_write(uint8_t value, uint8_t controller){
    GPIO_E->odrHigh = value;
    delay_500ns();
    graphic_ctrl_bit_set(B_E);
    delay_500ns();
    graphic_ctrl_bit_clear(B_E);
    
    if(controller & B_CS1){
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    if(controller & B_CS2){
        select_controller(B_CS2);
        graphic_wait_ready();
    }
        
    GPIO_E->odrHigh = 0;
    graphic_ctrl_bit_set(B_E);
    select_controller(0);    
    
}
void graphic_write_command(uint8_t command, uint8_t controller){
    graphic_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(B_RS | B_RW);
    graphic_write(command, controller);
}
void graphic_write_data(uint8_t data, uint8_t controller){
    graphic_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(B_RW);
    graphic_ctrl_bit_set(B_RS);
    graphic_write(data, controller);
}
void graphic_clear_screen(void){
    for(int i = 1; i <= 128; i++){
		for(int j = 1; j <= 64; j++){
			pixel(i, j, 0);
		}
	}
}


void clear_backBuffer() {
    for (int i = 0; i < 256; i++){
        for(int j = 0; j < 8; j++)
			 backBuffer[i][j] = 0;
	}
}

void pixel(int x, int y, int set) {
    
    uint8_t mask = 1 << ((y-1)%8);
    
    if(set){
        backBuffer[64+(y-1)][(x-1)/8] |= mask;
    }
    else{
        backBuffer[64+(y-1)][(x-1)/8] &= ~mask;
    }
}

void byteToBuffer(int addr, int page, char c){
	backBuffer[addr][page] = c;
}
void byteToScreenBuffer(int addr, int page, char c){
	backBuffer[64+addr][page] = c;
}

void graphic_draw_screen(void) {
    uint8_t i, j, controller, c;
    unsigned int k = 0;
    unsigned int m = 0;
    for(c = 0; c < 2; c++) {
        controller = (c == 0) ? B_CS1 : B_CS2;
        for(j = 0; j < 8; j++) {
            graphic_write_command(LCD_SET_PAGE | j, controller);
            graphic_write_command(LCD_SET_ADD | 0, controller);
            for(i = 0; i <= 63; i++, k++) {
                /*if(((c*64 + i) >= 32) && ((c*64 + i) <= (52))){
                    graphic_write_data(backBuffer[64+c*64 + i][j] | BUF[m].c[j], controller);
                    m++;
                }
                else{
                    graphic_write_data(backBuffer[64+c*64 + i][j], controller);
                }*/
                graphic_write_data(backBuffer[64+c*64 + i][j], controller);
            }
        }
    }
}

/*
void pixel(int x, int y, int set) {
    uint8_t mask, c, controller;
    int index;
    if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
    index = (y-1)/8;
    
    mask = 1 << ((y-1)%8);
    
    if(set == 0)
        mask = ~mask;
    if(x > 64){
        controller = B_CS2;
        x = x - 65;
    } else {
        controller = B_CS1;
        x = x-1;
    }
    graphic_write_command(LCD_SET_ADD | x, controller );
    graphic_write_command(LCD_SET_PAGE | index, controller );
    c = graphic_read_data(controller);
    graphic_write_command(LCD_SET_ADD | x, controller);
    if(set)
        mask = mask | c;
    else
        mask = mask & c;
    graphic_write_data(mask, controller);
}


*/


void shiftRight(){
	for(int i = 255; i > 0; i--){
		for(int j = 0; j < 8; j++){
			backBuffer[i][j] = backBuffer[i-1][j];
		}
	}	
    for(int j = 0; j < 8; j++){
        backBuffer[0][j] = 0; 
    }
}
void shiftLeft(){
	for(int i = 0; i < 255; i++){
		for(int j = 0; j < 8; j++){
			backBuffer[i][j] = backBuffer[i+1][j];
		}
	}	
    for(int j = 0; j < 8; j++){
        backBuffer[255][j] = 0; 
    }
}



 
 
 void ascii_ctrl_bit_set(unsigned char x){
	unsigned char c = *portOdrLow;
	c |= (B_SELECT | x);
	*portOdrLow = c;
}

void ascii_ctrl_bit_clear(unsigned char x){
	unsigned char c = *portOdrLow;
	c &= ~x;
	*portOdrLow = c | B_SELECT;
}

void ascii_write_controller(unsigned char c){
	ascii_ctrl_bit_set(B_E);
	*portOdrHigh = c;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

void ascii_write_cmd(unsigned char command){
	ascii_ctrl_bit_clear(B_RS | B_RW);
	ascii_write_controller(command);
}

void ascii_write_data(unsigned char data){
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_controller(void){
	unsigned char c;
	ascii_ctrl_bit_set(B_E);
	delay_250ns();
	delay_250ns();
	c= *portIdrHigh;
	ascii_ctrl_bit_clear(B_E);
	return c;
}

unsigned char ascii_read_data(void){
	unsigned char c;
	*portModer = 0x00005555;
	ascii_ctrl_bit_set(B_RW |B_RS);
	c = ascii_read_controller();
	*portModer = 0x55555555;
	return c;
}

unsigned char ascii_read_status(void){
	unsigned char c;
	*portModer = 0x00005555;
	ascii_ctrl_bit_set(B_RW);
	ascii_ctrl_bit_clear(B_RS);
	c = ascii_read_controller();
	*portModer = 0x55555555;
	return c;
}

void ascii_command(unsigned char command){
	while ((ascii_read_status() & 0x80)==0x80){}	/*vänta tills display är klar att ta emot kommando */
	delaymicros(8); 								/*latenstid för kommando*/
	ascii_write_cmd(command);						
	delaymillis (2); 								/*istället för 1,53 ms*/
}

void ascii_init(void){
    delaymicros(20);
	ascii_write_controller(0x38);   //2 rader, 5x8 punkter
	delaymicros(39);
    
    delaymicros(20);
	ascii_write_controller(0x0C);      // Tänd display, tänd markör ("cursor"), konstant visning.
	delaymicros(39);
	
	delaymicros(20);
	ascii_write_controller(0x01);  	// Clear disp
	delaymicros(39);
	
	delaymicros(20);
	ascii_write_controller(0x06);  // Adressering med "increment", inget skift av adressbuffern
	delaymicros(39);					/* adressering med increment, inget skift av adressbufferten*/
}

void ascii_clear_disp(){
    delaymicros(20);
	ascii_write_cmd(0x01);  	// Clear disp
	delaymillis(2);
}

void ascii_write_char(unsigned char c){
	while ((ascii_read_status() & 0x80)==0x80){}	/*vänta tills display är klar att ta emot kommando */
	delaymicros(8); 
	ascii_write_data(c);
	delaymillis (2); 
}

void ascii_gotoxy( int column, int row){
	if(row >=1 && row <=20 && column >=1 && column <=2){
		unsigned int adress = row-1;
		if (column == 2){
			adress = adress + 0x40;
		}
		ascii_write_cmd(0x80 | adress);
	}
}

void stringToAscii(char str[], int col, int row){
    graphic_ctrl_bit_clear(B_E);
    ascii_ctrl_bit_set(B_E);
    
	char *s;
	ascii_gotoxy(col,row);
	s = str;
	while (*s)
		ascii_write_char(*s++);
	
    ascii_ctrl_bit_clear(B_E);
    graphic_ctrl_bit_set(B_E);
}
