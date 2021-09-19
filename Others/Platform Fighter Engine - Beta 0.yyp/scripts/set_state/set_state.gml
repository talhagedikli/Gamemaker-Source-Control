///@func set_state(state)
///@param state
///@desc Sets the state of the player and then performs initializing actions
function set_state() {

	state_previous = state;
	state = argument[0];
	state_time = 0;
	state_frame = 0;
	state_phase = 0;
	state_direction = 1;
	state_script = my_states[| state];

	//Reset the animation
	set_anim_reset();

	//Reset the hurtbox
	hurtbox_reset();

	//Reset the collision box
	collision_box_change();

	//Reset the player renderer (layer)
	Player_Set_Renderer(obj_player_renderer);

	//Based on state
	switch(state)
		{
		case PLAYER_STATE.aerial:
			//Restrict speed
			if (aerial_restrict_speed_instantly)
				{
				var _max_speed = jump_is_dash_jump ? max_air_speed_dash : max_air_speed;
				hsp = clamp(hsp, -_max_speed, _max_speed);
				}
			//Jumping variables
			jump_is_midair_jump = false;
			//Animation
			anim_speed = anim_speed_normal;
			//Peak of jump
			if (abs(vsp) < 1)
				{
				anim_sprite = my_sprites[? "JumpMid"];
				}
			//Falling
			else if (vsp >= 1)
				{
				anim_sprite = my_sprites[? "JumpFall"];
				}
			//Rising
			else if (vsp <= 1)
				{
				anim_sprite = my_sprites[? "JumpRise"];
				}
			//Fastfalling
			if (vsp >= fast_fall_speed)
				{
				anim_sprite = my_sprites[? "Fastfall"];
				}
			break;
		case PLAYER_STATE.airdodging:
			//Animation
			set_anim(my_sprites[? "Airdodge"]);
			//Timers
			state_frame = airdodge_startup;
			state_phase = 0;
			switch(airdodge_type)
				{
				case AIRDODGE.melee:
					{
					//Speeds
					var spd, dir;
					//Choose a control stick to use
					var _stick = Choose_Stick_By_Input(INPUT.shield);
					if (stick_tilted(_stick))
						{
						spd = airdodge_speed;
						dir = stick_get_direction(_stick);
						if (airdodge_direction_limit != -1)
							{
							var _d = (360 / airdodge_direction_limit);
							dir = ((dir + (_d / 2)) div _d) * _d;
							}
						airdodge_is_directional = true;
						}
					else
						{
						spd = 0;
						dir = 90;
						airdodge_is_directional = false;
						}
					airdodge_direction = dir;
					set_speed(lengthdir_x(spd, dir), lengthdir_y(spd, dir), false, false);
					//Waveland cancel
					if (check_waveland())
						{
						//Reset invulnerability
						hurtbox_set_inv(hurtbox, INV.normal, 0);
						}
					break;
					}
				case AIRDODGE.brawl:
					{
					airdodge_is_directional = false;
					break;
					}
				case AIRDODGE.ultimate:
					{
					//Choose a control stick to use
					var _stick = Choose_Stick_By_Input(INPUT.shield);
					if (stick_tilted(_stick))
						{
						var dir = stick_get_direction(_stick);
						airdodge_is_directional = true;
						if (airdodge_direction_limit != -1)
							{
							var _d = (360 / airdodge_direction_limit);
							dir = ((dir + (_d / 2)) div _d) * _d;
							}
						airdodge_direction = dir;
						}
					else
						{
						airdodge_is_directional = false;
						}
					break;
					}
				}
			break;
		case PLAYER_STATE.attacking:
			break;
		case PLAYER_STATE.crouching:
			//Animation
			set_anim(my_sprites[? "Crouch"]);
			break;
		case PLAYER_STATE.dashing:
			//Animation
			set_anim(my_sprites[? "Dash"]);
			//Timers
			state_frame = dash_time;
			break;
		case PLAYER_STATE.entrance:
			//Animation
			set_anim(my_sprites[? "Entrance"]);
			//No speed
			set_speed(0, 0, false, false);
			break;
		case PLAYER_STATE.grabbing:
			//Animation
			set_anim(my_sprites[? "Grabbing"]);
			//Stick reset - the player must reset stick to neutral before a throw
			throw_stick_has_reset = false;
			break;
		case PLAYER_STATE.helpless:
			//Animation
			set_anim(my_sprites[? "Helpless"]);
			break;
		case PLAYER_STATE.idle:
			//Animation
			set_anim(my_sprites[? "Idle"]);
			break;
		case PLAYER_STATE.in_balloon:
			//Animation
			set_anim(my_sprites[? "Balloon"]);
			break;
		case PLAYER_STATE.in_flinch:
			//Animation
			set_anim(my_sprites[? "Flinch"]);
			break;
		case PLAYER_STATE.in_grab_release:
			//Animation
			set_anim(my_sprites[? "GrabRel"]);
			break;
		case PLAYER_STATE.in_hitlag:
			//Animation
			set_anim(my_sprites[? "Hitlag"]);
			break;
		case PLAYER_STATE.in_hitstun:
			//Animation
			set_anim(my_sprites[? "Hitstun"]);
			break;
		case PLAYER_STATE.in_lag:
			//Animation
			set_anim(my_sprites[? "Lag"]);
			break;
		case PLAYER_STATE.in_tumble:
			//Animation
			set_anim(my_sprites[? "Tumble"]);
			break;
		case PLAYER_STATE.is_grabbed:
			//Animation
			set_anim(my_sprites[? "IsGrabbed"]);
			break;
		case PLAYER_STATE.jumpsquat:
			//Animation
			set_anim(my_sprites[? "JumpSquat"]);
			break;
		case PLAYER_STATE.knockdown:
			//Animation
			set_anim(my_sprites[? "Knockdown"]);
			break;
		case PLAYER_STATE.knocked_out:
			//Animation
			anim_sprite = -1;
			//Timer
			state_frame = ko_base_time;
			break;
		case PLAYER_STATE.ledge_attack:
			//Animation
			set_anim(my_sprites[? "LedgeA"]);
			//Invincible
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_attack_time;
			break;
		case PLAYER_STATE.ledge_getup:
			//Animation
			set_anim(my_sprites[? "LedgeG"]);
			//Invincible
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_getup_time;
			break;
		case PLAYER_STATE.ledge_hang:
			//Animation
			set_anim(my_sprites[? "Ledge"]);
			//No speeds
			set_speed(0, 0, false, false);
			//Invincible
			hurtbox_set_inv(hurtbox, INV.invincible, ledge_invincible_time);
			break;
		case PLAYER_STATE.ledge_jump:
			//Animation
			set_anim(my_sprites[? "LedgeJ"]);
			//Invincible
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_jump_time;
			break;
		case PLAYER_STATE.ledge_roll:
			//Animation
			set_anim(my_sprites[? "LedgeR"]);
			//Invincible
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			//Timer
			state_frame = ledge_roll_time;
			break;
		case PLAYER_STATE.ledge_snap:
			//Animation
			set_anim(my_sprites[? "LedgeS"]);
			//Allow for "2 frame" punish
			hurtbox_set_inv(hurtbox, INV.normal, 0);
			break;
		case PLAYER_STATE.ledge_tether:
			//Animation
			set_anim(my_sprites[? "LedgeT"]);
			//Superarmor!
			hurtbox_set_inv(hurtbox, INV.superarmor, 1);
			break;
		case PLAYER_STATE.ledge_trump:
			//Animation
			set_anim(my_sprites[? "LedgeTr"]);
			break;
		case PLAYER_STATE.lost:
			//Animation
			anim_sprite = -1;
			//Invulnerability
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			//Settings
			set_speed(0, 0, false, false);
			x = room_width div 2;
			y = room_height div 2;
			break;
		case PLAYER_STATE.magnetized:
			//Animation
			set_anim(my_sprites[? "Magnet"]);
			break;
		case PLAYER_STATE.parry_stun:
			//Animation
			if (on_ground())
				{
				set_anim(my_sprites[? "ParryS"]);
				}
			else
				{
				set_anim(my_sprites[? "Tumble"]);
				}
			break;
		case PLAYER_STATE.parrying:
			//Run the start phase of the parry script, which handles animation
			if (script_exists(parry_script))
				{
				script_execute(parry_script, PHASE.start);
				}
			break;
		case PLAYER_STATE.respawning:
			//Animation
			set_anim(my_sprites[? "Idle"]);
			//Invulnerability
			hurtbox_set_inv(hurtbox, INV.invincible ,respawning_inv_time);
			//Timer
			state_frame = respawn_platform_max_time;
			break;
		case PLAYER_STATE.rolling:
			//Animation
			set_anim(my_sprites[? "Rolling"]);
			//Speeds
			set_speed(0, 0, false, false);
			//Timers
			state_frame = roll_startup;
			state_phase = 0;
			break;
		case PLAYER_STATE.run_stop:
			//Animation
			set_anim(my_sprites[? "Run_Stop"]);
			break;
		case PLAYER_STATE.run_turnaround:
			//Animation
			set_anim(my_sprites[? "Run_Turn"]);
			break;
		case PLAYER_STATE.running:
			//Animation
			set_anim(my_sprites[? "Run"]);
			break;
		case PLAYER_STATE.screen_ko:
			//Animation
			set_anim(my_sprites[? "ScreenKO"]);
			//Timer
			state_frame = screen_ko_base_time;
			break;
		case PLAYER_STATE.shielding:
			//Animation
			set_anim(my_sprites[? "Shield"]);
			//Shield type
			switch(shield_type)
				{
				case SHIELD.melee:
					{
					hurtbox_set_inv(hurtbox, INV.powershielding, 1);
					shield_stun = 0; //Reset shieldstun
					break;
					}
				case SHIELD.ultimate:
					{
					hurtbox_set_inv(hurtbox, INV.shielding, 1);
					shield_stun = 0; //Reset shieldstun
					break;
					}
				}
			break;
		case PLAYER_STATE.shield_break:
			//Animation
			set_anim(my_sprites[? "Tumble"]);
			//Invulnerable
			hurtbox_set_inv(hurtbox, INV.invincible, 1);
			break;
		case PLAYER_STATE.shield_release:
			//Animation
			set_anim(my_sprites[? "ShieldR"]);
			break;
		case PLAYER_STATE.spot_dodging:
			//Animation
			set_anim(my_sprites[? "SDodge"]);
			//No invulnerability
			hurtbox_set_inv(hurtbox, INV.normal, 0);
			break;
		case PLAYER_STATE.star_ko:
			//Animation
			set_anim(my_sprites[? "StarKO"]);
			//Timer
			state_frame = star_ko_base_time;
			break;
		case PLAYER_STATE.tech_wall_jump:
			//Animation
			set_anim(my_sprites[? "Techjump"]);
			//No speed
			set_speed(0, 0, false, false);
			//Invulnerable
			hurtbox_set_inv(hurtbox, INV.invincible, tech_active);
			break;
		case PLAYER_STATE.teching:
			//Animation
			set_anim(my_sprites[? "Teching"]);
			//No speed
			set_speed(0, 0, false, false);
			//Invulnerable
			hurtbox_set_inv(hurtbox, INV.invincible, tech_active);
			break;
		case PLAYER_STATE.techrolling:
			//Animation
			set_anim(my_sprites[? "Techroll"]);
			//No speed
			set_speed(0, 0, false, false);
			//Invulnerable
			hurtbox_set_inv(hurtbox, INV.invincible, techroll_startup);
			break;
		case PLAYER_STATE.walk_turnaround:
			//Animation
			set_anim(my_sprites[? "Walk_Turn"]);
			break;
		case PLAYER_STATE.walking:
			//Animation
			set_anim(my_sprites[? "Walk"]);
			break;
		case PLAYER_STATE.wall_cling:
			//Animation
			set_anim(my_sprites[? "WallC"]);
			break;
		case PLAYER_STATE.wall_jump:
			//Animation
			set_anim(my_sprites[? "WallJ"]);
			//Phase
			state_phase = 0;
			break;
		case PLAYER_STATE.wavelanding:
			//Animation
			set_anim(my_sprites[? "Waveland"]);
			break;
		default:
			show_debug_message("The player has been assigned a nonexistent state!");
			break;
		}
	
	/* DEBUG */
	if (debug)
		{
		//Add states
		if (state_log[| ds_list_size(state_log) - 1] != state)
			{
			ds_list_add(state_log, state);
			}
		//Manage previous states - only 10 states
		while(ds_list_size(state_log) > 10)
			{
			ds_list_delete(state_log, 0);
			}
		}


}
