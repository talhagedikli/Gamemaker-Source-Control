/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region INFORMATION
//-----------------------------------------------------------------------------
// The modules are used to test shaders very quickly because many things needed
// for testing are implemented already.
// 
// Duplicate this template module to create a new test module and place the
// duplicate in the test room.
// Most shader tests can be done with a test module like this. In some cases 
// however it might make sense to use a duplicate of the player template instead.
// 
// You can add multiple modules in one test room. Every module will run its 
// shader and so it's easy to compare different but similar shader types. 
// Each module can be selected by clicking on it and the info text box swill show 
// the infotext of the selected module. If you want only one shader to run its 
// code at any given time, add
// 	if (global.selected_module == id)
// to each modules drawing code.
// 
// If only one module is in the test room it will be selected automatically.
//
//-----------------------------------------------------------------------------
// TITLE, INFO, CORNER, CLICK:
//-----------------------------------------------------------------------------
// Usually when testing a shader you'll draw a sprite. Using a module to test
// allows to quickly add a frame around the sprite, add a title text above the
// sprite, some info text to draw in the infor text box of the gui and some
// additional info on top of the sprite - called corner info.
// 
// The corner info is used to display current settings like effect strength for
// this module. Usually the corner info is the only thing you want to change 
// dynamically i.e. in a step event.
// 
// To be able to select and deselect a module by clicking on it you need to set 
// the click region to either gui or room coordinates depending on where you draw
// the sprite and frame. You can set that with the variable
// 	click_region_gui (true/false)
// 	
// In rare cases you might not want to be able to deselect a module (i.e. if you
// are using a mockup game with a player object and want to control the player
// with the mouse or touchscreen. You can disaable deselecting with the variable
//	deselectable = false;
//
//-----------------------------------------------------------------------------
// SPRITE & SHADER:
//-----------------------------------------------------------------------------
// This is the main part of the tests. Here you can set up the sprite, shader and
// its uniforms.
// 
// The variable named "sprite" is used by the module to determine the size of the
// module frame.
//
//-----------------------------------------------------------------------------
// RESIZE VIEW AND APPLICATION SURFACE:
//-----------------------------------------------------------------------------
// Entirely optional.
// Here you can set a zoom level i.e. if you want to test a shader on pixel art.
// Just mind that if you scale the view and applicaton surface you might want to
// draw the module frame to the gui and not in room space.
//
//-----------------------------------------------------------------------------
// CREATE SCROLLING MOCKUP:
//-----------------------------------------------------------------------------
// Optional as well.
// If you dont want to test a shader on a single sprite but rather in a game,
// you can use some simple sidescrolling mockups implemented in this project file.
// You can read more about mockups in the manual.
//
// The template modules step event also has some ready to use mockups prepared.
// The step event checks if some buttons on the user interface were pressed and
// if so activates those mockups. This whole setion in the step event is 
// entirely optional and can be deleted if not wanted. i.e. if you wnat to use
// the buttons for something else.
//
//-----------------------------------------------------------------------------
// PARENT:
//-----------------------------------------------------------------------------
// The modules are children of par_module.
// 
// The parent sets up some important variables in its create event. Thus this
// event should always bne inherited.
// 
// The alarm0 event finalizes the setup is mandatory as well. So do not use alarm0
// in the test module.
// 
// The step event is used to select or deselct a module and thus is not needed if
// you do not want that functionality.
#endregion
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"TESTNAME
				SHORTINFO1
				SHORTINFO2";

info_text	= @"TESTNAME:

				DESCRIPTION";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= true; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_passthrough;
u_			= shader_get_uniform(shader, "");
#endregion
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
#region RESIZE VIEW AND APPLICATION SURFACE (optional): 
//-----------------------------------------------------------------------------
// don't forget to draw in a draw gui event if you dont want to scale the sprite

//scr_camera_set_scale(3);
#endregion
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
#region CREATE SCROLLING MOCKUP (optional)
//-----------------------------------------------------------------------------

// Example using a template: GathicVania Town - low res
//------------------------------------
//scr_use_template_mockup(mockup.gothicvaniatown_lo_res);


// Example setting your own mockup: GathicVania Town - low res
//------------------------------------
//scr_camera_set_scale(3);
//
//scr_add_mockup_scroll_layer(spr_gothicvania_town_sky,			1, 1, 0, 0, 0,		0, 3);
//scr_add_mockup_scroll_layer(spr_gothicvania_town_background,	1, 1, 0, 0, -0.5,	0, 2);
//scr_add_mockup_scroll_layer(spr_gothicvania_town_middleground,	1, 1, 0, 0, -1,		0, 1);
//scr_add_mockup_scroll_layer(spr_gothicvania_town_foreground,	1, 1, 0, 0, -1.333,	0, -1);
//
//scr_add_mockup_character(spr_gothicvania_bearded_man, 1, 1, 156, 236, 0.5, 0);
#endregion
//-----------------------------------------------------------------------------
