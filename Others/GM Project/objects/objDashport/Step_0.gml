//variables
var _partSystem = global.partSystem;
var _partType = global.ptDashPixels;
var _x = x;
var _y = y - sprite_yoffset/2;


//animation speed
frame += frameSpeed;

//pixel particles
if (objPlayer.dashportCounter mod 20 == 0)
{
	part_particles_create(_partSystem, _x, _y, _partType, 1);
}

 //fade out
 if (fadeOut = true) 
{
	alpha -= 0.05;
	speed = approach(speed, 0, dSpeed);
	
	if (alpha = 0.1)
	{
		fadeOut = false;
		objPlayer.dashportCounter = 0;
		instance_destroy();
	}
}

//bounce from wall
if (place_meeting(x+facing, y, objGround))
{
	direction = 180 - direction;
	squash_stretch(0.6, 1.4);
}
 
//tracking position
xPos = x;
yPos = y;

//back to original scale
xScale = approach(xScale, 1, 0.05);
yScale = approach(yScale, 1, 0.05);