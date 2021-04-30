/// @description create colours | mockups

// get key times:
var time		= slider_get_value(0);

key_previous	= min(floor(time * number_of_key_times), number_of_key_times -1);
key_next		= (key_previous + 1) mod number_of_key_times;

// get lerp amount:
var lerp_amt	= (time - key_previous/number_of_key_times) * number_of_key_times;

// mix colors:
color_mix		=  [lerp(color[key_previous,0], color[key_next,0], lerp_amt),
					lerp(color[key_previous,1], color[key_next,1], lerp_amt),
					lerp(color[key_previous,2], color[key_next,2], lerp_amt)];
					
con_sat_brt_mix	=  [lerp(con_sat_brt[key_previous,0], con_sat_brt[key_next,0], lerp_amt),
					lerp(con_sat_brt[key_previous,1], con_sat_brt[key_next,1], lerp_amt),
					lerp(con_sat_brt[key_previous,2], con_sat_brt[key_next,2], lerp_amt),
					lerp(con_sat_brt[key_previous,3], con_sat_brt[key_next,3], lerp_amt),
					lerp(con_sat_brt[key_previous,4], con_sat_brt[key_next,4], lerp_amt)];

// reflection alpha:
//			  sin((2 * time			+ phase) * pi) * scale - shift
alpha	= clamp(sin((2 * slider_get_value(0) + 0.5) * 3.14) * 1.6 - 0.1, 0, 1);

// set slider caption:
var hour		= string_format(floor(time * 24), 0, 0);
hour			= (string_length(hour) == 1) ? "0" + hour : hour;
var minute		= string_format(time * 24 * 60 mod 60, 0, 0);
minute			= (string_length(minute) == 1) ? "0" + minute : minute;
slider_set_caption(0, hour + ":" + minute);

//-----------------------------------------------------------------------------
#region SELECT MOCKUP BY TRIGGER BUTTON (optional):
// Just remove the lines with mockups you don't want to use
//-----------------------------------------------------------------------------
var trigger = 0;
if (trigger_get_pressed(trigger++)) scr_remove_mockups(3);
//if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.gothicvaniatown_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.gothicvaniatown_hi_res);
//if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.squareblocks_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.squareblocks_hi_res);
//if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.graveyard_hi_res);
//if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.space_lo_bit_lo_res);
if (trigger_get_pressed(trigger++)) scr_use_template_mockup(mockup.space_lo_bit_hi_res);
#endregion
//-----------------------------------------------------------------------------
