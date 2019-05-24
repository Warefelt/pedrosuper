void main(void){
    unsigned int i;
    app_init(); //Står init_app()
    graphic_initialize();
    #ifdef NONSIMULATOR
    graphic_clear_screen();
    #endif
    for (i=0; i<128; i++)
        pixel(i,10,1);
    for (i=0; i<64; i++)
        pixel(10,i,1);
    delaymillis(500);
    for (i=0; i<128; i++)
        pixel(i,10,0);
    for (i=0; i<64; i++)
        pixel(10,i,0);
}
