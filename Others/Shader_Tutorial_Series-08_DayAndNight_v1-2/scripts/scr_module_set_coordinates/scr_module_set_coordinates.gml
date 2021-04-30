/// @description Sets up the needed dimension variables for a test module
function scr_module_set_coordinates(argument0) {
	//		- needs to be called in every test module
	//
	/// @param sprite
	//		the sprite the testmodule will draw

	//*1 if this changes, the 2 frame sprites need to change as well!

	// FRAME BASE - the 9-slide-image to draw the frame around the test module:
	frame_sprite[true]	= spr_9slice_module_frame_on;
	frame_sprite[false]	= spr_9slice_module_frame;
	frame_slice_size	= sprite_get_width(spr_9slice_module_frame) / 3;
	frame_width			= 3; //*1

	// TEXT BASE - the title text on the test module:
	var text_padding	= 8; //*1
	text_height			= 60 + 2 * frame_width + 2 * text_padding; //*1

	// SPRITE BASE - the sprite drawn by the test module:
	var sprite_w		= max(256, sprite_get_width(argument0)); // 256: to give the title text some space
	var sprite_h		= max(frame_slice_size, sprite_get_height(argument0));

	// WHOLE MODULE DIMENSIONS:
	var mod_width		= sprite_w + 2 * frame_width;
	var mod_height		= sprite_h + text_height + frame_width;

	// COORDS TO DRAW THE FRAME:
	x1_frame			= x - round(0.5 * mod_width);
	y1_frame			= y - round(0.5 * sprite_h) - text_height;
	x2_frame			= x1_frame + mod_width;
	y2_frame			= y1_frame + mod_height;

	// COORDS TO DRAW THE TEXT:
	x1_text				= x1_frame + frame_width + text_padding;
	y1_text				= y1_frame + frame_width + text_padding;



}
