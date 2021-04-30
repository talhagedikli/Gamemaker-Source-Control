/// @description sets a trigger buttons caption
/// @param trigger_number
/// @param caption_string
function trigger_set_caption(argument0, argument1) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		list[|argument0].caption = string(argument1);
	else
		show_debug_message("Error setting caption: Trigger #" + string(argument0) + " >= trigger list size");




}
