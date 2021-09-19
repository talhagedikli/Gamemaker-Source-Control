///Standard_Ledge_Trump
function Standard_Ledge_Trump() {
	//Contains the standard actions for the ledge trump state.
	var run = true;
#region Friction / Gravity
	friction_gravity(air_friction, grav, max_fall_speed);
#endregion
#region When the lag is done
	if (run && state_frame == 0)
		{
		//Return to aerial state
		set_state(PLAYER_STATE.aerial);
		run = false;
		}
#endregion
	move();


}
