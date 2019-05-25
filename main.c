/*
 * 	startup.c
 *
 


#####TODO#####
-ändra backbuffer till 64 bytes på båda sidor backbuffer[1280]

-rightshift()
-fixa paprikorna? s.a ej upponer
-includes













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
     * sprites -> backbuffer (sprites 1px bredare än nödvändigt på var sida gör att vi inte behöver clear:a Pedro)
      		* kolla nedre hörnen först, om pixeln är 1 -> Pedro.touches = 1 innan 	
	
    */
    
}


void update(){
	//
	//ändra Pedros properties
	if(backBuffer[] == 0){
		loadNewLevelSegment()
	}
	
	if(jumppressed){
		if(!Pedro.isJumping(Pedro)){
			Pedro.jump(Pedro);
		}
	}
	if(
	Pedro.move(Pedro);	//flyttar hela skärmen så det ser ut som att Pedro rör sig
	
	//win/loss
	if(Pedro.touches == 1){
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

