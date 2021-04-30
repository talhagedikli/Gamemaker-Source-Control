/// @description returns a trigger buttons instance id
/// @param trigger_number
function trigger_get_id(argument0) {

	var list = global.trigger;
	if (argument0 < ds_list_size(list))
		return list[|argument0]; //.id
	else {
		show_debug_message("Error getting id: Trigger #" + string(argument0) + " >= trigger list sîze");
		return -1;
	}


}
