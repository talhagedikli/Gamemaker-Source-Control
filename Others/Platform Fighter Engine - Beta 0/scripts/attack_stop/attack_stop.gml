///@func attack_stop([state])
///@param [state]
///@desc Stops an attack and resets the related variables
var run = true;

//Reset attacking variables
attack_phase = 0;
attack_frame = 0;
attack_script = -1;
attack_draw_script = -1;
can_hitfall = false;

/*Do not reset landing lag!*/

//Reset hitboxes
hitboxes_destroy_attached_all();
hitbox_group_reset_all();
any_hitbox_has_hit = false;
any_hitbox_has_been_blocked = false;

//Parry Stun
if run && check_parried() run = false;
parry_stun_time = parry_default_stun_time;

//Set state (optional argument)
if (run && argument_count > 0)
	{
	set_state(argument[0]);
	run = false;
	}
else
	{
	if (on_ground())
		{
		set_state(PLAYER_STATE.idle);
		}
	else
		{
		set_state(PLAYER_STATE.aerial);
		}
	}