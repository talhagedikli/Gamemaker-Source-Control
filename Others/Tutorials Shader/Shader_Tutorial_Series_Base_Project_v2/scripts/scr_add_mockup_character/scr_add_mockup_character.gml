function scr_add_mockup_character() {
	//-----------------------------------------------------------------------------
	/// @description Adds a character to the game and returns its instance id
	//-----------------------------------------------------------------------------
	/// @param sprite
	/// @param xscale
	/// @param yscale
	/// @param x
	/// @param y
	/// @param img_spd
	/// @param relative_depth -> relative to the depth of the calling instance

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
	
	To remove all mockup instances from the game you can use:
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

	var arg				= 0;
	var sprite			= argument[arg++];
	var xscale			= argument[arg++];
	var yscale			= argument[arg++];
	var xx				= argument[arg++];
	var yy				= argument[arg++];
	var img_spd			= argument[arg++];
	var relative_depth	= argument[arg++];

	var inst = instance_create_depth(xx, yy, depth + relative_depth, obj_mockup_character);

	inst.sprite_index	= sprite;
	inst.image_xscale	= xscale;
	inst.image_yscale	= yscale;
	inst.image_speed	= img_spd;
	inst.img_spd		= img_spd;

	return inst;


}
