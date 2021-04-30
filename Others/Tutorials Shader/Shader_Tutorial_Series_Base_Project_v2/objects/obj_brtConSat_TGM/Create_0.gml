/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Brt / Con / Sat
				by TGM";

info_text	= @"Brt / Con / Sat:

				Shader found in Romain Duras shader library but referenced to TGM (The GameMaker).
				
				brightness:
				0: black
				1: unchanged
				>1: brighten (never reaches white)
				
				contrast:
				0: middle grey
				1: unchanged
				>1: increased contrast
				
				saturation:
				0: B&W
				1: unchanged
				>1: increased saturation";

corner_text	= "";			// if wanted/needed, update this in a step or draw event

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite			= spr_foto_plant_256x256px; // optional

shader			= shd_brtConSat_TGM;
u_brightness	= shader_get_uniform(shader, "brightness");
u_contrast		= shader_get_uniform(shader, "contrast");
u_saturation	= shader_get_uniform(shader, "saturation");

event_perform(ev_other, ev_user0);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_caption(1, "Brt");
slider_set_caption(2, "Con");
slider_set_caption(3, "Sat");

slider_set_draw_value(1, false);
slider_set_draw_value(2, false);
slider_set_draw_value(3, false);

trigger_set_caption(0, "RESET");
trigger_set_sprite(0, spr_btn_96x31px);
#endregion
//-----------------------------------------------------------------------------
