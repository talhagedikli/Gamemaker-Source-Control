/// @description follow target & toggle gui overlay


// FOLLOW TARGET:
//-----------------------------------------------------------------------------
if (camera_target != noone)  {
	var target_x, target_y, target_dis, view_x, view_y;
	
	// get target position:
	target_x = camera_target.x;
	target_y = camera_target.y;
	
	// set own position:
	target_dis = point_distance(x, y, target_x, target_y);
	if (target_dis > max(0.5, camera_speed)) {
		x = lerp(x, target_x, camera_speed);
		y = lerp(y, target_y, camera_speed);
	} else {
		x = target_x;
		y = target_y;
	}

	// set view position:
	view_x = round(x - 0.5 *  game_w); // removed clamping to room to not overcomplicate the mockups
	view_y = round(y - 0.5 *  game_h);
	camera_set_view_pos(view_camera[0], view_x, view_y);
}



// TOGGLE GUI OVERLAY:
//-----------------------------------------------------------------------------
if (os_type == os_windows || os_type == os_linux || os_type == os_macosx) {
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("O")))
		show_gui_overlay = !show_gui_overlay;
} else {
	if (device_get_tilt_z() < -0.2)
		show_gui_overlay = true;
	else
		show_gui_overlay = false;
}

