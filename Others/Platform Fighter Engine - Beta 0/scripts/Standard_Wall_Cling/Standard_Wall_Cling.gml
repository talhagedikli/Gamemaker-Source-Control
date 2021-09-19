///Standard_Wall_Cling
//Contains the standard actions for the wall cling state.
var run = true;
switch(wall_jump_type)
	{
	case WALL_JUMP.rivals:
		{
		if (run && !button_hold(INPUT.jump) && wall_jumps > 0 && wall_jump_timeout == 0)
			{
			set_state(PLAYER_STATE.wall_jump);
			set_speed(0, 0, false, false);
			state_frame = wall_jump_startup;
			wall_jumps--;
			jump_is_midair_jump = false;
			jump_is_dash_jump = false;
		
			wall_cling_timeout = wall_cling_normal_timeout;
		
			run = false;
			}
		//If the time ran out or if you are not holding the button
		if (run && (state_time == wall_cling_max_time || !button_hold(INPUT.jump)))
			{
			set_state(PLAYER_STATE.aerial);
			wall_cling_timeout = wall_cling_normal_timeout;
			}
		break;
		}
	case WALL_JUMP.smash:
		{
		if run && check_wall_jump() run = false;
		if (run && (state_time == wall_cling_max_time ||
			(!stick_tilted(Lstick, DIR.right) && collision(x + wall_cling_check_distance, y, flags_create(FLAG.solid))) ||
			(!stick_tilted(Lstick, DIR.left) && collision(x - wall_cling_check_distance, y, flags_create(FLAG.solid)))))
			{
			set_state(PLAYER_STATE.aerial);
			wall_cling_timeout = wall_cling_normal_timeout;
			}
		break;
		}
	}