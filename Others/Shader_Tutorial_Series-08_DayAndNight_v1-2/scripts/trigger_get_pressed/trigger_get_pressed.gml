/// @description returns if trigger button was just pressed
/// @param trigger_number
function trigger_get_pressed(argument0) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		return list[|argument0].mouse_pressed;
	else {
		show_debug_message("Error getting pressed state: Trigger #" + string(argument0) + " >= trigger list sîze");
		return -1;
	}


}
