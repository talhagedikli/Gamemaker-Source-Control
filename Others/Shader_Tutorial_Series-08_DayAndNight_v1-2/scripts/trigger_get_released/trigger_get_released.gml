/// @description returns if trigger button was just released
/// @param trigger_number
function trigger_get_released(argument0) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		return list[|argument0].mouse_released;
	else {
		show_debug_message("Error getting released state: Trigger #" + string(argument0) + " >= trigger list sîze");
		return -1;
	}


}
