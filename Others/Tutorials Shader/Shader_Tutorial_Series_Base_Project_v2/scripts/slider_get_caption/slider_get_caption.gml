/// @description returns a sliders caption
/// @param slider_number
function slider_get_caption(argument0) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		return list[|argument0].caption;
	else {
		show_debug_message("Error getting caption: Slider #" + string(argument0) + " >= slider list sîze");
		return -1;
	}


}
