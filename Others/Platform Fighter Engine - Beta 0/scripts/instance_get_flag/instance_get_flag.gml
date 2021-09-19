///@func instance_get_flag(id,flag_index)
///@param id
///@param flag_index
if (instance_exists(argument0))
	{
	return argument0.flags & (1 << argument1);
	}
return false;