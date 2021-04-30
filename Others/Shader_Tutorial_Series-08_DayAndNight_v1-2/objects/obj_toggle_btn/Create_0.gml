/// @description Init
//-----------------------------------------------------------------------------
//	This object is used to create a toggle button.

//	When pressing a toggle button each toggle button in the same toggle group 
//	is toggled off in a group.
//
//	Use the toggle group modifier in the room editor to assign the toggle button 
//	to a toggle group: i.e. every toggle button colliding with the modifier TG01
//	will be assigned to the toggle group 1.
//	Ih there's no toggle modifier coliding, the toggle button will be assigned
//	toggle group 0.
//
//	IMPORTANT:
//	You can have 10 toggle buttons per toggle group and 10 toggle groups.
//	Exceeding this number crashes the program.
//	You can however indcrease both limits in create event of obj_game_control
//	where the ds_grid global.toggle is created.
//
//	There are several setter scripts to change the toggle button:
//	- toggle_set_caption:			string
//									can be "" to draw no caption
//	- toggle_set_sprite:			sprite id
//
//	And several getter scripts:
//	- toggle_get_id					toggle buttons instance id
//	- toggle_get_state				boolean, true: on | false: off
//	- toggle_get_caption			string
//	- toggle_get_released			boolean
//									whether the button was just released
//	- toggle_get_pressed			boolean
//									whether the button was just pressed
//-----------------------------------------------------------------------------

// Apply kill modifier - optional:
if (instance_place(x, y, mod_KILL) != noone) {instance_destroy();exit;}


// GET TOGGLE GROUP:
//-----------------------------------------------------------------------------
toggle_group	= 0;
var tg_inst		= instance_place(x, y, mod_par_TG);
if (tg_inst != noone) toggle_group = tg_inst.toggle_group;


// SETUP: Register, set Toggle Number and state:
//-----------------------------------------------------------------------------
toggle_number	= toggle_sys_register(toggle_group);
if (toggle_number == 0)
	is_on		= true;
else
	is_on		= false;


// APPEARANCE: Sprite, Coordinates & Caption:
//-----------------------------------------------------------------------------
sprite[false]	= spr_btn_96x31px;	// needs to be set BEFORE inheriting the parent event
sprite[true]	= spr_btn_96x31px_on;	// needs to be set BEFORE inheriting the parent event
image_xscale	= 1;
image_yscale	= 1;
sprite_index	= sprite[is_on];

event_inherited();

caption			= string(toggle_group) + ":" + string(toggle_number);
