/// @description Init
event_inherited();

//-----------------------------------------------------------------------------
#region TITLE, INFO, CORNER, CLICK (optional):
//-----------------------------------------------------------------------------
title_text	= @"Simple Fade";

info_text	= @"Simple Fade:

				Fades all pixels in and out. This shader is pretty much useless since the same effect can be achieved with draw_sprite_ext().";

click_region_gui	= false; // false: mouse click region in room space | true: mouse click region in gui space
deselectable		= true;	// Allow deselecting by clicking on the module again
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprite		= spr_foto_plant_256x512px; // optional

shader		= shd_fade_simple;
u_alpha		= shader_get_uniform(shader, "alpha");
#endregion
//-----------------------------------------------------------------------------

slider_set_caption(0, "Alpha");