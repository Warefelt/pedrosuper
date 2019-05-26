#include "pedro.h"


#define MAX_POINTS 100


#define MAX_VELX 4
#define ACCX 1
#define VELY -10 //basvelocity vid hopp




static OBJECT Pedro = 
{
	32, 20,				//height, width
	0,32,				//initial startposition
	0,0,				//Hastighet
	0,0,				//Acceleration
	{0},		//Sprite
	&draw,
	0, 
    /*komplettera?*/
};


void move(POBJECT Pedro){								//Kollar knapptryck och uppdaterar alla Pedros värden
    
    checkKeys(Pedro);

    applyPhysics(Pedro);
    
    if(Pedro->velx > 0){
        shiftLeft();
    }
    else if(Pedro->velx < 0){
        shiftRight();
    }
    graphic_draw_screen();
    Pedro->draw(Pedro);  //extra args? FLYTTA? han kan ritas ut med resten av skärmen_________________________________________________________________________________* 

}

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys(POBJECT Pedro){
    if(isRightKey() && !isLeftKey()){     //Kräver importerad keyb
		if(Pedro->velx < MAX_VELX){
			Pedro->accx = ACCX;     //accelerate right
		}
		else{
			Pedro->accx = 0;
		}
	}
	else if(!isRightKey() && isLeftKey())
	{
		if(Pedro->velx > -MAX_VELX){
			Pedro->accx = -ACCX;    //accelerate left
		}
		else{
			Pedro->accx = 0;
		}
	}
	else                            //decrease velocity
	{
		Pedro->accx = 0;
		if(Pedro->velx > 0){
			Pedro->velx -= ACCX;
		}
		if(Pedro->velx < 0){
			Pedro->velx += ACCX;
		}
	}
    
    if(Pedro->isJumping(Pedro)){
        Pedro->accy = 1;
    }
    else {  //Pedro on ground
        Pedro->accy = 0;
        if(isUpKey()){
			Pedro->vely = VELY;    //jump
            Pedro->accy = 1;
		}
	}
    
}

void applyPhysics(POBJECT Pedro){
    //physics
    Pedro->velx += Pedro->accx;
	Pedro->posx += Pedro->velx;
    
    Pedro->vely += Pedro->accy;
	Pedro->posy += Pedro->vely;
    
}

void isJumping(POBJECT Pedro){
    return Pedro->posy < .....//groundlvl+pedroheight
}



void draw(POBJECT object){		//Ritar ut pedro enligt hans position och utseende. Dessa står fria att ändras i andra metoder
	 unsigned char i, j;
	 unsigned char* man = object->sprite;
        for(j = 0; j < (object->height)/8; j++) {
            graphic_write_command(LCD_SET_PAGE | (((63-object->posy-object->height)/8)+j), B_CS1);
            graphic_write_command(LCD_SET_ADD | object->posx, B_CS1);
            for(i = 0; i < object->width; i++) {
				unsigned char byte = *(man+(j*object->width)+i);
                graphic_write_data(byte, B_CS1);
            }
        }
}

int touchesPepper(POBJECT Pedro){
    //kolla nedre hörnen (om Pedro bredare än 16px även i mitten) först, om pixeln är 1 -> Pedro->touches = 1 innan
    //jfr pedrobyte & backbufferbyte
}
/*
int objtouchesborder(POBJECT o){
    if((o->posx < 1) || (o->posx + o->width) > 128 ){
        return 1;
    }
    else if((o->posy < 1) || (o->posy + o->height) > 64){
        return 2;
    }
    return 0;
}
*/