///The custom script for character1
//Floaty jump
if (!variable_instance_exists(id, "float_frame"))
	{
	float_frame = 0;
	}
if (state == PLAYER_STATE.aerial && jump_is_midair_jump && state_time == 0)
	{
	float_frame = 0;
	if (state_time == 0)
		{
		set_speed(0, 3, true, false);
		}
	}
else
	{
	if ((state == PLAYER_STATE.aerial || (!on_ground() && state == PLAYER_STATE.attacking)) && 
		float_frame > 2 && float_frame < 19 && vsp > -12)
		{
		set_speed(0, -1.7, true, true);
		}
	float_frame++;
	}