///@func ripple_system_destroy(system_index)
///@args system_index
///@desc Frees the memory taken up by the ripple data
var _system = argument[0];
if (ds_exists(_system,ds_type_map))
	{
	if (surface_exists(_system[? "Surface"]))
		{
		surface_free(_system[? "Surface"]);
		}
	ds_map_destroy(_system);
	return true;
	}
return false;