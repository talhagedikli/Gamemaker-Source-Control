/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var brightness	= slider_get_value(1) * 2;
var contrast	= slider_get_value(2) * 5;
var saturation	= slider_get_value(3) * 5;


// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_brightness,	brightness);
	shader_set_uniform_f(u_contrast,	contrast);
	shader_set_uniform_f(u_saturation,	saturation);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text =	"B: " + string_format(brightness, 0, 2);
corner_text +=	"\nC: " + string_format(contrast, 0, 2);
corner_text +=	"\nS: " + string_format(saturation, 0, 2);

scr_draw_module();
