int objtouchesborder(POBJECT o){
    if((o->posx < 1) || (o->posx + o->geo->sizex) > 128 ){
        return 1;
    }
    else if((o->posy < 1) || (o->posy + o->geo->sizey) > 64){
        return 2;
    }
    return 0;
}
