/// @description <Run by obj_game>
//Move
x += hsp;
y += vsp;
//Frame increase
fx_frame += fx_speed * sprite_get_speed(fx_index) / (sprite_get_speed_type(fx_index) == spritespeed_framespergameframe ? 1 : room_speed);
if (fx_frame > sprite_get_number(fx_index))
	{
	fx_frame -= sprite_get_number(fx_index);
	}
//Following
if (instance_exists(follow))
	{
	x = follow.x;
	y = follow.y;
	if (follow.hsp != 0 || follow.vsp != 0)
		{
		fx_ang = point_direction(0, 0, follow.hsp, follow.vsp);
		}
	}
//Shrinking
if (shrink != 0)
	{
	fx_xs *= shrink;
	fx_ys *= shrink;
	}
//Spinning
fx_ang += spin;
//lifetime / Time
if (--lifetime < 0)
	{
	instance_destroy();
	}