/// @description returns whether a toggle is on or off
/// @param toggle_group
/// @param toggle_number
function toggle_get_state(argument0, argument1) {

	var grid	= global.toggle;
	var t_group	= argument0;
	var t_num	= argument1;

	if ((t_group < ds_grid_width(grid)) &&
		(t_num < ds_grid_height(grid)) &&
		(grid[# t_group, t_num] != noone))
		return grid[# t_group, t_num].is_on;
	else {
		show_debug_message("Error getting state: Toggle #" + string(t_group) + "|" + string(t_num) + " is out of ds_grid bounds or was not set");
		return -1;
	}



}
