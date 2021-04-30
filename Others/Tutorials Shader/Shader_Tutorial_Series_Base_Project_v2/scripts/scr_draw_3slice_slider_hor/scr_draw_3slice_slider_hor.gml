///@description draws a 3-slice horizontal slider
function scr_draw_3slice_slider_hor() {
	//		- the center is drawn stretched
	///@param sprite
	//		- width needs to be divisible by 3
	//		- height can be any size
	///@param x1
	///@param y1
	///@param x2
	///@param slice_size
	//		- slice_size is always a third of the sprite width.


	var arg		= 0;
	var sprite	= argument[arg++];
	var x1		= argument[arg++];
	var y1		= argument[arg++];
	var x2		= argument[arg++];
	var size	= argument[arg++];

	var xscale	= (x2 - x1 - 2 * size) / size;


	// L
	draw_sprite_part(sprite, 0, 0, 0, size, size, x1, y1);
	// M
	draw_sprite_part_ext(sprite, 0, size, 0, size, size, x1 + size, y1, xscale, 1, c_white, 1);
	// R
	draw_sprite_part(sprite, 0, 2 * size, 0, size, size, x2 - size, y1);




}
