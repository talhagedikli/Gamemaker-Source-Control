if (hp <= 0)
{
	with (instance_create_layer(x,y,layer,o_dead))
	{
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction)-2;
		if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
	}
	with (mygun) instance_destroy();
	if (instance_exists(o_player)) 
	{
		global.kills ++;
		global.killsthisroom ++;
		with (o_game) killtextscale = 2;
	}
	instance_destroy();
}