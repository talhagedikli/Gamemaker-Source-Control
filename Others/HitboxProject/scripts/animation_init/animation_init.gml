function animation_init() {
	//initialize variables for drawing, and animation.
	//draw
	sprite = sprite_index;
	frame  = 0;
	xPos   = x;
	yPos   = y;
	xScale = 1;
	yScale = 1;
	angle  = 0;
	color  = c_white;
	alpha  = 1;

	//animation
	frameSpeed = 0.15;
	facing = 1;
	lastSprite = sprite;



}
