///@func ripple_system_init(width,height)
///@args width,height
///@desc Sets up instances variables for the instance to be able to use the other ripple functions
enum RIPPLE
	{
	X,
	Y,
	StartX,
	StartY,
	Attached,
	MinSize,
	MaxSize,
	Size,
	MinColor,
	MaxColor,
	Color,
	MinAlpha,
	MaxAlpha,
	Alpha,
	Lifetime,
	MaxLife,
	Length,
	}
var _system = ds_map_create();
ds_map_add_list(_system,"List",ds_list_create());
_system[? "Surface"] = surface_create(argument[0],argument[1]);
_system[? "Surface_Size"] = [argument[0],argument[1]];
return _system;