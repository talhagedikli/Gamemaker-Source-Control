/// @description Init
//-----------------------------------------------------------------------------
//		- must be in every room
//		- only one isntance per room allowed
//-----------------------------------------------------------------------------
//	This object gets keyboard & gamepad input for player objects only.
//
//	For simplicity reasons the gamepad check is rather crude checking several
//	buttons of every slot 4 times a second.
//-----------------------------------------------------------------------------

global.key_left			= false;
global.key_right		= false;
global.key_up			= false;
global.key_down			= false;
global.key_jump			= false;
if (!variable_global_exists("gamepad_device"))
	global.gamepad_device	= -1;
stick_threshold			= 0.2;
trigger_threshold		= 0.1;

//if (debug_mode) visible = true;
