/// @description sets a sliders dimensions
function slider_sys_set_dimensions() {
	//	used by system only
	//	needs to be called if btn sprite changes

	slider_width	= bar_width - 2 * btn_x_padding;			// the width the button can move
	var	click_h		= max(sprite_get_height(btn_sprite), bar_height);
	x1_click		= x1_bar - btn_x_padding;					// click region x1, y1, x2, y2
	y1_click		= y - round(0.5 * click_h);
	x2_click		= x2_bar + btn_x_padding;
	y2_click		= y1_click + click_h;



}
