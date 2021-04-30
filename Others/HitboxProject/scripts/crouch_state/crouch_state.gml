function crouch_state() {
	xSpeed = approach(xSpeed,0,0.1);

	if(!down){
	    currentState = states.normal;
	    squash_stretch(0.8,1.2);
	}



}
