/// @description turns off all toggle buttons in the same toggle group
/// @param toggle_group
function toggle_sys_do_toggle(argument0) {

	var t_group	= argument0;
	var grid	= global.toggle;
	var btn;

	// loop through all buttons of a group:
	for (var i = 0; i < ds_grid_height(grid); i++) {
	
		btn = grid[# t_group, i];
	
		// stop if if there is no button stored:
		if (btn == noone) break;
	
		// toggle this button
		if (btn == id)
			btn.is_on		= !btn.is_on;
		// turn off all other buttons:
		else
			btn.is_on		= false;
	
		// sprite index is changed in begin step event
	}



}
