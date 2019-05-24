int main2(int argc, char **argv)
{
    char c;
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
    
    p->posx = 120;
    p->posy = 30;
	p->set_speed(p, 4, 1);
    
    while(1){
        int touches = objtouchesborder(p);
        if(touches != 0){
            switch(touches){
                case 1: 
                    p->set_speed(p, -p->dirx, p->diry);
                    break;
                case 2: 
                    p->set_speed(p, p->dirx, -p->diry);
                    break;
                
            
            }
        }
        p->move(p);
        graphic_draw_screen();
		//delaymillis(30);
    }
}
