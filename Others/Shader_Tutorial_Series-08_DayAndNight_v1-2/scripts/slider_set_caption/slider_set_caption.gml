/// @description sets a sliders caption
/// @param slider_number
/// @param caption_string
function slider_set_caption(argument0, argument1) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		list[|argument0].caption = string(argument1);
	else
		show_debug_message("Error setting caption: Slider #" + string(argument0) + " >= slider list size");




}
