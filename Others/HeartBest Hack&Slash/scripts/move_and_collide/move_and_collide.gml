// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@function				move_and_collide(_xspeed, _yspeed);
///@param {real} _xspeed	horizontal speed	
///@param {real} _yspeed	vertical speed

function move_and_collide(_xspeed, _yspeed)
{
	if not place_meeting(x+_xspeed, y, o_wall)
	{
		x += _xspeed;
	}

	if not place_meeting(x, y+_yspeed, o_wall)
	{
		y += _yspeed;
	}
}
	