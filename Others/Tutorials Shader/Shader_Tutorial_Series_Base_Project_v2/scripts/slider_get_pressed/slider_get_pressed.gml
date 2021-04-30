/// @description returns if a slider was just pressed
/// @param slider_number
function slider_get_pressed(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].mouse_pressed;
	else {
		show_debug_message("Error getting pressed state: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
