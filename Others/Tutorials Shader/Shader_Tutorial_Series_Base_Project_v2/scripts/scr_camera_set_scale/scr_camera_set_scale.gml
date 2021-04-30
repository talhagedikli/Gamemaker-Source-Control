/// @description sets the game scale without changing the gui layer or window
function scr_camera_set_scale() {
	// @param	scale_factor[1,2,3,4...]

	if (instance_exists(obj_camera)) {
		with (obj_camera) {
			game_scale	= argument[0];
			game_w		= round(game_w_start / argument[0]);
			game_h		= round(game_h_start / argument[0]);

			surface_resize(application_surface, game_w, game_h);
			camera_set_view_size(view_camera[0], game_w, game_h);
		}
	} else
		show_debug_message("Error from scr_camera_set_scale: obj_camera not found");


}
