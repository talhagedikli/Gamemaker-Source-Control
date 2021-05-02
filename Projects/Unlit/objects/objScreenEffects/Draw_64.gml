/// @description 
shader_set(shScannLines);
var t_h = 1/ (surface_get_height(application_surface) * 1);
shader_set_uniform_f(texelSize, t_h);
draw_surface(application_surface, 0, 0);
shader_reset();



