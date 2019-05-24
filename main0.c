int main0(int argc, char **argv) //45
{
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
    p->set_speed(p, 4, 1);
    while(1){
        p->move(p);
    }
}
