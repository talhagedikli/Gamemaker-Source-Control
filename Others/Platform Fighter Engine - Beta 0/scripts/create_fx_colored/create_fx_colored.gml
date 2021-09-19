///@func create_fx_colored(sprite,image_speed,index,lifetime,x,y,scale,angle,[layer])
///@param sprite
///@param image_speed
///@param index
///@param lifetime
///@param x
///@param y
///@param scale
///@param angle
///@param [layer]
var _fx = instance_create_layer(argument[4], argument[5], (argument_count > 8 ? argument[8] : "FX_Layer"), obj_fx_colored);
with(_fx)
	{
	fx_index = argument[0];
	fx_speed = argument[1];
	fx_frame = argument[2];
	lifetime = argument[3];
	fx_xs = argument[6];
	fx_ys = argument[6];
	fx_ang = argument[7];
	total_life = lifetime;
	palette_sprite = other.palette_sprite;
	palette = other.palette;
	owner = other.id;
	}
return _fx;