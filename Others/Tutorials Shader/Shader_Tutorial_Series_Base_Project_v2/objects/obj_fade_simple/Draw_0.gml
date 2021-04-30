/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var alpha = slider_get_value(0);

// DRAW:
//-----------------------------------------------------------------------------
scr_draw_module();
shader_set(shader);
	shader_set_uniform_f(u_alpha, alpha);
	draw_sprite(sprite, 0, x, y);
shader_reset();
