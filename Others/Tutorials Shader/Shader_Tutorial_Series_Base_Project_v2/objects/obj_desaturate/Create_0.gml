/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Desaturate";

info_text	= @"Desaturate:

				Replaces RGB by their average value or if wanted by a luminance vector like for NTSC or sRGB.";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x512px; // optional

shader		= shd_desaturate;
u_strength	= shader_get_uniform(shader, "strength");
#endregion
//-----------------------------------------------------------------------------

slider_set_caption(1, "Desat");