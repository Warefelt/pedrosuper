#ifndef KEYFUNCS_H
#define KEYFUNCS_H

void kbdActivate(unsigned int row);
int kbdGetCol();

char isUpKey();
char isRightKey();
char isLeftKey();
char isResetKey();

unsigned char keyb();


#endif //KEYFUNCS_H
