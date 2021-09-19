function fsmash0() {
	//Forward Smash for character0
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
				anim_sprite = spr_fsmash0;
				anim_frame = 0;
				anim_speed = 0;
		
				charge = 0;
		
				attack_frame = 18;
				return;
				}
			//Charging -> Startup
			case 0:
				{
				if (attack_frame == 0)
					{
					charge++;
					if (charge >= smash_attack_max_charge || (!button_hold(INPUT.smash) && !button_hold(INPUT.attack) && !button_hold(INPUT.special)))
						{
						attack_phase++;
						attack_frame = 4;
						}
					//Animation (every 8 frames switch the sprite)
					if (charge % 8 == 0)
						{
						if (anim_frame == 0)
							anim_frame = 1;
						else
							anim_frame = 0;
						}
					}
				break;
				}
			//Startup -> First Hit
			case 1:
				{
				//Animation
				anim_frame = 1;
		
				if (attack_frame == 0)
					{
					anim_frame = 2;
				
					set_speed(facing * 4, 0, false, false);
					attack_phase++;
					attack_frame = 4;
					var _damage = calculate_smash_damage(3);
					var _hitbox = create_melee(30, 0, 1.2, 0.7, _damage, 3, 0, 8, 40, 4, HITBOX_SHAPE.circle, 0, FLIPPER.toward_hitbox_center_horizontal);
					_hitbox.techable = false;
					_hitbox.asdi_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.drift_di_multiplier = 0;
					}
				break;
				}
			//First Hit -> Second Hit
			case 2:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 3;
				if (attack_frame == 1)
					anim_frame = 4;
		
				if (attack_frame == 0)
					{
					anim_frame = 5;
			
					set_speed(0, 0, false, false);
					attack_phase++;
					attack_frame = 4;
					var _damage = calculate_smash_damage(4);
					var _hitbox = create_melee(30, 0, 1.2, 0.7, _damage, 4, 0, 10, 150, 4, HITBOX_SHAPE.circle, 1, FLIPPER.toward_hitbox_center);
					_hitbox.techable = false;
					_hitbox.asdi_multiplier = 0;
					_hitbox.di_angle = 0;
					_hitbox.drift_di_multiplier = 0;
					}
				break;
				}
			//Second Hit -> Third Hit
			case 3:
				{
				//Animation
				if (attack_frame == 2)
					anim_frame = 6;
				if (attack_frame == 1)
					anim_frame = 7;
		
				if (attack_frame == 0)
					{
					anim_frame = 8;
				
					set_speed(facing * 4, 0, false, false);
					attack_phase++;
					attack_frame = 10;
					var _damage = calculate_smash_damage(8);
					var _hitbox = create_melee(30, 0, 1.2, 0.7, _damage, 9, 1.2, 26, 40, 8, HITBOX_SHAPE.circle, 2);
					_hitbox.hit_fx_style = [HIT_FX.normal_strong, HIT_FX.slash2];
					_hitbox.hit_sfx = snd_hit_strong2;
					_hitbox.custom_hitstun = 45;
					_hitbox.knockback_state = PLAYER_STATE.in_balloon;
					}
				break;
				}
			//Third Hit -> Endlag
			case 4:
				{
				//Animation
				if (attack_frame==7)
					anim_frame=9;
		
				if (attack_frame==0)
					{
					//Animation
					anim_frame=10;
			
					set_speed(0,0,false,false);
					attack_phase++;
					attack_frame=14;
					}
				break;
				}
			//Finish
			case 5:
				{
				//Animation
				if (attack_frame==8)
					anim_frame=11;
				
				if (attack_frame==0)
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
