
unsigned char keyb(){
    char key[] = {1,2,3,10,4,5,6,11,7,8,9,12,14,0,15,13};
    int row;
    int col = 0;
    
    for(row = 1; row <= 4; row++){
        kbdActivate(row);           //power kbd-rows
        if(col = kbdGetCol()){      //drain kbd-cols
            kbdActivate(0);         //power off kbd-rows
            return (4*(row-1)+(col-1));
        }
    }
    return 0xFF;
}

void out7seg(unsigned char c){
        
    char arr7seg[] = {0x06, 0x5B, 0x4F, 0x77, 0x66, 0x6D, 0x7D, 0x7C, 0x07, 0x7F, 0x67, 0x39, 0x79, 0x3F, 0x71, 0x5E};
    
    if(c <= 15){
        GPIO_D->odrLow = arr7seg[c];
    }
    else{
        GPIO_D->odrLow = 0;
    }
        
}

void kbdActivate(unsigned int row){
    switch(row){
        case 1: 
            GPIO_D->odrHigh = 0x10;
            break;
        case 2: 
            GPIO_D->odrHigh = 0x20;
            break;
        case 3: 
            GPIO_D->odrHigh = 0x40;
            break;
        case 4: 
            GPIO_D->odrHigh = 0x80;
            break;
        default: 
            GPIO_D->odrHigh = 0;
    }
}

int kbdGetCol(){                    
    if(GPIO_D->idrHigh & 8) 
        return 4;
    if(GPIO_D->idrHigh & 4) 
        return 3;
    if(GPIO_D->idrHigh & 2) 
        return 2;
    if(GPIO_D->idrHigh & 1) 
        return 1;
    return 0;
}

