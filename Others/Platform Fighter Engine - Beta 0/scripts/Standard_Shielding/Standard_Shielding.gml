///Standard_Shielding
//Contains the standard actions for the shielding state.
var run = true;
friction_gravity(ground_friction, grav, max_fall_speed);
#region Change to aerial state
if run && check_aerial() run = false;
#endregion
#region Check shield type
switch(shield_type)
	{
	case SHIELD.melee:
		{
		//Shield Health
		shield_hp -= shield_depeletion_rate;
		//Shield Stun
		shield_stun = max(--shield_stun, 0);
		if (run && shield_stun <= 0)
			{
			//Shield Release
			if (run && state_frame == 0 && !button_hold(INPUT.shield, 0))
				{
				button_reset(INPUT.shield);
				set_state(PLAYER_STATE.shield_release);
				state_frame = shield_release_time;
				run = false;
				}
			//Wavedash Cancel
			if (shield_into_wavedash	&& 
				run						&& 
				state_frame > 0		&& 
				button(INPUT.jump, buff)&& 
				check_airdodge())
				{
				run = false;
				}
			//Jump Cancel - Reset the input from the buffer so it doesn't waveland cancel
			if (run && check_jump())
				{
				button_reset(INPUT.shield);
				run = false;
				}
			//Rolling Cancel
			if run && check_rolling_hold() run = false;
			//Spot Dodge
			if run && check_spot_dodge() run = false;
			//Grab Cancel
			if run && check_grab() run = false;
			//Shield Platform Drop (Special platform drop)
			if (run && 
				stick_get_value(Lstick, DIR.down) > shield_plat_drop_amount &&
				stick_get_speed(Lstick) > shield_plat_drop_speed)
				{
				//If there's a platform under you but not a solid
				if (!on_solid(x, y) && on_plat(x, y))
					{
					//Move a pixel down so gravity will take effect
					y += 1;
					set_state(PLAYER_STATE.aerial);
					//Set variable to restrict fastfalling
					can_fastfall = false;
					}
				run = false;
				}
			//Shield Shifting
			if (run)
				{
				var _stick = Choose_Stick_By_Input(INPUT.shield);
				var _amount = (stick_get_distance(_stick) * shield_shift_amount);
				shield_shift_x = lengthdir_x(_amount, stick_get_direction(_stick));
				shield_shift_y = lengthdir_y(_amount, stick_get_direction(_stick));
				}
			}
		//Shield Break
		if (run && shield_hp <= 0)
			{
			shield_hp = shield_break_reset_hp;
			set_state(PLAYER_STATE.shield_break);
			state_frame = shield_break_base_time + (damage * shield_break_multiplier);
			set_speed(0, -shield_break_launch, true, false);
			//VFX
			repeat(25)
				{
				with(instance_create_layer(x, y, layer, obj_shield_break_particle))
					{
					var _dir = irandom(360);
					var _len = random_range(15, 55);
					hsp = lengthdir_x(_len, _dir);
					vsp = lengthdir_y(_len, _dir);
					fx_index = spr_hit_fx_shield_break_particle;
					fx_speed = 0;
					fx_frame = irandom(6);
					lifetime = irandom_range(25, 45);
					fx_xs = random_range(0.5, 1.5);
					fx_ys = fx_xs;
					fx_ang = irandom(360);
					total_life = lifetime;
					fade = true;
					}
				}
			camera_shake(4);
			create_fx(spr_hit_fx_final_hit, 1, 0, 34, x, y, 1, irandom(360));
			run = false;
			}
		//Invulnerability
		if (run)
			{
			if (state_frame == 0)
				{
				hurtbox_set_inv(hurtbox, INV.shielding, 1);
				}
			else
				{
				hurtbox_set_inv(hurtbox, INV.powershielding, 1);
				}
			}
		break;
		}
	//Parry (different state)
	case SHIELD.rivals:
		{
		//Middle Click--> check_shield()
		break;
		}
	//Ultimate
	case SHIELD.ultimate:
		{
		//Shield Health
		shield_hp -= shield_depeletion_rate;
		//Shield Stun
		shield_stun = max(--shield_stun, 0);
		if (run && shield_stun <= 0)
			{
			//Shield Release
			if (run && state_frame == 0 && !button_hold(INPUT.shield, 0))
				{
				button_reset(INPUT.shield);
				set_state(PLAYER_STATE.shield_release);
				hurtbox_set_inv(hurtbox, INV.parry_ult, parry_ult_window);
				state_frame = shield_release_time;
				run = false;
				}
			//Jump Cancel - Reset the input from the buffer so it doesn't waveland cancel
			if (run && check_jump())
				{
				button_reset(INPUT.shield);
				run = false;
				}
			//Rolling Cancel
			if run && check_rolling_hold() run = false;
			//Spot Dodge
			if run && check_spot_dodge() run = false;
			//Grab Cancel
			if run && check_grab() run = false;
			//Shield Platform Drop (Special platform drop)
			if (run && 
				stick_get_value(Lstick, DIR.down) > shield_plat_drop_amount &&
				stick_get_speed(Lstick) > shield_plat_drop_speed)
				{
				//If there's a platform under you but not a solid
				if (!on_solid(x, y) && on_plat(x, y))
					{
					//Move a pixel down so gravity will take effect
					y += 1;
					set_state(PLAYER_STATE.aerial);
					//Set variable to restrict fastfalling
					can_fastfall = false;
					}
				run = false;
				}
			//Shield Shifting
			if (run)
				{
				var _stick = Choose_Stick_By_Input(INPUT.shield);
				var _amount = (stick_get_distance(_stick) * shield_shift_amount);
				shield_shift_x = lengthdir_x(_amount, stick_get_direction(_stick));
				shield_shift_y = lengthdir_y(_amount, stick_get_direction(_stick));
				}
			}
		//Shield Break
		if (run && shield_hp <= 0)
			{
			shield_hp = shield_break_reset_hp;
			set_state(PLAYER_STATE.shield_break);
			state_frame = shield_break_base_time + (damage * shield_break_multiplier);
			set_speed(0, -shield_break_launch, true, false);
			//VFX
			repeat(25)
				{
				with(instance_create_layer(x, y, layer, obj_shield_break_particle))
					{
					var _dir = irandom(360);
					var _len = random_range(15, 55);
					hsp = lengthdir_x(_len, _dir);
					vsp = lengthdir_y(_len, _dir);
					fx_index = spr_hit_fx_shield_break_particle;
					fx_speed = 0;
					fx_frame = irandom(6);
					lifetime = irandom_range(25, 45);
					fx_xs = random_range(0.5, 1.5);
					fx_ys = fx_xs;
					fx_ang = irandom(360);
					total_life = lifetime;
					fade =true;
					}
				}
			camera_shake(4);
			create_fx(spr_hit_fx_final_hit, 1, 0, 34, x, y, 1, irandom(360));
			run = false;
			}
		//Invulnerability
		if (run) then hurtbox_set_inv(hurtbox, INV.shielding, 1);
		break;
		break;
		}
	default: break;
	}
#endregion
jostle_players();
move_grounded();