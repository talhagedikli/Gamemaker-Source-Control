/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var contrast = slider_get_value(2) * 5;

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_contrast, contrast);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text = "C: " + string_format(contrast, 0, 2);

scr_draw_module();
