function normal_state() {
	//movement
	if(left){
	    xSpeed = approach(xSpeed,-mSpeed,aSpeed);
	}else if(right){
	    xSpeed = approach(xSpeed,mSpeed,aSpeed);
	}else{
	    xSpeed = approach(xSpeed,0,dSpeed);
	}

	//don't run off the screen!
	move_wrap(1,1,sprite_width);

	//accel and decel control
	if(onGround){
	    aSpeed = groundAccel;
	    dSpeed = groundDecel;
	}else if(!onGround){
	    aSpeed = airAccel;
	    dSpeed = airDecel;
	}

	//jump
	if(onGround){
	    if(up){
	        ySpeed = jPower;
	        squash_stretch(0.7,1.3);
	    }
	}

	//variable jump height
	if(!onGround){
	    if(ySpeed < 0 && !up){
	        ySpeed *= 0.5;
	    }
	}

	//change to crouch state
	if(down){
	    currentState = states.crouch;
	    squash_stretch(1.3,0.7);
	}

	//change to attack state
	if(attack){
	    currentState = states.attack;
	}

	//landed
	if(onGround){
	    if(!landed){
	        squash_stretch(1.3,0.7);
	        landed = true;
	    }
	}

	if(!onGround){
	    landed = false;
	}



}
