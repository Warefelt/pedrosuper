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

//backbuffer, screen is updated with graphic_draw_screen
uint8_t backBuffer[1152]; // 144 * 64 / 8





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

static void graphic_write(uint8_t value, uint8_t controller){
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
static void graphic_write_command(uint8_t command, uint8_t controller){
    graphic_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(B_RS | B_RW);
    graphic_write(command, controller);
}
static void graphic_write_data(uint8_t data, uint8_t controller){
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
    for (int i = 0; i < sizeof(backBuffer); i++){
			 backBuffer[i] = 0;
	}
}

void pixel(int x, int y, int set) {
    uint8_t mask;
    int index = 0;
    if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
    index = (y-1)/8;
    
    mask = 1 << ((y-1)%8);
    
    if(x > 64){
        x -= 65;
        index = 64;
    } else {
        x = x-1;
    }
    
    index += x;
    
    if(set){
        backBuffer[(x-1)/8 + 8*(y-1)] |= mask;
    }
    else{
        backBuffer[(x-1)/8 + 8*(y-1)] &= ~mask;
    }
}

void byteToBuffer(int addr, int page, char c){
	backBuffer[page + addr*8] = c;
}

void graphic_draw_screen(void) {
    uint8_t i, j, controller, c;
    unsigned int k = 0;
    for(c = 0; c < 2; c++) {
        controller = (c == 0) ? B_CS1 : B_CS2;
        for(j = 0; j < 8; j++) {
            graphic_write_command(LCD_SET_PAGE | j, controller);
            graphic_write_command(LCD_SET_ADD | 0, controller);
            for(i = 0; i <= 63; i++, k++) {
                graphic_write_data(backBuffer[c*512 + i*8 + j], controller);
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
