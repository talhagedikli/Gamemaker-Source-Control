/// @description check 1 pixel collisions
//
function check_collisions_classic(){
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

/// @description check 1 pixel collisions
//
function check_collisions_pixel_perfect(){

	//I think this is better calculation for single mask
	var sprite_bbox_top		= sprite_get_bbox_top(sprite_index)		- sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom	= sprite_get_bbox_bottom(sprite_index)	- sprite_get_yoffset(sprite_index);
	var sprite_bbox_right	= sprite_get_bbox_right(sprite_index)	- sprite_get_xoffset(sprite_index);
	var sprite_bbox_left	= sprite_get_bbox_left(sprite_index)	- sprite_get_xoffset(sprite_index);

	//Horizontal collisions
	x += xSpeed;

	//Snap
	if place_meeting(x + sign(xSpeed), y, objGround) {
	    var wall = instance_place(x + sign(xSpeed), y, objGround);
	    if (xSpeed > 0)
		{ //right
	        x = (wall.bbox_left - 1) - sprite_bbox_right;
	    } 
		else if (xSpeed < 0)
		{ //left
	        x = (wall.bbox_right + 1) - sprite_bbox_left;
	    }
	    xSpeed = 0;
	}

	//Vertical collisions
	y += ySpeed;

	//Snap
	if place_meeting(x, y, objGround) {
	    var wall = instance_place(x, y, objGround);
	    if (ySpeed > 0)
		{ //down
	        y = (wall.bbox_top-1) - sprite_bbox_bottom;
	    }
		else if (ySpeed< 0)
		{ //up
	        y = (wall.bbox_bottom+1) - sprite_bbox_top;
	    }
	    ySpeed = 0;
}

}