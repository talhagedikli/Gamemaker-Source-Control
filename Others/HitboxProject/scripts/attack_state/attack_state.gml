function attack_state() {
	xSpeed = 0.2*facing;

	if(floor(frame) == sprite_get_number(sprite)){
	    currentState = states.normal;
	}

	//create hitbox on the right frame
	if(frame == 3 && hitbox == -1){
	    hitbox = hitbox_create(20 * facing,12,-3 * facing,-16,8,3 * facing,45);
	}



}
