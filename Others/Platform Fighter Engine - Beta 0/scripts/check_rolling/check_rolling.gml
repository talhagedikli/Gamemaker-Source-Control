///@func check_rolling()
///@desc Transition to roll state if you are pressing shield and flick the control stick left or right
//If you are pressing a direction and the dodge buttons
if (button(INPUT.shield, buff, false))
	{
	if (stick_flicked(Lstick, DIR.horizontal))
		{
		//Reset only if both conditions are met
		button_reset(INPUT.shield);
		
		set_state(PLAYER_STATE.rolling);
		//Facing
		change_facing();
		//Set the rolling direction
		state_direction = facing;
		return true;
		}
	}
return false;