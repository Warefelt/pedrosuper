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

void move(POBJECT Pedro);

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys(POBJECT Pedro);
void applyPhysics(POBJECT Pedro);
void isJumping(POBJECT Pedro);
void draw(POBJECT object);
int touchesPepper(POBJECT Pedro);

#endif //PEDRO_H