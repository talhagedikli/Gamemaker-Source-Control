/// @description Init
//-----------------------------------------------------------------------------
//	This object draws a text box showing the info text of the selected module
//	or some instructional text when no module is selected.
//	The size of the textbox can be set in the room editor by dragging
//	the sides of the place holder sprite.
//-----------------------------------------------------------------------------


// Apply kill modifier - optional:
//if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}

event_inherited();

frame_sprite		= spr_9slice_orange;
frame_slice_size	= round(sprite_get_width(frame_sprite) / 3);

instruction_text	= @"HINTS:
						------------
						
						MODULES:
						Click a module to select/deselect it.
						This info box will show information on the selected module.
						Depending on the test all modules or only the selected module run their shader code.
						
						ROOMS:
						To switch to another test room either click the arrow buttons by the room name or enter the room number on the keyboard.
						[0-9] for rooms 0 to 9
						[shift] adds 10
						[ctrl] adds 20
						> [shift] + [ctrl] + [2] = room 32
						
						SLIDERS:
						The sliders can be automated with the buttons to their left or right.
						One click moves the slider back and forth.
						Another click cycles the slider.
						A third click turns off the automation.
						
						HIDE GUI:
						The eye-symbol toggles whether the GUI should show or not. Even if hidden, the slider automation runs and the buttons are clickable (if you know where to click).
						
						GUI OVERLAY:
						Press Ctrl-O to show a GUI overlay with some information on dimensions.
						
						MOCKUPS:
						There are several mockups implemented. The standard template module uses Trigger 0 to cycle through the mockups.
						Mockups with auto scrolling pause when RMB is pressed.";

info_text			= instruction_text;

text_padding		= 8;
text_yoffset		= 0; // used for scrolling
text_height			= 0;

text_srf			= -1;
text_srf_w			= x2_click - x1_click - 2 * text_padding; // x/y_click are from the parent object, usualy the click region ...
text_srf_h			= y2_click - y1_click - 2 * text_padding; // ...but here it's just the dimension of the text box

scroll				= false;
delta_y				= 0;
scroll_arrow_blink	= 0;

