/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var saturation = slider_get_value(3) * 5;

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_saturation, saturation);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text = "S: " + string_format(saturation, 0, 2);

scr_draw_module();
