///Standard_Techrolling
function Standard_Techrolling() {
	//Contains the standard actions for the tech rolling state.
	var run = true;
	//Animation is in the phases
#region Transition through phases of rolling
	switch(state_phase)
		{
		case 0:
			{
			//No speed
			set_speed(0, 0, false, false);
			hurtbox_set_inv(hurtbox, INV.invincible, techroll_active + 1);
			if (state_frame == 0)
				{
				//Next phase
				state_phase++;
				state_frame = techroll_active;
				}
			break;
			}
		case 1:
			{
			//Set speed
			set_speed(techroll_speed * state_direction, 0, false, false);
			if (state_frame == 0)
				{
				state_phase++;
				state_frame = techroll_endlag;
				}
			break;
			}
		case 2:
			{
			//No speed
			set_speed(0, 0, false, false);
			if (run && state_frame == 0)
				{
				//Position the player to be backwards
				if (state_direction != 0)
					{
					facing = -sign(state_direction);
					}
				state_phase = 0;
				//Back to Idle State
				set_state(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		default: break;
		}
#endregion
	//Movement
	move_grounded();


}
