/// @description MAIN

// DRAW:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f_array(u_col, color_mix);
	shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
	var scale = scr_camera_get_scale();
	if surface_exists(application_surface)
		draw_surface_ext(application_surface, 0, 0, scale, scale, 0, c_white, 1);
shader_reset();

//scr_draw_module();
