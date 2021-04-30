/// @description returns a sliders value
/// @param slider_number
function slider_get_value(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].value;
	else {
		show_debug_message("Error getting value: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
