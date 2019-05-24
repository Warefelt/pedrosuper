int main4(){
	char c;
    POBJECT p = &ball;
    app_init();
    graphic_initialize();
    graphic_clear_screen();
	
	while(1){
		loadPepper();
		for(int i = 0; i < 32; i++){
		
			bufferShift();
			graphic_draw_screen();
			delaymillis(20); 		//kan tas bort
		}
	}
}

