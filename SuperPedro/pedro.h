#ifndef PEDRO_H
#define PEDRO_H

#define MAX_POINTS 100

#define MAX_VELX 4
#define ACCX 1
#define VELY -10 //basvelocity vid hopp

typedef struct tObj{                  //Objektmall
	int height;
	int width;
	int posx, posy;
	int velx, vely;
	int accx, accy;
	char* sprite[MAX_POINTS];
	void (*draw) (struct tObj *);
	void (*jump) (struct tObj *);
}OBJECT, *POBJECT;

void move();

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys();
void applyPhysics();
char isJumping();
void draw();
char touchesPepper();

#endif //PEDRO_H