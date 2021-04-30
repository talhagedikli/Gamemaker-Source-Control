/// @description Init

title_text			= "";	// will appear above the module frame
info_text			= "";	// will appear in the info text field
corner_text			= "";	// will appear on top of the module
click_region_gui	= true; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again

sprite				= spr_1x1px_empty; // dummy sprite

alarm[0]			= 1;	// to calculate the module frame coordinates

if (instance_number(par_module) == 1) global.selected_module = id; // to autoselect this module

