if (place_meeting(x,y,p_shootable))
{ 
	with (instance_place(x,y,p_shootable))		///collision da değiliz ondan "other" yazma
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}


if (place_meeting(x,y,o_wall)) && (image_index != 0) instance_destroy();