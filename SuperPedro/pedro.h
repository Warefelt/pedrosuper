#ifndef PEDRO_H
#define PEDRO_H

#define MAX_POINTS 100

#define MAX_VELX 4
#define ACCX 1
#define ACCY -1
#define VELY 10 //basvelocity vid hopp

typedef struct tObj{                  //Objektmall
	int height;
	int width;
	int posx, posy;
	int velx, vely;
	int accx, accy;
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
void draw();
void oldDraw();
char touchesPepper();
int getBottomRow(int posyposy);
int getDistance();
int getVelx();

#endif //PEDRO_H