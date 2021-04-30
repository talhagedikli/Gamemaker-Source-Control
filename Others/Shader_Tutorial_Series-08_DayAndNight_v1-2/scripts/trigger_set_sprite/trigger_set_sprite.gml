/// @description sets a trigger buttons sprite
/// @param trigger_number
/// @param sprite_id
function trigger_set_sprite(argument0, argument1) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		with (list[|argument0]) {
			sprite_index = argument1;
			button_sys_set_dimensions();
		}
	else
		show_debug_message("Error setting sprite: Trigger #" + string(argument0) + " >= trigger list size");




}
