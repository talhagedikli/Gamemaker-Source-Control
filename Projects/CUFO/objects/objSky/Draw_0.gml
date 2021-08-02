if (!surface_exists(sur))
{
	sur = surface_create(CAM_W, CAM_H);
}


surface_set_target(sur);
draw_clear_alpha(c_black, 1);
surface_reset_target();

shader_set(shStarfield);
shader_set_uniform_f(res, Camera.viewWidth, Camera.viewHeight, 0); 
shader_set_uniform_f(time, timer.time);
draw_surface(sur, CAM_X, CAM_Y);
shader_reset();