///Standard_Is_Grabbed
function Standard_Is_Grabbed() {
	//Contains the standard actions for the is_grabbed state.
	var run = true;
#region Snap to the grabbing player's position
	if (run)
		{
		if (grab_hold_id != noone)
			{
			set_speed_towards_point
				(
				grab_hold_id.x + (grab_hold_x * grab_hold_id.facing),
				grab_hold_id.y + grab_hold_y,
				grab_snap_speed
				);
			/*
			set_speed
				(
				clamp((grab_hold_id.x+grab_hold_x)-x,-grab_snap_speed,grab_snap_speed),
				clamp((grab_hold_id.y+grab_hold_y)-y,-grab_snap_speed,grab_snap_speed),
				false,false
				);
			*/
			}
		}
#endregion
#region Release
	//If the opposing player is no longer grabbing or throwing, break out of the grab
	if (grab_hold_id != noone && 
		grab_hold_id.state != PLAYER_STATE.grabbing && 
		grab_hold_id.state != PLAYER_STATE.attacking &&
		grab_hold_id.grabbed_id == id)
		{
		apply_damage(grab_hold_id, grab_release_damage);
		if (is_dead(grab_hold_id)) then exit;
		grab_release_held();
		}
#endregion
#region Unknown Grabber
	if (grab_hold_id == noone)
		{
		show_message("Error: grab_hold_id is set to noone");
		set_state(PLAYER_STATE.idle);
		}
#endregion
	//Movement
	move();


}
