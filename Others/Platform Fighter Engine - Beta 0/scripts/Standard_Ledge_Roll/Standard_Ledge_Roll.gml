///Standard_Ledge_Roll
//Contains the standard actions for the ledge roll state.
var run = true;
#region Invincible
//Set the invincibility to last through the roll's startup so it is completely safe
hurtbox_set_inv(hurtbox, INV.invincible, roll_startup);
#endregion
#region No speed
set_speed(0, 0, false, false);
#endregion
#region End Getup
if (state_frame == 0)
	{
	ledge_getup_move();
	set_state(PLAYER_STATE.rolling);
	//Set the rolling direction to match the ledge facing direction
	state_direction = facing;
	}
#endregion