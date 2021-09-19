///@func hitbox_group_reset(group_number,[collided_list])
///@param group_number
///@param [collided_list]
//Clears a single hitbox group list
var _col = argument_count > 1 ? argument[1] : collided;
var _list = _col[|argument[0]];
ds_list_clear(_list);