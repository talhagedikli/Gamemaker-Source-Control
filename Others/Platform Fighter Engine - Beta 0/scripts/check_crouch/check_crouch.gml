///@func check_crouch()
///@desc Transition to crouching state if you are holding down on the stick
//If control stick is below an amount
if (stick_tilted(Lstick,DIR.down))
	{
	//Set the state to crouching and stop the script.
	set_state(PLAYER_STATE.crouching);
	return true;
	}
return false;