/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var strength = slider_get_value(1);

// DRAW:
//-----------------------------------------------------------------------------
scr_draw_module();
shader_set(shader);
	shader_set_uniform_f(u_strength, strength);
	draw_sprite(sprite, 0, x, y);
shader_reset();

