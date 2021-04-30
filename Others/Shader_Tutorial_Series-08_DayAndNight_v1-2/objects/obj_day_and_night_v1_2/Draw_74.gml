/// @description MAIN

// DRAW TO LIGHTING SURFACE:
//-----------------------------------------------------------------------------
if (!surface_exists(srf_lights)) {
	srf_lights = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	tex_lights = surface_get_texture(srf_lights);
}

surface_set_target(srf_lights);
	/*View:		- if there's many lights, add some code to check if the light would be drawn to the view
				- if the view size is different from the view port you maybe need to change the drawing scale
	Brightness:	- lights_strength controls the brightness of all lights
				- if you want to control the brightness of each individual light, there's two ways:
					- for static brightness, just make their colour darker in the room editor
					- for dynamic changes: change image_alpha */
					
	// set up surface and GPU
	draw_clear(c_black);
	gpu_set_blendmode(bm_add);
	gpu_set_tex_filter(true); // optional
	
	// draw light sprites
	var lights_strength = slider_get_value(1);
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	with(par_day_and_night_v1_2_lights)
		draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * lights_strength);
	
	// draw text
	draw_set_halign(fa_center);
	draw_text_color(120, 110, "There Will Be", c_gray, c_gray, c_gray, c_gray, lights_strength);
	draw_set_font(fnt_medium);
	draw_text_color(120, 122, "L I G H T S !", c_gray, c_gray, c_gray, c_gray, lights_strength);
	draw_set_halign(fa_left);
	draw_set_font(-1);
	
	// reset GPU
	gpu_set_tex_filter(false); // optional
	gpu_set_blendmode(bm_normal);
surface_reset_target();


// DRAW APPLICATION SURFACE:
//-----------------------------------------------------------------------------
shader_set(shader);
	shader_set_uniform_f_array(u_col, color_mix);
	shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
	texture_set_stage(s_lights, tex_lights);
	var scale = scr_camera_get_scale();
	if surface_exists(application_surface)
		draw_surface_ext(application_surface, 0, 0, scale, scale, 0, c_white, 1);
shader_reset();


// DEBUG LIGHTING SURFACE:
//-----------------------------------------------------------------------------
if (!toggle_get_state(0, 0))
	draw_surface_ext(srf_lights, 0, 0, scale, scale, 0, c_white, 1);




















