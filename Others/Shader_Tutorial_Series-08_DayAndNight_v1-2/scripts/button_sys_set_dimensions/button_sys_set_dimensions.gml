/// @description sets a buttons dimensions
function button_sys_set_dimensions() {
	//	used by system only
	//	needs to be called if btn sprite changes

	x1_click = x - 0.5 * abs(sprite_width);
	y1_click = y - 0.5 * abs(sprite_height);
	x2_click = x + 0.5 * abs(sprite_width);
	y2_click = y + 0.5 * abs(sprite_height);



}
