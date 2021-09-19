///Standard_Ledge_Getup
function Standard_Ledge_Getup() {
	//Contains the standard actions for the ledge getup state.
	var run = true;
#region Invincible
	hurtbox_set_inv(hurtbox, INV.invincible, 1);
#endregion
#region No speed
	set_speed(0, 0, false, false);
#endregion
#region End Getup
	if (state_frame == 0)
		{
		ledge_getup_move();
		set_state(PLAYER_STATE.idle);
		}
#endregion


}
