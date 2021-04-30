///@description registers a new slider to the slider list
function slider_sys_register() {
	// needs to be and must only be called in the create event of the slider object

	var num	= ds_list_size(global.slider);
	ds_list_add(global.slider, id);
	return num;


}
