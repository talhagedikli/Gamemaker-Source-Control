function scr_remove_mockups() {
	//-----------------------------------------------------------------------------
	/// @description Removes all mockup instances
	//-----------------------------------------------------------------------------
	/// @param game_scale* optional, scale_divisor[1,2,3,4...]

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	This script will add an immobile character (or actually just sprite) to the
	game to set up a mockup scenario.

	This by itself is pretty much usless but in combination with a scrolling back-
	and foreground the mockup looks like a side scrolling game.

	To create scrolling layers use the script:
		scr_add_mockup_scroll_layer(...)
	
	You can also use one of the templates which add a character and several layers
	by calling the script instead:
		scr_use_template_mockup(...)
	
	To remove all mockup isntances from the game you can use:
		scr_remove_mockups()

	//-----------------------------------------------------------------------------
		Example:
	//-----------------------------------------------------------------------------
	Create Event:
	-------------
		scr_add_mockup_character(spr_gothicvania_baker_right_walk, 1, 1, 156, 236, 0.5, 0);
	
	This will add an object with the sprite of a baker moonwalking at room
	position 156, 236 to the same depth as the calling instance.
	The sprite will not be scaled, but it's animation speed will be reduced to 0.5.
	
	//---------------------------------------------------------------------------*/

	// set new game scale:
	if ((argument_count > 0) && (argument[0] >= 0)) scr_camera_set_scale(argument[0]);

	// destroy mockups:
	with (obj_mockup_character)	instance_destroy();
	with (obj_scroll_wrap_img)	instance_destroy();



}
