/// @description sets a sliders value
/// @param slider_number
/// @param value[0-1]
function slider_set_value(argument0, argument1) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		list[|argument0].value = clamp(argument1, 0, 1);
	else
		show_debug_message("Error setting value: Slider #" + string(argument0) + " >= slider list size");




}
