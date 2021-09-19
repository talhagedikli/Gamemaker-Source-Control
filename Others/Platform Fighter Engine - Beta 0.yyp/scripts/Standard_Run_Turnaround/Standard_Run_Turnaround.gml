///Standard_Run_Turnaround
function Standard_Run_Turnaround() {
	//Contains the standard actions for the run turnaround state.
	var run = true;
#region Facing
	facing = state_direction;
#endregion
#region Walking
	//Move based on input
	//Acceleration
	hsp += run_turn_accel * state_direction;
	//Maximums
	hsp = clamp(hsp, -run_speed, run_speed);
#endregion
#region Transition back to running
	if (state_frame == 0)
		{
		//Make sure you're going in the right direction
		if (sign(hsp) != sign(state_direction))
			{
			set_speed(0, 0, false, false);
			}
		//Set to running if you are tilting the stick in the right direction
		if (stick_tilted(Lstick, DIR.horizontal) &&
			sign(stick_get_value(Lstick, DIR.horizontal)) == sign(state_direction))
			{
			set_state(PLAYER_STATE.running);
			}
		else
			{
			set_state(PLAYER_STATE.idle);
			}
		run = false;
		}
#endregion
#region Change to Aerial State
	if run && check_aerial() run = false;
#endregion
#region Jumping (RAR)
	if (run && check_jump())
		{
		jump_is_dash_jump = true;
		run = false;
		}
#endregion
#region Attacking
	if run && check_smashes() run = false;
	if run && check_dash_attack() run = false;
	if run && check_grounds() run = false;
	if run && check_specials() run = false;
	if run && check_dash_grab() run = false;
#endregion
#region Drop Throughs
	if run && check_drop_through() run = false;
#endregion
#region Rolling
	if run && check_rolling() run = false;
#endregion
	jostle_players();
	move_grounded();


}
