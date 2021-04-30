/// @description returns if a sliders value should be drawn
/// @param slider_number
function slider_get_draw_value(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].show_value;
	else {
		show_debug_message("Error getting show_value toggle: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
