/// @description MAIN

// SET VALUES:
//-----------------------------------------------------------------------------
var brightness	= slider_get_value(1) * 2 - 1;
var contrast	= slider_get_value(2) * 5;


// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f(u_brightness,	brightness);
	shader_set_uniform_f(u_contrast,	contrast);
	draw_sprite(sprite, 0, x, y);
shader_reset();


corner_text =	"B: " + string_format(brightness, 0, 2);
corner_text +=	"\nC: " + string_format(contrast, 0, 2);

scr_draw_module();
