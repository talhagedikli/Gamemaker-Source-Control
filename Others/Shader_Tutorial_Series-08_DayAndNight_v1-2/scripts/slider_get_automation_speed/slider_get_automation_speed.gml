/// @description returns if a sliders automation speed
/// @param slider_number
function slider_get_automation_speed(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].automation_spd;
	else {
		show_debug_message("Error getting automation speed: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
