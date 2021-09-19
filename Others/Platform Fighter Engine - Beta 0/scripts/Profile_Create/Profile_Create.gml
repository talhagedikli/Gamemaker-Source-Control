///@func Profile_Create(name,wins,games_played,custom_controls,favorite_skins,color,auto)
///@param name
///@param wins
///@param games_played
///@param custom_controls
///@param favorite_skins
///@param color
///@param auto
var _new = ds_list_create();
ds_list_add(_new, argument0);
ds_list_add(_new, argument1);
ds_list_add(_new, argument2);
ds_list_add(_new, argument3);
ds_list_mark_as_map(_new, 3); //Mark the custom controls as a map
ds_list_add(_new, argument4);
ds_list_add(_new, argument5);
ds_list_add(_new, argument6);
ds_list_add(global.profiles, _new);
ds_list_mark_as_list(global.profiles, ds_list_size(global.profiles) - 1);
return ds_list_size(global.profiles) - 1;