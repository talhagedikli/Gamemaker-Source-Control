///@description registers a new trigger button to the trigger list
function toggle_sys_register(argument0) {
	// needs to be and must only be called in the create event of the trigger object
	/// @param toggle_group[int>=0]

	/*	   GRID LAYOUT   | Group 0 | Group 1 | Group 2 | ...
		-----------------+---------+---------+---------+---------
		Toggle Number 0  | inst ID | inst ID | inst ID | ...
		-----------------+---------+---------+---------+---------
		Toggle Number 1  | inst ID | inst ID | inst ID | ...
		-----------------+---------+---------+---------+---------
		Toggle Number 2  | inst ID | inst ID | inst ID | ...
		-----------------+---------+---------+---------+---------
			...			 |   ...   |   ...   |   ...   |			*/

	var t_group = argument0;
	var grid	= global.toggle;
	var t_num	= -1;

	// Check if toggle group is >= than grid width -> return error
	if (t_group >= ds_grid_width(grid)) {
		show_debug_message("Error: Failed to register to Toggle Group " + 
							string(t_group) +
							" -> Toggle Groups range from 0 to " + 
							string(ds_grid_width(grid) - 1));
		return -2;
	}

	// Check if toggle group is full -> return error
	for (var i = 0; i < ds_grid_height(grid); i++) {
		if (ds_grid_get(grid, t_group, i) == noone) {
			t_num = i;
			break;
		}
	}

	if (t_num == -1) {
		show_debug_message("Error: Failed to register to Toggle Group " +
							string(t_group) + 
							" -> Toggle Group is full. Max alout slots per group: " +
							string(ds_grid_height(grid)));
		return -1;
	}

	// register
	grid[# t_group, t_num] = id;
	return t_num;




}
