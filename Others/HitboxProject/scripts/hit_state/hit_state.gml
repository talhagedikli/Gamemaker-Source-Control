function hit_state() {
	xSpeed = approach(xSpeed,0,0.1);

	hitStun --;

	if(hitStun <= 0){
	    currentState = states.normal;
	}



}
