/// @description Init
event_inherited();

///-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Duotone Simple
				With a uniform vec3 colour";

info_text	= @"Duotone Simple:

				Simulate duotone processing like in Sepia toning using a uniform colour for the light tone.
				
				Dark tone is black";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_duotone_simple;
u_duo_col	= shader_get_uniform(shader, "duo_col");

duo_col = [1.2, 1.0, 0.8];
#endregion
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_draw_value(0, false);
slider_set_draw_value(1, false);
slider_set_draw_value(2, false);

slider_set_caption(0, "Light");
slider_set_caption(1, "Dark");
slider_set_caption(2, "Crush");
#endregion
//-----------------------------------------------------------------------------

