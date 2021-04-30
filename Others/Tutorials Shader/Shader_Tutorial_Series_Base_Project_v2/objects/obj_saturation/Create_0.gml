/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Saturation";

info_text	= @"Saturation:

				(De)saturate an image.
				
				0: B&W
				1: unchanged
				> 1: saturated";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_saturation;
u_saturation			= shader_get_uniform(shader, "saturation");

event_perform(ev_other, ev_user0);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_caption(3, "Sat");
slider_set_draw_value(3, false);

trigger_set_caption(0, "RESET");
trigger_set_sprite(0, spr_btn_96x31px);
#endregion
//-----------------------------------------------------------------------------
