///@func hitbox_group_whitelist_id(id, group, [collided_list])
///@param id
///@param group
///@param [collided_list]

var _id = argument[0];
var _group = argument[1];
var _list = argument_count > 2 ? argument[2] : collided;

ds_list_add(_list[| _group], _id); 