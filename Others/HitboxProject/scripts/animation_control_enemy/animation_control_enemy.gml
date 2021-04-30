function animation_control_enemy() {
	xScale = approach(xScale,1,0.03);
	yScale = approach(yScale,1,0.03);

	//animation control    
	switch currentState {
	    case states.normal:
	        sprite = sprEnemy_Idle;
	    break;

	    case states.hit:
	        sprite = sprEnemy_Hurt;
	    break;
	}

	//reset frame to 0 if sprite changes
	if(lastSprite != sprite){
	    lastSprite = sprite;
	    frame = 0;
	}



}
