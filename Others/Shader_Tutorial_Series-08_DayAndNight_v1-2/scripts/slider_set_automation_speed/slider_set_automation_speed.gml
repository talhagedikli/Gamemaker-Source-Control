/// @description sets a sliders automation speed
function slider_set_automation_speed(argument0, argument1) {
	// this will not topggle the automation, but set it's speed then automation is on
	/// @param slider_number
	/// @param speed[0<spd<1]

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		list[|argument0].automation_spd = clamp(argument1, 0.001, 0.999);
	else
		show_debug_message("Error setting automation speed: Slider #" + string(argument0) + " >= slider list size");




}
