char isUpKey(){
	kbdActivate(3);	//row3
	kbdActivate(4);         //power off kbd-rows
	if(kbdGetCol() == 3){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
	return 0;
}
char isRightKey(){
	kbdActivate(4);
	if(kbdGetCol() == 4){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
return 0;
	
}
char isLeftKey(){
	kbdActivate(4);
	if(kbdGetCol() == 2){
		kbdActivate(0);         //power off kbd-rows
		return 1;
	}
	return 0;
	
}
