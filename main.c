/*
 * 	startup.c
 *
 */
 #include ""
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
short jumppressed;


//keyboard interrupts
void irq_right(){
	if(Pedro.xvel < MAX_XVEL){
		Pedro.xacc = 1;
	}
}
void irq_left(){
	if(Pedro.xvel > (-MAX_XVEL)){
		Pedro.xacc = -1;
	}
}
void irq_uppress(){
	jumppressed = 1;
}



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

void jump(POBJECT p){
    //yvel = 10
}

void move(){
    /*
     * ändra P:s properties (physics())
     * 
     * << backbuffer 
     * sprites -> backbuffer
    */
    
}


void update(){
	//
	//ändra Pedros properties

	if(jumppressed){
		if(Pedro.canjump(Pedro)){
			Pedro.jump(Pedro);
		}
	}
	Pedro.move(Pedro);
	
	//win/loss
	if(Pedro.touches == 1){
		onLoss();
	}
/*	if(Pedro.distance == ){
		onWin();
	}*/
	

	//skriv ny skärm till buffern
	updateBuffer();
	
	
	//måla buffern
	drawBuffer();
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

