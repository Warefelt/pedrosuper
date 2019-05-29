#ifndef PEDRO_H
#define PEDRO_H

#define MAX_POINTS 100

#define MAX_VELX 4
#define ACCX 1
#define ACCY -0.25
#define VELY 5 //basvelocity vid hopp

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

void move();

//check keypresses and change pedros properties (acceleration for <- ^ -> and velocity for ^) accordingly
void checkKeys();
void applyPhysics();
char isJumping();
void draw();
char touchesPepper();
int getBottomRow(int posyposy);
int getDistance();
int getVelx();

#endif //PEDRO_H