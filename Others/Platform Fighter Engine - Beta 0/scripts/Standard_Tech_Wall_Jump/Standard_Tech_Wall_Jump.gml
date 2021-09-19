///Standard_Tech_Wall_Jump
//Contains the standard actions for the tech wall jump state.
var run = true;
#region Landing
if (run && check_landing()) run = false;
#endregion
#region Transition through phases of tech wall jumping
if (run)
	{
	switch(state_phase)
		{
		case 0:
			{
			//Speeds
			set_speed(0, 0, false, false);
		
			if (state_frame == 0)
				{
				state_phase++;
				state_frame = wall_jump_time;
				set_speed(wall_jump_hsp * facing, wall_jump_vsp, false, false);
				}
			break;
			}
		case 1:
			{
			//Speeds
			friction_gravity(air_friction, grav, max_fall_speed);
		
			//Invulnerability
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
		
			if (run && state_frame == 0)
				{
				state_phase = 0;
				state_frame = 0;
				set_state(PLAYER_STATE.aerial);
				run = false;
				}
			
			break;
			}
		}
	}
#endregion
move();