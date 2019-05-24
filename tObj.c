typedef struct tObj{
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void (*draw)(struct tObj *);
	void (*clear)(struct tObj *);
	void (*move)(struct tObj *);
	void (*set_speed)(struct tObj *, int, int);
} OBJECT,*POBJECT;

void set_object_speed(POBJECT o, int vx, int vy){
	o->dirx = vx;
	o->diry = vy;
}
void draw_object(POBJECT o){
    for(int i = 0; i < sizeof(o->geo->px)/sizeof(POINT); i++){
        pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
    }
//    graphic_draw_screen();
}
void clear_object(POBJECT o){
    for(int i = 0; i < sizeof(o->geo->px)/sizeof(POINT); i++){
        pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
    }
//    graphic_draw_screen();
}
void move_object(POBJECT o){
    o->clear(o);
    o->posx += o->dirx;
    o->posy += o->diry;
    o->draw(o);
}

//definierar en boll enligt mall på sid. 113
GEOMETRY ball_geometry =
{
	12, 
	4,4,
	{
		{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}
	}
};

static OBJECT ball = {
	&ball_geometry,
	0,0,
	1,1,
	&draw_object,
	&clear_object,
	&move_object,
	&set_object_speed
};
