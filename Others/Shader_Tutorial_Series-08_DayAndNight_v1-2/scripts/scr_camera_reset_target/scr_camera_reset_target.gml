/// @description resets the camera target to the upper-left corner
function scr_camera_reset_target() {

	if (instance_exists(obj_camera)) {
		obj_camera.camera_target = noone;
		camera_set_view_pos(view_camera[0], 0, 0);
	} else
		show_debug_message("Error from scr_camera_reset_target: obj_camera not found");


}
