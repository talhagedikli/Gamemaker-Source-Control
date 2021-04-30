function scr_add_mockup_scroll_layer() {
	//-----------------------------------------------------------------------------
	/// @description Adds a layer of scrolling back- or foreground and returns it's id
	//-----------------------------------------------------------------------------
	/// @param sprite
	/// @param xscale
	/// @param yscale
	/// @param x_view_offset	layer tiling x offset
	/// @param y_view_offset	layer tiling y offset
	/// @param hspd				horizontal scrolling speed
	/// @param vspd				vertical scrolling speed
	/// @param relative_depth	-> relative to the depth of the calling instance

	/*-----------------------------------------------------------------------------
		Info:
	//-----------------------------------------------------------------------------
	This script will add a scrolling layer to the game to set up a mockup scenario.

	The sprite will be drawn tiled over the complete view covering everything beneath.

	The sprite can scroll horizontally or vertically (or both but what for?)

	This by itself is pretty much usless but in combination with more scrolling 
	layers and a mochup character the mockup looks like a side scrolling game.

	To create mockup character use the script:
		scr_add_mockup_character(...)
	
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
		scr_add_mockup_scroll_layer(spr_gothicvania_town_background, 2, 2, 0, 0, -0.5, 0, 2);
	
	This will add an object with the sprite of a gothic town background. The sprite
	will be drawn scaled up by factor 2 tiled over the view covering everything 
	beneath. It's depth will be 2 farther away than the calling instance.

	The tilings offset is set to 0|0 - the upper left corner of the view.
	The sprite will scroll horizontally by 0.5 px in room space per frame and will
	not scroll vertically.
	
	//---------------------------------------------------------------------------*/

	var arg				= 0;
	var sprite			= argument[arg++];
	var xscale			= argument[arg++];
	var yscale			= argument[arg++];
	var x_view_offset	= argument[arg++];
	var y_view_offset	= argument[arg++];
	var hspd			= argument[arg++];
	var vspd			= argument[arg++];
	var relative_depth	= argument[arg++];

	var inst = instance_create_depth(x_view_offset, y_view_offset, depth + relative_depth, obj_scroll_wrap_img);

	inst.sprite_index = sprite;
	inst.image_xscale = xscale;
	inst.image_yscale = yscale;
	inst.hspd = hspd;
	inst.vspd = vspd;

	return inst;


}
