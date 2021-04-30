/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Contrast";

info_text	= @"Contrast:

				Increasing contrast always also increases saturation.
				
				0: all medium grey
				0 - 1: reduced contrast
				1: unchanged
				> 1: increased contrast";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_contrast;
u_contrast			= shader_get_uniform(shader, "contrast");

event_perform(ev_other, ev_user0);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_caption(2, "Con");
slider_set_draw_value(2, false);

trigger_set_caption(0, "RESET");
trigger_set_sprite(0, spr_btn_96x31px);
#endregion
//-----------------------------------------------------------------------------
