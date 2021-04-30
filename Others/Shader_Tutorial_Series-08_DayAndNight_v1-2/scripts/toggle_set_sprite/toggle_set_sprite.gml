/// @description sets a toggle buttons sprite
/// @param toggle_group
/// @param toggle_number
/// @param sprite_off_id
/// @param sprite_on_id
function toggle_set_sprite(argument0, argument1, argument2, argument3) {

	var grid	= global.toggle;
	var t_group	= argument0;
	var t_num	= argument1;

	if ((t_group < ds_grid_width(grid)) &&
		(t_num < ds_grid_height(grid)) &&
		(grid[# t_group, t_num] != noone))
		with (grid[# t_group, t_num]) {
			sprite[false]	= argument2;
			sprite[true]	= argument3;
			sprite_index	= sprite[is_on];
			button_sys_set_dimensions();
		}
	else
		show_debug_message("Error setting sprite: Toggle #" + string(t_group) + "|" + string(t_num) + " is out of ds_grid bounds or was not set");



}
