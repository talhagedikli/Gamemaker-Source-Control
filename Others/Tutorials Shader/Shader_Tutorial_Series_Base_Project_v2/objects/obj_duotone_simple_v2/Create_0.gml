/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Duotone Simple v2
				With vertex colour";

info_text	= @"Duotone Simple v2:

				Simulate duotone processing like in Sepia toning using the vertex colour as the light tone and using the vertex shader to incrase the dynamic range of the vertex colour.
				
				Dark tone is black";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_duotone_simple_v2;
#endregion
//-----------------------------------------------------------------------------
