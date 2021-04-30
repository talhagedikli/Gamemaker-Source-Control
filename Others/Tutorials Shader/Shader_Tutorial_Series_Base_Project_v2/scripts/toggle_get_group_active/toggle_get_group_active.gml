/// @description returns the toggle button number of the active button in a toggle group
/// @param toggle_group
function toggle_get_group_active(argument0) {

	var grid	= global.toggle;
	var t_group	= argument0;
	var t_num;
	var toggle_instance;
	var found	= -1;

	if (t_group < ds_grid_width(grid)) {
		for (t_num = 0; t_num < ds_grid_height(grid); t_num++) {
			toggle_instance = grid[# t_group, t_num];
			if (toggle_instance == noone) break;
			if (toggle_instance.is_on) {
				found = t_num;
				break;
			}
		}
		return found;
	} else {
		show_debug_message("Error in toggle_get_group_active(): Toggle group #" + string(t_group) + " is out of ds_grid bounds or was not set");
		return -1;
	}




}
