///@func create_grab(rel_x,rel_y,xscale,yscale,xhold,yhold,lifetime,shape);
///@param rel_x
///@param rel_y
///@param xscale
///@param yscale
///@param xhold
///@param yhold
///@param lifetime
///@param shape
var _newhitbox = instance_create_layer(x + argument[0] * facing, y + argument[1], layer, obj_grab);
with(_newhitbox)
	{
	image_xscale = argument[2];
	image_yscale = argument[3];
	grab_destination_x = argument[4];
	grab_destination_y = argument[5];
	lifetime = argument[6];
	hitbox_set_property(id, HITBOX_PROPERTY.shape, argument[7]);
	owner = other.id;
	owner_xstart = other.x;
	owner_ystart = other.y;
	facing = other.facing;
	}
ds_list_add(my_hitboxes, _newhitbox);
return _newhitbox;