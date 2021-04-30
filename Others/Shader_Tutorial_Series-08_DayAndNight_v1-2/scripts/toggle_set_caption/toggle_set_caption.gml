/// @description sets a toggle buttons caption
/// @param toggle_group
/// @param toggle_number
/// @param caption_string
function toggle_set_caption(argument0, argument1, argument2) {

	var grid	= global.toggle;
	var t_group	= argument0;
	var t_num	= argument1;

	if ((t_group < ds_grid_width(grid)) &&
		(t_num < ds_grid_height(grid)) &&
		(grid[# t_group, t_num] != noone))
		grid[# t_group, t_num].caption = string(argument2);
	else
		show_debug_message("Error setting caption: Toggle #" + string(t_group) + "|" + string(t_num) + " is out of ds_grid bounds or was not set");



}
