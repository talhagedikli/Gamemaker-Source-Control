/// @description dimensions
//-----------------------------------------------------------------------------
//	This object sets up the resolution and draws an overlay
//	with information on diffierent coordinate systems
//	toggle off/on: 
//		- Win/Mac/Linux: Ctrl-O
//		- Rest: Tilt
//		- other os_settings could be added to step event
//-----------------------------------------------------------------------------


// SET RESOLUTION & TARGET:
//-----------------------------------------------------------------------------
game_w_start	= 1440;
game_h_start	= 768;
game_w			= game_w_start;
game_h			= game_h_start;
game_scale		= 1;

camera_set_view_size(view_camera[0], game_w, game_h);
surface_resize(application_surface, game_w, game_h);
display_set_gui_size(game_w, game_h);	
window_set_size(game_w, game_h);

camera_target	= noone;	// if camera target is set, speed:
camera_speed	= 0.1;		// 0: no camera movement | 1: instant snapping


// RESOLUTION OVERLAY:
//-----------------------------------------------------------------------------
show_gui_overlay = false;
