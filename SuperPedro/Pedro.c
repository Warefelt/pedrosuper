#include "pedro.h"
#include "LcdAscii.h"


extern char backBuffer[256][8];


static volatile unsigned char pedro_still[4][20] = {{0b00000000, 0b11100000, 0b11110000, 0b11111000, 0b11111100, 0b11111110, 0b11111110, 0b11111111, 0b11111111, 0b01111111, 0b00011111, 0b00011111, 0b00001111, 0b00001110, 0b00011100, 0b00011000, 0b00110000, 0b01100000, 0b10000000, 0b00000000},
						{0b00011111, 0b01111111, 0b11111111, 0b11000111, 0b00011111, 0b00011111, 0b10000011, 0b00000001, 0b00001011, 0b00000100, 0b00100100, 0b00110100, 0b00000100, 0b00000000, 0b00000000, 0b00100100, 0b01110010, 0b10000010, 0b00000111, 0b11111000},
						{0b00000000, 0b00000000, 0b00000001, 0b00000011, 0b10000110, 0b01001100, 0b00110001, 0b00100010, 0b01000000, 0b10000000, 0b10001100, 0b00010100, 0b00101000, 0b00111000, 0b00101000, 0b00011010, 0b00000010, 0b00000001, 0b11111000, 0b00000111},
						{0b00000000, 0b00000000, 0b00000000, 0b00000110, 0b00001001, 0b00000110, 0b01111011, 0b10100100, 0b10100100, 0b11010101, 0b00111110, 0b11100101, 0b10100101, 0b10111110, 0b11000110, 0b00001010, 0b00000110, 0b00000001, 0b00000000, 0b00000000}};
static volatile unsigned char pedro_jump[4][20] = {{0b00000000, 0b11100000, 0b11110000, 0b11111000, 0b11111100, 0b11111110, 0b11111110, 0b11111111, 0b11111111, 0b01111111, 0b00011111, 0b00011111, 0b00001111, 0b00001110, 0b00011100, 0b00011000, 0b00110000, 0b01100000, 0b10000000, 0b00000000},
						{0b00011111, 0b01111111, 0b11111111, 0b11000111, 0b00011111, 0b00011111, 0b10000011, 0b00000001, 0b00001011, 0b00000100, 0b00100100, 0b00110100, 0b00000100, 0b00000000, 0b00000000, 0b00100100, 0b01110010, 0b10000010, 0b00000111, 0b11111000},
						{0b00000000, 0b00000000, 0b00000001, 0b00000011, 0b10000110, 0b01001100, 0b00110001, 0b00100010, 0b01000000, 0b10000000, 0b10001100, 0b00010100, 0b00101000, 0b00111000, 0b00101000, 0b00011010, 0b00000010, 0b00000001, 0b11111000, 0b00000111},
						{0b00000000, 0b00000000, 0b00000000, 0b01110110, 0b01001001, 0b01111110, 0b00101011, 0b00100100, 0b00010100, 0b00010101, 0b00001110, 0b00010101, 0b00010101, 0b00100110, 0b00101010, 0b00111010, 0b00100110, 0b00011101, 0b00000000, 0b00000000}};
static volatile unsigned char pedro_walk1[4][20] = {{0b00000000, 0b11100000, 0b11110000, 0b11111000, 0b11111100, 0b11111110, 0b11111110, 0b11111111, 0b11111111, 0b01111111, 0b00011111, 0b00011111, 0b00001111, 0b00001110, 0b00011100, 0b00011000, 0b00110000, 0b01100000, 0b10000000, 0b00000000},
						{0b00011111, 0b01111111, 0b11111111, 0b11000111, 0b00011111, 0b00011111, 0b10000011, 0b00000001, 0b00001011, 0b00000100, 0b00100100, 0b00110100, 0b00000100, 0b00000000, 0b00000000, 0b00100100, 0b01110010, 0b10000010, 0b00000111, 0b11111000},
						{0b00000000, 0b00000000, 0b00000001, 0b10000011, 0b01000110, 0b00101100, 0b10110001, 0b00100010, 0b01000000, 0b10000000, 0b10001100, 0b00010100, 0b00101000, 0b00111000, 0b00101000, 0b00011010, 0b00000010, 0b00000001, 0b11111000, 0b00000111},
						{0b00000000, 0b00000000, 0b00000000, 0b00000111, 0b00001010, 0b00000101, 0b00011011, 0b01100100, 0b10100100, 0b10110101, 0b11011110, 0b10100101, 0b10110101, 0b11001110, 0b00000110, 0b00001010, 0b00000110, 0b00000001, 0b00000000, 0b00000000}};
static volatile unsigned char pedro_walk2[4][20] = {{0b00000000, 0b11000000, 0b11100000, 0b11110000, 0b11111000, 0b11111100, 0b11111100, 0b11111110, 0b11111110, 0b11111110, 0b00111110, 0b00111110, 0b00011110, 0b00011100, 0b00111000, 0b00110000, 0b01100000, 0b11000000, 0b00000000, 0b00000000},
						{0b00111110, 0b11111111, 0b11111111, 0b10001111, 0b00111111, 0b00111111, 0b00000111, 0b00000011, 0b00010111, 0b00001000, 0b01001000, 0b01101000, 0b00001000, 0b00000000, 0b00000000, 0b01001000, 0b11100100, 0b00000100, 0b00001111, 0b11110000},
						{0b00000000, 0b00000000, 0b00000011, 0b00000111, 0b11001100, 0b00111000, 0b10100011, 0b01000100, 0b10000000, 0b00000000, 0b00011000, 0b00101000, 0b01010000, 0b01110000, 0b01010000, 0b00110100, 0b00000100, 0b00000011, 0b11110000, 0b00001111},
						{0b00000000, 0b00000000, 0b00000000, 0b00000000, 0b00000000, 0b01110011, 0b10101110, 0b10100101, 0b11010110, 0b00001011, 0b00011101, 0b11100110, 0b10100110, 0b10111100, 0b11000100, 0b00000100, 0b00000100, 0b00000010, 0b00000001, 0b00000000}};



static OBJECT Pedro = 
{
	32,
 20,				//height, width
	32,
    0,				//initial startposition
	0,
    0,				//Hastighet
	0,
    0,				//Acceleration
    0,
	&pedro_still,		//Sprite
	&draw,
	0, 
    /*komplettera?*/
};


void move(){								//Kollar knapptryck och uppdaterar alla Pedros värden
    
    checkKeys();

    applyPhysics();
    
    if(Pedro.velx > 0){
        shiftLeft();
        delaymillis(200/Pedro.velx);
        Pedro.distance++;
    }
    else if(Pedro.velx < 0){
        shiftRight();
        delaymillis(200/(-Pedro.velx));
        Pedro.distance++;

    }
    graphic_draw_screen();
    draw(&Pedro);  //extra args? FLYTTA? han kan ritas ut med resten av skärmen_________________________________________________________________________________* 

}

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys(){
    if(isRightKey() && !isLeftKey()){     //Kräver importerad keyb
		if(Pedro.velx < MAX_VELX){
			Pedro.accx = ACCX;     //accelerate right
		}
		else{
			Pedro.accx = 0;
		}
	}
	else if(!isRightKey() && isLeftKey())
	{
		if(Pedro.velx > -MAX_VELX){
			Pedro.accx = -ACCX;    //accelerate left
		}
		else{
			Pedro.accx = 0;
		}
	}
	else                            //decrease velocity
	{
		Pedro.accx = 0;
		if(Pedro.velx > 0){
			Pedro.velx -= ACCX;
		}
		if(Pedro.velx < 0){
			Pedro.velx += ACCX;
		}
	}
    
    if(isJumping()){
        Pedro.accy = 1;
    }
    else {  //Pedro on ground
        Pedro.accy = 0;
        if(isUpKey()){
			Pedro.vely = VELY;    //jump
            Pedro.accy = 1;
            Pedro.sprite = pedro_jump;
		}
	}
    
}

void applyPhysics(){
    //physics
    Pedro.velx += Pedro.accx;
    
    Pedro.vely += Pedro.accy;
	Pedro.posy += Pedro.vely;
    
}

char isJumping(){
    return Pedro.posy < 0;       //groundlvl+pedroheight
}


#define distanceBetweenAnimationChange 4
char facingLeft = 0;
void setSprite(POBJECT Pedro){
	if(Pedro->velx > 0){
		facingLeft = 0;
	}
	if(Pedro->velx < 0){
		facingLeft = 1;
	}
	if(Pedro->posy > 0){
		Pedro->sprite = pedro_jump;
	}
	else if(Pedro->velx == 0){
		Pedro->sprite = pedro_still;
	}
	else if((getDistance()/distanceBetweenAnimationChange)%2){
		Pedro->sprite = pedro_walk2;
	}
	else{
		Pedro->sprite = pedro_walk1;
	}
}

void draw(POBJECT object){
	setSprite(object);
	
	 unsigned char i, j;
	 unsigned char* man = object->sprite;
	 int shift = object->posy%8;
        for(j = 0; j < ((object->height)/8)+1; j++) {
			if(!(object->posy+object->height > 64 && j < ((64-object->posy)/8))){						//If page is over his bottom position
				graphic_write_command(LCD_SET_PAGE | (((63-object->posy-object->height)/8)+j), B_CS1);
				graphic_write_command(LCD_SET_ADD | object->posx, B_CS1);
				for(i = 0; i < object->width; i++) {
					if(j == 0){
						unsigned char* adress;
						if(facingLeft){
							adress = (man+((19-j)*object->width)+i);
						}
						else{
							adress = (man+(j*object->width)+i);
						}
						unsigned char byte = *adress;
						byte = byte<<(8-shift);
						graphic_write_data(byte, B_CS1);
					}
					else{					//Not above head
						unsigned char* adress;
						if(facingLeft){
							adress = (man+((19-(j-1))*object->width)+i);
						}
						else{
							adress = (man+((j-1)*object->width)+i);
						}
						unsigned char byte = *adress;
						byte = byte>>(shift);
						if(j < (object->height)/8){
							unsigned char tillagg = *(adress+object->width);
							tillagg &= (0xFF>>(8-shift));		//nollställer överblivna bitar som ej ingår i bildförskjutningen
							tillagg = tillagg<<(8-shift);
							byte |= tillagg;
						}
						byte |= backBuffer[64+(object->posx)+i][7-(object->posy)/8];
						graphic_write_data(byte, B_CS1);
					}
				}
			}
        }
}


char touchesPepper(){
    //kolla nedre hörnen (om Pedro bredare än 16px även i mitten) först, om pixeln är 1 -> Pedro.touches = 1 innan
    //jfr pedrobyte & backbufferbyte
    return 0;
}

int getDistance(){
    return Pedro.distance;
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
