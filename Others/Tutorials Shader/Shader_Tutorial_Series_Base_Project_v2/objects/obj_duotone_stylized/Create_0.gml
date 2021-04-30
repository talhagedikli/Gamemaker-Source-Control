/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Duotone stylized";

info_text	= @"Duotone stylized:

				Dutone with dark and light colour uniforms and dynamic range crushing";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_gasstation_256x256px; // optional

shader = shd_duotone_stylized;
u_duo_col_light		= shader_get_uniform(shader, "duo_col_light");
u_duo_col_dark		= shader_get_uniform(shader, "duo_col_dark");
u_crush				= shader_get_uniform(shader, "crush");

duo_col_light = [1.2, 1.2, 0.6];
duo_col_dark = [0.1, -0.4, 0.3];

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

