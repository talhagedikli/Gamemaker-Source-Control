/// @description returns a trigger buttons caption
/// @param trigger_number
function trigger_get_caption(argument0) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		return list[|argument0].caption;
	else {
		show_debug_message("Error getting caption: Trigger #" + string(argument0) + " >= trigger list sîze");
		return -1;
	}


}
