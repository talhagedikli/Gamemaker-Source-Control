///@description registers a new trigger button to the trigger list
function trigger_sys_register() {
	// needs to be and must only be called in the create event of the trigger object

	var num	= ds_list_size(global.trigger);
	ds_list_add(global.trigger, id);
	return num;


}
