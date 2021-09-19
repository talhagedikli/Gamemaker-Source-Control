//Forward Aerial
/*
- Hold down the button to delay the attack
- Has a sweetspot in the center
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
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
			anim_sprite = spr_fair_slash;
			anim_speed = 0;
			anim_frame = 0;
			
			landing_lag = 10;
			set_speed(0, -1, true, true);
			attack_frame = 30;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 27)
				anim_frame = 1;
				
			if ((attack_frame < 25 && !button_hold(INPUT.attack, 1) && !button_hold(INPUT.smash, 1)) ||
				attack_frame == 0)
				{
				//Animation
				anim_frame = 2;
			
				attack_phase++;
				attack_frame = 4;
				var _hitbox = create_melee(48, 0, 0.2, 0.2, 13, 7, 1, 10, 35, 4, HITBOX_SHAPE.square, 0);
				_hitbox.hit_fx_style = HIT_FX.slash;
				var _hitbox = create_melee(32, 0, 1.5, 0.5, 11, 6, 0.9, 3, 40, 6, HITBOX_SHAPE.circle, 0);
				_hitbox.hit_fx_style = HIT_FX.slash;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame == 2)
				anim_frame = 3;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 4;
				
				attack_phase++;
				attack_frame = 25;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 17)
				anim_frame = 5;
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		}
	}
//Movement
move();