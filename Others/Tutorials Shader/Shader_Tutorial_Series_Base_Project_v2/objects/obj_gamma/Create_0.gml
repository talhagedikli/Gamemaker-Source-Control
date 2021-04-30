/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Gamma";

info_text	= @"Gamma:

				Similiar to a brightness shader but does not drown as extremely in black and never completely fades to white.
				
				0: div by 0
				<1: darken
				1: unchanged
				>1: brighten";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again

event_perform(ev_other, ev_user0);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x256px; // optional

shader		= shd_gamma;
u_gamma		= shader_get_uniform(shader, "gamma");
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_caption(0, "Gamma");

slider_set_draw_value(0, false);

trigger_set_caption(0, "RESET");
trigger_set_sprite(0, spr_btn_96x31px);
#endregion
//-----------------------------------------------------------------------------
