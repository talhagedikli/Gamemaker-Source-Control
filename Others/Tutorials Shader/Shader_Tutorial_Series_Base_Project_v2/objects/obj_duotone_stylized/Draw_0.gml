/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var shifted_light_colour	= scr_hue_shift_rgb(duo_col_light, slider_get_value(0));
var shifted_dark_colour		= scr_hue_shift_rgb(duo_col_dark,  slider_get_value(1));
var crush_level				= slider_get_value(2) * 0.5

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f_array(u_duo_col_light,	shifted_light_colour);
	shader_set_uniform_f_array(u_duo_col_dark,	shifted_dark_colour);
	shader_set_uniform_f(u_crush,				crush_level);

	draw_sprite(sprite, 0, x, y);
shader_reset();

scr_draw_module();
