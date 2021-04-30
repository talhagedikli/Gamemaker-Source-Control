/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Overlay Colour
				Like Photoshop does";

info_text	= @"Overlay Colour:

				Like Photoshop does";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= true; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_london_400x256px; // optional

shader		= shd_overlay_colour;
u_col		= shader_get_uniform(shader, "col");
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_caption(3, "Red");
slider_set_caption(4, "Green");
slider_set_caption(5, "Blue");
#endregion
//-----------------------------------------------------------------------------

