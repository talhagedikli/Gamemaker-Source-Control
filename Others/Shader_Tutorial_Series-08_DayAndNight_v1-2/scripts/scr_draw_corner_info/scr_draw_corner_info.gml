///@description: draws text on top of the module sprite box
function scr_draw_corner_info() {
	//		- can only be called from a module instance
	//		- throws an error if the module did not call 
	//		  scr_module_set_coordinates() before
	///@param text

	var text	= argument[0];
	var padding	= 5;
	var ww		= string_width(text)  + 2 * padding;
	var hh		= string_height(text) + 2 * padding;
	var xx		= x1_frame + frame_width;
	var yy		= y1_frame + text_height;

	draw_sprite_ext(spr_1x1px_white, 0, xx, yy, ww, hh, 0, c_black, 0.6);
	draw_text(xx + padding, yy + padding, text);



}
