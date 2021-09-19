//Forward Special
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_fspec_wolf;
			anim_speed = 0;
			anim_frame = 0;
			
			parry_stun_time = 60;
			set_speed(clamp(hsp, -2, 2), clamp(vsp, -2, 2), false, false);
			attack_frame = 8;
			return;
			}
		//Startup -> First Hitbox
		case 0:
			{
			//Animation
			if (attack_frame == 4)
				anim_frame = 1;
				
			if (attack_frame == 0)
				{
				anim_frame = 2;
				set_speed(45 * facing, -10, false, false);
				attack_phase++;
				attack_frame = 5;
				var _hitbox = create_melee(0, -7, 1, 0.3, 3, 10, 0.1, 8, 70, 3, HITBOX_SHAPE.rotation, 0);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.sprite_angle, 25);
				}
			break;
			}
		//Second Hitbox
		case 1:
			{
			//Continue speed
			set_speed(45 * facing, -10, false, false);
			
			//Move up walls
			if (collision(x + facing, y, flags_create(FLAG.solid)))
				{
				set_speed(0, -20, true, false);
				}
				
			if (attack_frame == 0)
				{
				anim_frame = 3;
				set_speed(0, -1, false, false);
				attack_phase++;
				attack_frame = 10;
				var _hitbox = create_melee(0, 0, 0.6, 0.6, 10, 9, 1, 15, 270, 3, HITBOX_SHAPE.circle, 0);
				_hitbox.hit_sfx = snd_hit_strong;
				_hitbox.knockback_state = PLAYER_STATE.in_balloon;
				}
			break;
			}
		//Endlag -> Finish
		case 2:
			{
			//Animation
			if (attack_frame == 8)
				anim_frame = 4;
			if (attack_frame == 5)
				anim_frame = 5;
			if (attack_frame == 3)
				anim_frame = 6;
				
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.helpless);
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