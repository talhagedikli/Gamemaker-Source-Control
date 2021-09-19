///@func hitfall_try()
///@desc Allows you to fastfall if you hit the opponent
if (can_hitfall)
	{
	if (stick_flicked(Lstick,DIR.down))
		{
		//If you are in hitpause
		if (self_hitlag_frame>0)
			{
			fastfall();
			}
		}
	}