int main3(int argc, char **argv)
{
    char c;
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
    while(1){
        p->move(p);
        delaymillis(40);
        c = keyb();
        switch(c){
            case 6: 
                p->set_speed(p, 2, 0);
                break;
            case 4: 
                p->set_speed(p, -2, 0);
                break;
            case 1: 
                p->set_speed(p, 0, -2);
                break;
            case 9: 
                p->set_speed(p, 0, 2);
                break;
            
        }
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
    }
}


	for(int i = 0; i < sizeof(backBuffer)-1; i++){
		backBuffer[i] = backBuffer[i+1];
	}
	
}
