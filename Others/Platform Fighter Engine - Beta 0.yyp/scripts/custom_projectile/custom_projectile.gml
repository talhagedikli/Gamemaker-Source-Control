///@func custom_projectile(object,rel_x,rel_y,xscale,yscale,damage,knockback,scaling,angle,lifetime,shape,hsp,vsp,[flipper]);
///@param object
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param knockback
///@param scaling
///@param angle
///@param lifetime
///@param shape
///@param hsp
///@param vsp
///@param [flipper]
///@desc Creates a custom object but initializes it like a projectile.
function custom_projectile() {
	var _newhitbox = instance_create_layer(x + argument[1] * facing, y + argument[2], layer, argument[0]);
	with(_newhitbox)
		{
		image_xscale = argument[3];
		image_yscale = argument[4];
		damage = argument[5];
		base_knockback = argument[6];
		knockback_scaling = argument[7];
		angle = argument[8];
		grounded_angle = angle;
		lifetime = argument[9];
		shape = argument[10];
		owner = other.id;
		owner_xstart = other.x;
		owner_ystart = other.y;
		facing = other.facing;
		hsp = argument[11] * other.facing;
		vsp = argument[12];
		angle_flipper = argument_count > 13 ? argument[13] : FLIPPER.standard;
		drawing_angle = angle_flipper == FLIPPER.standard ? apply_angle_flipper(angle, angle_flipper, owner) : angle;
		palette_sprite = other.palette_sprite;
		palette = other.palette;
		owner_color = other.player_color;
		}
	return _newhitbox;


}
