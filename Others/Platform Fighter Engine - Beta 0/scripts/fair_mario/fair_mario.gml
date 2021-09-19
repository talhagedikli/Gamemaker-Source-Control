//Forward Aerial
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Actions
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Cancels
if run && cancel_ground_check()	run = false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			anim_sprite = spr_fair_mario;
			anim_frame = 0;
			anim_speed = 0;
			landing_lag = 10;
			set_speed(0, -1, true, true);
			attack_frame = 14;
			return;
			}
		//Active
		case 0:
			{
			//Animation
			if (attack_frame == 10)
				anim_frame = 1;
			if (attack_frame == 6)
				anim_frame = 2;
			if (attack_frame = 4)
				anim_frame = 3;
  
			//Strong hitbox
			if (attack_frame == 0)
				{
				anim_frame = 4;
				//Creates both the spiking sweetspot and the sourspot
				var _hitbox = create_melee(34, 16, 0.6, 0.5, 13, 7.5, 0.75, 8, 300, 3, HITBOX_SHAPE.circle, 0);
				_hitbox.hit_sfx = snd_hit_strong;
				_hitbox.shieldstun_scaling = 0.5;
				_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				
				var _hitbox = create_melee(32, -4, 0.7, 0.9, 10, 12, 0.3, 6, 45, 3, HITBOX_SHAPE.circle, 0);
				_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				//Next phase
				attack_phase++;
				attack_frame = 10;
				}
			break;
			}
		//Endlag
		case 1:
			{
			//Animation
			if (attack_frame == 7)
				anim_frame = 5;
	
			if (attack_frame == 0)
				{
				//Whiff lag
				attack_phase++;
				attack_frame = attack_has_hit() ? 15 : 18;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 14)
				anim_frame = 6;
			if (attack_frame == 7)
				anim_frame = 7;	
				
			if (attack_frame == 0)
				{
				//Revert back to the original state
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move();