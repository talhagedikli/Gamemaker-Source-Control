x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

if (place_meeting(x,y,p_shootable))
{
		with (instance_place(x,y,p_shootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}

	instance_destroy();
}

if (place_meeting(x,y,o_wall)) && (image_index != 0)
{
	while (place_meeting(x,y,o_wall))
	{
	x -= lengthdir_x(1,direction);
	y -= lengthdir_y(1,direction);	
	}
	spd = 0;
	instance_change(o_hitspark,true);
	layer_add_instance("Tiles",id);		//bu id bu objnin
	depth += 1;
}
	