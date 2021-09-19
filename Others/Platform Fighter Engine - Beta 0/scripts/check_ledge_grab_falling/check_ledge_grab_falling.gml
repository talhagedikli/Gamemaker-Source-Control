///@func check_ledge_grab_falling()
///@desc Allows players to grab the ledge when falling
if (vsp >= 0)
	{
	return check_ledge_grab();
	}
return false;