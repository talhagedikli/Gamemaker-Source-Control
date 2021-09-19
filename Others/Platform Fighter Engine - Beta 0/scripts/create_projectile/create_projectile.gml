///@func create_projectile(rel_x,rel_y,xscale,yscale,damage,base_kb,kb_scaling,angle,lifetime,shape,hsp,vsp,[flipper]);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param damage
///@param base_kb
///@param kb_scaling
///@param angle
///@param lifetime
///@param shape
///@param hsp
///@param vsp
///@param [flipper]
var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_projectile);
with(_newhitbox)
	{
	image_xscale = argument[2];
	image_yscale = argument[3];
	damage = argument[4];
	base_knockback = argument[5];
	knockback_scaling = argument[6];
	angle = argument[7];
	grounded_angle = angle;
	lifetime = argument[8];
	hitbox_set_property(id, HITBOX_PROPERTY.shape, argument[9]);
	owner = other.id;
	//owner_xstart = other.x;
	//owner_ystart = other.y;
	facing = other.facing;
	hsp = argument[10] * other.facing;
	vsp = argument[11];
	angle_flipper = argument_count > 12 ? argument[12] : FLIPPER.standard;
	drawing_angle = angle_flipper == FLIPPER.standard ? apply_angle_flipper(angle, angle_flipper, owner) : angle;
	//palette_sprite = other.palette_sprite;
	//palette = other.palette;
	//owner_color = other.player_color;
	}
return _newhitbox;