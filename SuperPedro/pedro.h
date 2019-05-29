#ifndef PEDRO_H
#define PEDRO_H

#define MAX_POINTS 100

#define MAX_VELX 14
#define ACCX 1
#define ACCY -0.14
#define VELY 4 //basvelocity vid hopp

typedef struct tObj{                  //Objektmall
	int height;
	int width;
	int posx, posy;
	double velx, vely;
	double accx, accy;
    int distance;
	char* sprite;
	void (*draw) (struct tObj *);
	void (*jump) (struct tObj *);
}OBJECT, *POBJECT;

void resetPedro();
void move();

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys();
void applyPhysics();
char isJumping();
char setSprite();
void draw();
void oldDraw();
char touchesPepper();
int getBottomRow(int posyposy);
int getDistance();
int getVelx();

#endif //PEDRO_H