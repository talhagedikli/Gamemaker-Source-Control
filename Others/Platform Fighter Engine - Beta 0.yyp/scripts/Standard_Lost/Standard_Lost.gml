///Standard_Lost
function Standard_Lost() {
	//Contains the standard actions for the lost state.
	//When a player is out of the match (loses all lives)
	set_speed(0, 0, false, false);
	x = room_width div 2;
	y = room_height div 2;
	hurtbox_set_inv(hurtbox, INV.invincible, 1);
#region Share Stock
#endregion
	//No movement


}
