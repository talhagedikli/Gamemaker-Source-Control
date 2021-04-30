/// @description sets a target instance for the camera to follow
function scr_camera_set_target() {
	// @param	target_instance_id
	// @param	follow_speed[0-1] 0: not following | 1: snapped to target

	if (instance_exists(obj_camera)) {
		with (obj_camera) {
			camera_target	= argument[0];
			camera_speed	= clamp(argument[1], 0, 1);
			x				= camera_target.x;
			y				= camera_target.y;
		}
	} else
		show_debug_message("Error from scr_camera_set_target: obj_camera not found");


}
