///Standard_Grabbing
//Contains the standard actions for the grabbing state.
//"Grabbing" refers to the state when a player is holding an opponent after connecting a grab hitbox
var run = true;
#region Friction & Gravity
friction_gravity(ground_friction, grav, max_fall_speed);
#endregion
#region Change to Aerial State
if run && check_aerial() run = false;
#endregion
#region Attacking
if ((grabbed_id.state == PLAYER_STATE.is_grabbed || grabbed_id.state == PLAYER_STATE.in_hitlag))
	{
	//Throw stick reset
	if (!stick_tilted(Lstick))
		{
		throw_stick_has_reset = true;
		}

	#region Throw
	if (run && throw_stick_has_reset && check_throws()) run = false;
	#endregion
	#region Pummel
	if (run)
		{
		var _grab_frame = state_frame;
		if (check_pummel())
			{
			state_frame = _grab_frame;
			run = false;
			}
		}
	#endregion
	}
#endregion
#region Grab Interrupt
//If the grabbed player is no longer being grabbed, the grab releases
if ((grabbed_id.state != PLAYER_STATE.is_grabbed && 
	grabbed_id.state != PLAYER_STATE.in_hitlag) ||
	grabbed_id.grab_hold_id != id)
	{
	grab_release();
	}
#endregion
#region Grab Release
//Grabs end automatically when the grab frame times out without a throw
if (run && state_frame == 0)
	{
	grab_release();
	}
#endregion
move_grounded();