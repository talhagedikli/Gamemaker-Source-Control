///Standard_Magnetized
function Standard_Magnetized() {
	//Contains the standard actions for the magnetized state.
	var run = true;
#region End Phase
	if (state_frame == 0)
		{
		set_state(PLAYER_STATE.aerial);
		run = false;
		}
#endregion
#region Move toward magnet goal
	if (run)
		{
		set_speed_towards_point(magnet_goal_x, magnet_goal_y, magnetbox_snap_speed);
		}
#endregion
	move();


}
