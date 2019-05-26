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


uint8_t backBuffer[256][8]; // 256 * 64 / 8


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
    
	GPIO_D->otyper &= 0xFFFF00FF;
	GPIO_D->otyper |= 0x00000F00;
	// Sätter pinnar 4-0 till "pull-down"
	GPIO_D->pupdr &= 0x0000FFFF;
	GPIO_D->pupdr |= 0xFFAA0000;

}

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
    for(c = 0; c < 2; c++) {
        controller = (c == 0) ? B_CS1 : B_CS2;
        for(j = 0; j < 8; j++) {
            graphic_write_command(LCD_SET_PAGE | j, controller);
            graphic_write_command(LCD_SET_ADD | 0, controller);
            for(i = 0; i <= 63; i++, k++) {
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











unsigned char keyb(){
    char key[] = {1,2,3,10,4,5,6,11,7,8,9,12,14,0,15,13};
    int row;
    int col = 0;
    
    for(row = 1; row <= 4; row++){
        kbdActivate(row);           //power kbd-rows
        if(col = kbdGetCol()){      //drain kbd-cols
            kbdActivate(0);         //power off kbd-rows
            return (4*(row-1)+(col-1));
        }
    }
    return 0xFF;
}

void out7seg(unsigned char c){
        
    char arr7seg[] = {0x06, 0x5B, 0x4F, 0x77, 0x66, 0x6D, 0x7D, 0x7C, 0x07, 0x7F, 0x67, 0x39, 0x79, 0x3F, 0x71, 0x5E};
    
    if(c <= 15){
        GPIO_D->odrLow = arr7seg[c];
    }
    else{
        GPIO_D->odrLow = 0;
    }
        
}

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

















volatile unsigned int* STK_CTRL = 0xE000E010;
volatile unsigned int* STK_LOAD = 0xE000E014;
volatile unsigned int* STK_VAL = 0xE000E018;



void delay_250ns(){
    *STK_CTRL=0;
    *STK_LOAD=168/4-1;
    *STK_VAL=0;
    *STK_CTRL=5;
    while((*STK_CTRL & 0x10000)==0);
    *STK_CTRL=0;
}

void delay_500ns(){
	*STK_CTRL=0;
    *STK_LOAD=168/2-1;
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
	delaymicros(millis);//*1000;
}













typedef struct tPoint
{
	unsigned char x;
	unsigned char y;
} POINT;

#define MAX_POINTS 20

typedef struct tGeometry
{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[MAX_POINTS];
}	GEOMETRY,*PGEOMETRY;



typedef struct tObj{
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (*draw)(struct tObj *);
	void (*clear)(struct tObj *);
	void (*move)(struct tObj *);
	void (*set_speed)(struct tObj *, int, int);
} OBJECT,*POBJECT;

void set_object_speed(POBJECT o, int vx, int vy){
	o->dirx = vx;
	o->diry = vy;
}
void draw_object(POBJECT o){
    for(int i = 0; i < sizeof(o->geo->px)/sizeof(POINT); i++){
        pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
    }
//    graphic_draw_screen();
}
void clear_object(POBJECT o){
    for(int i = 0; i < sizeof(o->geo->px)/sizeof(POINT); i++){
        pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
    }
//    graphic_draw_screen();
}
void move_object(POBJECT o){
    o->clear(o);
    o->posx += o->dirx;
    o->posy += o->diry;
    o->draw(o);
}

//definierar en boll enligt mall på sid. 113
GEOMETRY ball_geometry =
{
	12, 
	4,4,
	{
		{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}
	}
};

static OBJECT ball = {
	&ball_geometry,
	0,0,
	1,1,
	&draw_object,
	&clear_object,
	&move_object,
	&set_object_speed
};












int main0(int argc, char **argv) //45
{
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
    p->set_speed(p, 4, 1);
    while(1){
        p->move(p);
    }
}





void main(void){
    unsigned int i;
    app_init(); //Står init_app()
    graphic_initialize();
    #ifdef NONSIMULATOR
    graphic_clear_screen();
    #endif
    for (i=0; i<128; i++)
        pixel(i,10,1);
    for (i=0; i<64; i++)
        pixel(10,i,1);
    delaymillis(500);
    for (i=0; i<128; i++)
        pixel(i,10,0);
    for (i=0; i<64; i++)
        pixel(10,i,0);
}



int objtouchesborder(POBJECT o){
    if((o->posx < 1) || (o->posx + o->geo->sizex) > 128 ){
        return 1;
    }
    else if((o->posy < 1) || (o->posy + o->geo->sizey) > 64){
        return 2;
    }
    return 0;
}


int main2(int argc, char **argv)
{
    char c;
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_draw_screen();
    
    p->posx = 120;
    p->posy = 30;
	p->set_speed(p, 4, 1);
    
    while(1){
        int touches = objtouchesborder(p);
        if(touches != 0){
            switch(touches){
                case 1: 
                    p->set_speed(p, -p->dirx, p->diry);
                    break;
                case 2: 
                    p->set_speed(p, p->dirx, -p->diry);
                    break;
                
            
            }
        }
        p->move(p);
        graphic_draw_screen();
		delaymillis(30);
    }
}


PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (*draw)(struct tObj *);
	void (*clear)(struct tObj *);
	void (*move)(struct tObj *);

int main3(int argc, char **argv)
{
    char c;
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
    while(1){
        p->move(p);
        delaymillis(40);
        c = keyb();
        switch(c){
            case 6: 
                p->set_speed(p, 2, 0);
                break;
            case 4: 
                p->set_speed(p, -2, 0);
                break;
            case 1: 
                p->set_speed(p, 0, -2);
                break;
            case 9: 
                p->set_speed(p, 0, 2);
                break;
            
        }
		int touches = objtouchesborder(p);
        if(touches != 0){
            switch(touches){
                case 1: 
                    p->set_speed(p, -p->dirx, p->diry);
                    break;
                case 2: 
                    p->set_speed(p, p->dirx, -p->diry);
                    break;
                
            
            }
        }
    }
}


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

//addr/page is the rightmost lower corner
void loadPepperAt(int addr, int page){
		char b[][2]= 
				{
				{0b00011111,0b11110000},
				{0b00110000,0b00111000},
				{0b00100000,0b00001100},
				{0b00110000,0b00000111},
				{0b00010000,0b00000001},
				{0b00111000,0b00011111},
				{0b01100111,0b11100110},
				{0b11100000,0b00000100},
				{0b11110000,0b00000100},
				{0b11010000,0b00000110},
				{0b10011100,0b00000011},
				{0b10110011,0b11111101},
				{0b00100000,0b00000011},
				{0b00100000,0b00000110},
				{0b00110000,0b00001100},
				{0b00011111,0b11111000}
				};
		for(int j = 1; j >= 0; j--){
			for(int i = 15; i >= 0; i--){
				byteToBuffer(addr - i, page - j, b[i][j]);
			}
		}
}

char isUpKey(){
    char c = 0;
	kbdActivate(3);	//row3
	kbdActivate(4);         //power off kbd-rows
	if(kbdGetCol() == 3){
		c = 1;
	}
	kbdActivate(0);         //power off kbd-rows
    return c;
}
char isRightKey(){
    char c = 0;
	kbdActivate(4);
	if(kbdGetCol() == 4){
		c = 1;
	}
	kbdActivate(0);         //power off kbd-rows
    return c;
}
char isLeftKey(){
    char c = 0;
	kbdActivate(4);
	if(kbdGetCol() == 2){
		c = 1;
	}
	kbdActivate(0);         //power off kbd-rows
    return c;	
}

int main4(){
	char c;
    app_init();
    graphic_initialize();
				//delaymillis(2000); 		//kan tas bort


	clear_backBuffer();
	
	graphic_draw_screen();
				//delaymillis(5000); 		//kan tas bort
				
	

	while(1){
		loadPepperAt(103, 7);
		for(int i = 0; i < 32; i++){
		
            moveScreen();
		}
		
	}
	

	
}


#define ACCX 1
#define MAX_VELX 4
int velx, accx, posx;

void moveScreen(){								//Kollar knapptryck och uppdaterar alla Pedros värden
    
    checkKeys();

    applyPhysics();
    
    if(velx > 0){
        shiftLeft();
        delaymillis(20/velx);
    }
    else if(velx < 0){
        shiftRight();
        delaymillis(20/(-velx));
    }
    graphic_draw_screen();

}

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys(){
    if(isRightKey() && !isLeftKey()){     //Kräver importerad keyb
		if(velx < MAX_VELX){
			accx = ACCX;     //accelerate right
		}
		else{
			accx = 0;
		}
	}
	else if(!isRightKey() && isLeftKey())
	{
		if(velx > -MAX_VELX){
			accx = -ACCX;    //accelerate left
		}
		else{
			accx = 0;
		}
	}
	else                            //decrease velocity
	{
		accx = 0;
		if(velx > 0){
			velx -= ACCX;
		}
		if(velx < 0){
			velx += ACCX;
		}
	}
    
}

void applyPhysics(){
    //physics
    velx += accx;
	posx += velx;
    
}
