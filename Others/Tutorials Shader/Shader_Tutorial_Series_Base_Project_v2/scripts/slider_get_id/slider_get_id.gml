/// @description returns a sliders instance id
/// @param slider_number
function slider_get_id(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0]; //.id
	else {
		show_debug_message("Error getting id: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
