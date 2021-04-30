/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var shifted_light_colour = slider_get_value(0);

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f_array(u_duo_col, scr_hue_shift_rgb(duo_col, shifted_light_colour));
	draw_sprite(sprite, 0, x, y);
shader_reset();

scr_draw_module();
