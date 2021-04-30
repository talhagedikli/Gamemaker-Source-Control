/// @description (de)select | corner info | mockups
event_inherited(); // (de)select this module

//corner_text = "";

//-----------------------------------------------------------------------------
#region SELECT MOCKUP BY TRIGGER BUTTON (optional):
// Just remove the lines with mockups you don't want to use
//-----------------------------------------------------------------------------
var trigger = 0;
if (trigger_get_pressed(trigger++)) scr_remove_mockups(1);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.gothicvaniatown_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.gothicvaniatown_hi_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.squareblocks_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.squareblocks_hi_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.graveyard_hi_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.space_lo_bit_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.space_lo_bit_hi_res);
#endregion
//-----------------------------------------------------------------------------
