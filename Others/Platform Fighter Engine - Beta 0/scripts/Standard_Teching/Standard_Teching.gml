///Standard_Teching
//Contains the standard actions for the teching state.
var run = true;
#region Transition through phases of teching
switch(state_phase)
	{
	case 0:
		{
		//No speed
		set_speed(0, 0, false, false);
		hurtbox_set_inv(hurtbox, INV.invincible, state_frame);
		if (state_frame == 0)
			{
			//Next phase
			state_phase++;
			state_frame = tech_endlag;
			}
		break;
		}
	case 1:
		{
		if (run && state_frame == 0)
			{
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
//No movement