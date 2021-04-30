function animation_control() {
	xScale = approach(xScale,1,0.03);
	yScale = approach(yScale,1,0.03);

	//animation control    
	switch currentState {
	    case states.normal:
	        if(left){
	            facing = -1;
	        }else if(right){
	            facing = 1;
	        }
        
	        if(onGround){
	            if(left || right){
	                sprite = sprPlayer_Run;
	            }else{
	                sprite = sprPlayer_Idle;
	            }
	        }else{
	            sprite = sprPlayer_Jump;
	            if(ySpeed < -1){
	                frame = 0;
	            }else if(ySpeed > 1){
	                frame = 1;
	            }else{
	                frame = 2;
	            }
	        }
	    break;

	    case states.crouch:
	        sprite = sprPlayer_Crouch;
	    break;

	    case states.attack:
	        sprite = sprPlayer_Attack;
	    break;
	}

	//reset frame to 0 if sprite changes
	if(lastSprite != sprite){
	    lastSprite = sprite;
	    frame = 0;
	}



}
