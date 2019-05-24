
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

volatile unsigned int* STK_CTRL = 0xE000E010;
volatile unsigned int* STK_LOAD = 0xE000E014;
volatile unsigned int* STK_VAL = 0xE000E018;

PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	
	void (*draw)(struct tObj *);
	void (*clear)(struct tObj *);
	void (*move)(struct tObj *);
