if (!surface_exists(sur))
{
	sur = surface_create(GUI_W, GUI_H);
}


surface_set_target(sur);
shader_set(shdBlurGaussian);
draw_clear_alpha(c_white, 0.7);
shader_reset();

surface_reset_target();

draw_surface(sur, 0, 0);