/// @description sets if a sliders value should be drawn
/// @param slider_number
/// @param true/false
function slider_set_draw_value(argument0, argument1) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		list[|argument0].show_value = argument1;
	else
		show_debug_message("Error setting show_value toggle: Slider #" + string(argument0) + " >= slider list size");




}
