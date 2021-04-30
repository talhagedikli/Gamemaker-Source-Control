/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var gamma = max(0.01, slider_get_value(0) * 10);

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_gamma, gamma);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text = "G: " + string_format(gamma, 0, 2);

scr_draw_module();
