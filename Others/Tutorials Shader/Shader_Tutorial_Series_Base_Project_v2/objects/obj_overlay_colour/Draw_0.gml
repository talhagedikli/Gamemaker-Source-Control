/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var R = slider_get_value(3);
var G = slider_get_value(4);
var B = slider_get_value(5);

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f_array(u_col, [R,G,B]);
	draw_sprite(sprite, 0, x, y);
shader_reset();

scr_draw_module();
