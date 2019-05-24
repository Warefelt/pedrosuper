typedef struct tPoint
{
	unsigned char x;
	unsigned char y;
} POINT;

#define MAX_POINTS 20

typedef struct tGeometry
{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[MAX_POINTS];
}	GEOMETRY,*PGEOMETRY