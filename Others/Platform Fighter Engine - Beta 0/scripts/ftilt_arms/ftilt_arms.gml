//Forward Tilt
/*
- Tilt the left stick up or down to get a different angle
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;

//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(ground_friction, grav, max_fall_speed);

//Canceling
if run && cancel_air_check() run = false;

//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			anim_sprite = spr_ftilt_arms;
			anim_speed = 0;
			anim_frame = 0;
			attack_frame = 14;
			
			//Variables
			ftilt_arms_x = 0;
			ftilt_arms_y = 0;
			ftilt_arms_angle = 0;
			return;
			}
		//Startup
		case 0:
			{
			//Animation
			if (attack_frame == 9)
				anim_frame = 1;
			if (attack_frame == 4)
				anim_frame = 2;
				
			if (attack_frame == 0)
				{
				anim_frame = 3;
				attack_phase++;
				attack_frame = 17;
				
				//Store angle
				var _val = stick_get_value(Lstick, DIR.vertical);
				if (_val < -0.15)
					{
					ftilt_arms_angle = -1;
					}
				else if (_val > 0.15)
					{
					ftilt_arms_angle = 1;
					}
				else 
					{
					ftilt_arms_angle = 0;
					}

				//Hitbox
				var _hitbox = create_melee(0, 0, 0.5, 0.5, 9, 8, 0.8, 8, 45, 18, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
				_hitbox.hit_sfx = snd_hit_punch;
				_hitbox.hit_fx_style = HIT_FX.normal_strong;
				_hitbox.hitstun_scaling = 2;
				}
			break;
			}
		//Active
		case 1:
			{
			//Animation
			if (attack_frame == 16)
				anim_frame = 4;
				
			//Move hitbox
			hitbox_move_attached_group(0, 13 * facing, ftilt_arms_angle * 2);
			ftilt_arms_x += (13 * facing);
			ftilt_arms_y += (ftilt_arms_angle * 2);
				
			//Cancel on hit
			if (attack_has_hit(true))
				{
				anim_frame = 5;
				attack_phase++;
				attack_frame = 20;
				hitboxes_destroy_attached_all();
				}
			else if (attack_frame == 0)
				{
				anim_frame = 5;
				attack_phase++;
				attack_frame = 30;
				}
			break;
			}
		//Endlag
		case 2:
			{
			//Animation
			if (attack_frame == 15)
				anim_frame = 6;
				
			//Move arm back
			ftilt_arms_x = lerp(ftilt_arms_x, 0, 0.15);
			ftilt_arms_y = lerp(ftilt_arms_y, 0, 0.15);

			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move_grounded();