/// @description returns if a slider was just released
/// @param slider_number
function slider_get_released(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].mouse_released;
	else {
		show_debug_message("Error getting released state: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
