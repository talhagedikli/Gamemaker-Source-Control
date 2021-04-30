/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var value = slider_get_value(0);

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	draw_sprite(sprite, 0, x, y);
shader_reset();

scr_draw_module();
