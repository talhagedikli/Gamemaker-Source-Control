///@func check_parried()
if (shield_type == SHIELD.rivals)
	{
	if (has_been_parried)
		{
		has_been_parried = false;
		set_state(PLAYER_STATE.parry_stun);
		state_frame = parry_stun_time;
		return true;
		}
	}
return false;