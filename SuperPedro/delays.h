#ifndef DELAYS_H
#define DELAYS_H


#define STK_CTRL ((volatile unsigned int*) 0xE000E010)
#define STK_LOAD ((volatile unsigned int*) 0xE000E014)
#define STK_VAL ((volatile unsigned int*) 0xE000E018)



void delay_250ns();
void delay_500ns();
void delaymicros(int micros);
void delaymillis(int millis);






#endif //DELAYS_H
