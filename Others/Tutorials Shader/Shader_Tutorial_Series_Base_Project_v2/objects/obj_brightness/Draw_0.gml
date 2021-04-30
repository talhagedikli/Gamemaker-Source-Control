/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var brightness = slider_get_value(1) * 2 - 1;

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_brightness, brightness);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text = "B: " + string_format(brightness, 0, 2);

scr_draw_module();
