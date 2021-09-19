///@func ripple_effect_destroy(system_index,effect_index)
///@args system_index,effect_index
var _map = argument[0];
var _list = _map[? "List"];
ds_list_delete(_list,argument[1]);
return;