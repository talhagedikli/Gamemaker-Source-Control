/// @description check 1 pixel collisions
//
function check_collisions(){
	//horizontal collision
	if (place_meeting(x+xSpeed, y, objGround))
	{
		while (!place_meeting(x+sign(xSpeed), y, objGround))
		{
			x = x + sign(xSpeed);
		}
		xSpeed = 0;
	}
	//applying xSpeed
	x = x + xSpeed;

	//vertical collision
	if (place_meeting(x, y+ySpeed, objGround))
	{
		while (!place_meeting(x, y+sign(ySpeed), objGround))
		{
			y = y + sign(ySpeed);
		}
		ySpeed = 0;
	}
	//applying ySpeed
	y = y + ySpeed;

}