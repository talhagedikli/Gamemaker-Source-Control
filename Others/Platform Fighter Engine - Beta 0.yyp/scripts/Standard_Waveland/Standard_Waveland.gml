///Standard_Waveland
function Standard_Waveland() {
	//Contains the standard actions for the waveland state.
	var run = true;
#region Sliding Friction and gravity
	friction_gravity(waveland_friction, grav, max_fall_speed);
#endregion
#region Waveland to Aerial
	if (run && check_aerial()) run = false;
#endregion
#region Waveland to Idle
	if (run && state_frame == 0)
		{
		set_state(PLAYER_STATE.idle);
		run = false;
		}
#endregion
#region Attacking
	if run && check_smashes() run = false;
	if run && check_grounds() run = false;
	if run && check_specials() run = false;
	if run && check_grab() run = false;
#endregion
	move_hit_platforms();


}
