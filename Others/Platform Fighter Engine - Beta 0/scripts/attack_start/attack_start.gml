///@func attack_start(attack)
///@param attack
///@desc Starts an attack and resets the related variables
var _atk = argument[0];

//Set the script & draw script
var _exists = false;
if (!is_array(_atk) && script_exists(_atk))
	{
	attack_script = _atk;
	attack_draw_script = -1;
	_exists = true;
	}
else if (is_array(_atk) && script_exists(_atk[0]) && script_exists(_atk[1]))
	{
	attack_script = _atk[0];
	attack_draw_script = _atk[1];
	_exists = true;
	}
	
if (_exists)
	{
	//Check the cooldown
	if (attack_cooldown[? string(attack_script)] > 0)
		{
		//End the attack
		attack_script = -1;
		attack_draw_script = -1;
		return;
		}
	
	//Attack phase
	attack_phase = 0;
	attack_frame = 0;

	//Flags & variables
	can_hitfall = false;
	landing_lag = default_attack_landing_lag;
	parry_stun_time = parry_default_stun_time;

	//Set the state
	set_state(PLAYER_STATE.attacking);

	//Reset the hitboxes
	hitboxes_destroy_attached_all();
	hitbox_group_reset_all();
	any_hitbox_has_hit = false;
	any_hitbox_has_been_blocked = false;

	//Execute the first frame (the special start phase)
	script_execute(attack_script, PHASE.start);
	}
	
//Move to front
Player_Move_To_Front();