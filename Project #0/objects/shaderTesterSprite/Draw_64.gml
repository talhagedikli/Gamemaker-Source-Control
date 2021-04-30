/// @description 

var blursteps		= round((global.slider0 * 31) + 1);
var sigma			= max(global.slider1, 0.0001);
var kernel			= blursteps * 2 + 1;
var kernelsquared	= kernel * kernel;
var cx				= camera_get_view_x(VIEW);
var cy				= camera_get_view_y(VIEW);


shader_set(shader);
//shader_set_uniform_f(uniBlurSteps, blursteps);
//shader_set_uniform_f(uniTexelSize, texelWidth, texelHeight);
//shader_set_uniform_f(uniSigma, sigma);
//shader_set_uniform_f_array(uniUVs, uvs);


draw_sprite_ext(sprite, sprite_index, 0, 0, 
				image_xscale, image_yscale, image_angle,
				c_white, image_alpha);
shader_reset();