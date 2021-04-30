/// @description sets a sliders button sprite
/// @param slider_number
/// @param sprite_id
function slider_set_sprite(argument0, argument1) {

	var list = global.slider;
	if (argument0 < ds_list_size(list))
		with (list[|argument0]) {
			slider_sys_set_btn(argument1);
			slider_sys_set_dimensions();
		}
	else
		show_debug_message("Error setting sprite: Slider #" + string(argument0) + " >= slider list size");




}
