///@func hitbox_group_reset_all([collided_list])
///@param [collided_list]
//Loops through all lists and clears them
var _col_list = argument_count > 0 ? argument[0] : collided;
var _list;
for(var i = 0; i < ds_list_size(_col_list); i++)
	{
	_list = _col_list[| i];
	ds_list_clear(_list);
	}
_list = -1;