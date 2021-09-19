//Backward Aerial
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(air_friction,grav, max_fall_speed);
fastfall_attack_try();
allow_hitfall();
aerial_drift();
//Canceling
if run && cancel_ground_check() run = false;

//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_bair_mario;
			anim_speed = 0;
			anim_frame = 0;
			landing_lag = 7;
			set_speed(0, -1, true, true);
			attack_frame = 9;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 5)
				anim_frame = 1;
			if (attack_frame == 3)
				{
				//Animation
				anim_frame = 2;
				
				var _hitbox = create_melee(-22, 0, 0.5, 0.7, 8, 11, 0.65, 8, 35, 4, HITBOX_SHAPE.square, 0, FLIPPER.from_player_center_horizontal);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.di_angle, 10);
				}
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 3;
			
				attack_phase++;
				attack_frame = 7;
				var _hitbox = create_melee(-36, 0, 1, 0.7, 8, 9, 0.65, 8, 140, 3, HITBOX_SHAPE.square, 0);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.di_angle, 10);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame == 8)
				anim_frame = 4;
			if (attack_frame == 4)
				anim_frame = 5;
			if (attack_frame == 0)
				{
				attack_phase++;
				//Whiff lag
				attack_frame = attack_has_hit() ? 10 : 18;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 9)
				anim_frame = 6;
			if (attack_frame == 5)
				anim_frame = 7;
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				run = false;
				}
			break;
			}
		}
	}
//Movement
move();

//Hurtbox matching
if (run)
	{
	hurtbox_match_animation();
	}