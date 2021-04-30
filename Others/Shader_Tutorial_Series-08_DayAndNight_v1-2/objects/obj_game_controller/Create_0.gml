/// @description Init
//-----------------------------------------------------------------------------
//		- must be in every room
//		- only one instance per room allowed
//		- must be the first instance created
//
//-----------------------------------------------------------------------------
// IMPORTANT:
// IN THE "NOTES" ASSETS OF THIS PROJECT FILE IS A SHORT MANUAL!!!
//-----------------------------------------------------------------------------
//
// This object controls basic elements of the program:
//	- Changing room with keyboard input
//	- Setting up global vars
//	- Some platform specific settings
//	- Removing unneeded layers
//-----------------------------------------------------------------------------


show_debug_message("\nDEBUG MESSAGES " + room_get_name(room) + ":\n-------------------------------------------------------------------------");

// ROOM:												// skip first room (template)
//-----------------------------------------------------------------------------
if room == room_first room_goto_next();


// GLOBALS - STANDARD:
//-----------------------------------------------------------------------------
draw_set_font(fnt_standard);
global.text_color_ui_1		= $5AB4FF;
global.text_color_main_1	= c_white;


// GLOBALS - MODULES:									// When clicking a module it gets selected. The information
//-----------------------------------------------------------------------------
global.selected_module		= noone;					// and some buttons on the gui refer to the selected module


// GLOBALS - GUI:										// data sctructures to handle gui elements
//-----------------------------------------------------------------------------
global.slider				= ds_list_create();
global.trigger				= ds_list_create();
global.toggle				= ds_grid_create(10, 10);	// w: max # of toggle groups
ds_grid_clear(global.toggle, noone);					// h: max # of buttons per group
global.mouse_on_gui			= false;


// PLATFORM SPECIFICS:
//-----------------------------------------------------------------------------
if (os_type == os_windows || os_type == os_linux || os_type == os_macosx) {
	display_reset(4, true);
	global.mobile = false;
} else {
	display_reset(0, false);
	os_powersave_enable(true);
	global.mobile = true;
}


// REMOVE LAYOUT LAYER:
//-----------------------------------------------------------------------------
layer_destroy("alyr_layout");



