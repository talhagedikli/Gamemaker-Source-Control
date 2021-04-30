/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Sin City Effect";

info_text	= @"Sin City Effect:

				Desaturate Colours, Increase Contrast and Pop the Reds.
						
				1: Red Threshold Minimum
				2: Red Threshold Range 
				3: Red Strength
				4: Contrast
				5: Brightness";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite					= spr_foto_plant_256x256px; // set in instance creation code (room)

shader					= shd_sin_city_effect;
u_red_threshold_min		= shader_get_uniform(shader, "red_threshold_min");
u_red_threshold_range	= shader_get_uniform(shader, "red_threshold_range");
u_red_strength			= shader_get_uniform(shader, "red_strength");
u_contrast				= shader_get_uniform(shader, "contrast");
u_brightness			= shader_get_uniform(shader, "brightness");

event_perform(ev_other, ev_user0);
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UI STUFF
//-----------------------------------------------------------------------------
slider_set_sprite(0, spr_btn_127x31px);
slider_set_sprite(1, spr_btn_127x31px);
slider_set_sprite(2, spr_btn_127x31px);
slider_set_sprite(3, spr_btn_127x31px);
slider_set_sprite(4, spr_btn_127x31px);

slider_set_draw_value(0, false);
slider_set_draw_value(1, false);
slider_set_draw_value(2, false);
slider_set_draw_value(3, false);
slider_set_draw_value(4, false);

trigger_set_caption(0, "RESET");
trigger_set_sprite(0, spr_btn_96x31px);
#endregion
//-----------------------------------------------------------------------------

