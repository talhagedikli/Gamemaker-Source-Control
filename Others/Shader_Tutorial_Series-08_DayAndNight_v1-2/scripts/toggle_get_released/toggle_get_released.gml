/// @description returns if a toggle button was just released
/// @param toggle_group
/// @param toggle_number
function toggle_get_released(argument0, argument1) {

	var grid	= global.toggle;
	var t_group	= argument0;
	var t_num	= argument1;

	if ((t_group < ds_grid_width(grid)) &&
		(t_num < ds_grid_height(grid)) &&
		(grid[# t_group, t_num] != noone))
		return grid[# t_group, t_num].mouse_released;
	else {
		show_debug_message("Error getting released state: Toggle #" + string(t_group) + "|" + string(t_num) + " is out of ds_grid bounds or was not set");
		return -1;
	}



}
