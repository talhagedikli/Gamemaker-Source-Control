/// @description Init
//-----------------------------------------------------------------------------
//	This object creates a button to trigger some action.
//
//	There are several setter scripts to change the trigger button:
//	- trigger_set_caption:			string
//									can be "" to draw no caption
//	- trigger_set_sprite:			sprite id
//
//	And several getter scripts:
//	- trigger_get_id				triggers instance id
//	- trigger_get_caption			string
//	- trigger_get_released			boolean
//									whether the trigger was just released
//	- trigger_get_pressed			boolean
//									whether the trigger was just pressed
//-----------------------------------------------------------------------------

// Apply kill modifier - optional:
if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}

sprite_index = spr_btn_31x31px; // needs to be set BEFORE inheriting the parent event
image_xscale = 1;
image_yscale = 1;

event_inherited();

trigger_numer = trigger_sys_register();
caption = string(trigger_numer);

