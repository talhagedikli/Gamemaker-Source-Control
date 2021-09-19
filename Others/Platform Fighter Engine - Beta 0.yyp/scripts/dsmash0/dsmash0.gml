function dsmash0() {
	//Down Smash for character0
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	friction_gravity(slide_friction, grav, max_fall_speed);
	//Canceling
	if run && cancel_air_check() run = false;

	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dsmash0;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 8;
				return;
				}
			//Charging -> Startup
			case 0:
				{
				//Animation (every 8 frames switch the sprite)
				if (charge % 8 == 0)
					{
					if (anim_frame == 0)
						{
						anim_frame = 1;
						}
					else
						{
						anim_frame = 0;
						}
					}
			
				charge++;
				if ((charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special))) && attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 2;
					}
				break;
				}
			//Startup -> Attack
			case 1:
				{
				//Animation
				if (attack_frame == 5)
					anim_frame = 2;
		
				if (attack_frame == 0)
					{
					anim_frame = 3;
				
					attack_phase++;
					attack_frame = 3;
					create_magnetbox(-36, 16, 0.9, 0.2, 4, 10, 60 + hsp, -5, 20, 4, HITBOX_SHAPE.square, 0);
					}
				break;
				}
			//Attack -> Inbetween Phase
			case 2:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 4;
				if (attack_frame == 1)
					anim_frame = 5;
			
				if (attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 2;
					}
				break;
				}
			//Inbetween -> Attack
			case 3:
				{
				//Animation
				anim_frame = 6;
		
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 7;
				
					attack_phase++;
					attack_frame = 6;
					var _damage = calculate_smash_damage(11);
					var _hitbox = create_melee(36, 20, 1.1, 0.4, _damage, 8.5, 1.2, 30, 45, 7, HITBOX_SHAPE.square, 1);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_strong);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong);
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Attack -> Endlag
			case 4:
				{
				if (attack_frame == 0)
					{
					set_speed(0, 0, false, false);
					attack_phase++;
					attack_frame = 24;
					}
				break;
				}
			//Finish
			case 5:
				{
				//Animation
				if (attack_frame == 12)
					anim_frame = 8;
		
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


}
