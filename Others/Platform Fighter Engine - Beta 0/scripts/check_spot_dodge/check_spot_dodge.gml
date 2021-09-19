///@func check_spot_dodge()
///@desc Allows spot dodging
//If the shield type is set to parry, you can't spot dodge
if (shield_type == SHIELD.rivals) return false;
//If the control stick is flicked downwards
if (stick_flicked(Lstick, DIR.down))
	{
	//Set the state to spot dodging and stop the script.
	set_state(PLAYER_STATE.spot_dodging);
	state_frame = spot_dodge_startup;
	return true;
	}
return false;