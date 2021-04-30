/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var red_threshold_min	= 0.05 + slider_get_value(0) * 0.15;	// 0.05 - 0.2
var red_threshold_rng	= slider_get_value(1) * 0.5;			// 0.0 - 0.5
var red_strength		= 0.5 + slider_get_value(2);			// 0.5 - 1.5
var contrast			= 1 + slider_get_value(3) * 4;			// 1 - 5
var brightness			= -1 + slider_get_value(4) * 2;			// -1 - 1

// DRAW:
//-----------------------------------------------------------------------------
scr_draw_module();

shader_set(shader);
	shader_set_uniform_f(u_red_threshold_min,	red_threshold_min);
	shader_set_uniform_f(u_red_threshold_range,	red_threshold_rng);
	shader_set_uniform_f(u_red_strength,		red_strength);
	shader_set_uniform_f(u_contrast,			contrast);
	shader_set_uniform_f(u_brightness,			brightness);

	draw_sprite(sprite, 0, x, y);
shader_reset();

// SET SLIDER CAPTION:
//-----------------------------------------------------------------------------
slider_set_caption(0, "TH: "		+ string_format(red_threshold_min,	0, 2));
slider_set_caption(1, "TH Rng: "	+ string_format(red_threshold_rng,	0, 2));
slider_set_caption(2, "Str: "		+ string_format(red_strength,		0, 2));
slider_set_caption(3, "Con: "		+ string_format(contrast,			0, 2));
slider_set_caption(4, "Brt: "		+ string_format(brightness,			0, 2));
