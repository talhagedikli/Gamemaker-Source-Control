/// @description sets a sliders automation type
function slider_set_automation_type(argument0, argument1) {
	// this will not topggle the automation, but set it's speed then automation is on
	/// @param slider_number
	/// @param automation_type[0,1,2]
	//		0: off | 1: back and forth | 2: cycle

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		list[|argument0].automation_type = clamp(round(argument1), 0, 2);
	else
		show_debug_message("Error setting automation type: Slider #" + string(argument0) + " >= slider list size");




}
