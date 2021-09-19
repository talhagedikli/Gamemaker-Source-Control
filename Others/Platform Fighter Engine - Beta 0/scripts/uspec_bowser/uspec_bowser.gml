//Neutral Special
/*
- Multihit spin attack
- Always hits in a direction based on the way you were facing when the attack started
- Press down before the first hitbox comes out to fall downwards with the attack
*/
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
			anim_sprite = spr_uspec_bowser;
			anim_frame = 0;
			anim_speed = 0;
			
			landing_lag = 25;
			
			if (on_ground())
				{
				set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, 0, false, false);
				}
			else
				{
				if (vsp > 0)
					{
					set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, -1, false, false);
					}
				hurtbox_set_inv(hurtbox, INV.superarmor, 6);
				}
				
			attack_frame = 6;
			return;
			}
		//Startup
		case 0:
			{
			//Animation
			if (attack_frame == 4)
				anim_frame = 1;
			if (attack_frame == 2)
				anim_frame = 2;
				
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 3;
				
				attack_phase++;
				attack_frame = 30;
				
				//Special Drop
				if (!on_ground())
					{
					set_speed(stick_get_value(Lstick, DIR.horizontal) * 4, -12, true, false);
					if (stick_get_value(Lstick, DIR.down) > stick_tilt_amount)
						{
						set_speed(0, 16, true, false);
						var _hitbox = create_melee(0, 5, 0.8, 0.6, 9, 7, 1, 10, 290, 30, HITBOX_SHAPE.circle, 0);
						_hitbox.hit_fx_style = HIT_FX.explosion;
						_hitbox.hit_sfx = snd_hit_strong2;
						}
					else
						{
						create_melee(0, 5, 0.8, 0.6, 1, 8, 0, 2, 90, 3, HITBOX_SHAPE.circle, 0, FLIPPER.toward_hitbox_center_horizontal);
						}
					}
				else
					{
					create_melee(0, 5, 0.8, 0.6, 1, 6, 0.1, 2, 90, 3, HITBOX_SHAPE.circle, 0, FLIPPER.toward_hitbox_center_horizontal);
					}
				}
			break;
			}
		//Active
		case 1:
			{
			if (on_ground())
				{
				if (stick_tilted(Lstick, DIR.horizontal))
					{
					set_speed(sign(stick_get_value(Lstick, DIR.horizontal)) * 0.5, 0, true, false);
					hsp = clamp(hsp, -4, 4);
					}
				}
			else
				{
				if (check_ledge_grab()) return;
				aerial_drift();
				friction_gravity(air_friction, 0.35, 12);
				}
				
			//Animation
			if (attack_frame % 2 == 0)
				{
				anim_frame++;
				if (anim_frame > 7)
					anim_frame = 4;
				}
				
			if (attack_frame % 3 == 0)
				{	
				if ((!on_ground() && vsp < 0) || on_ground())
					{
					hitbox_group_reset(1);
				
					var _hitbox = create_magnetbox(0, 5, 0.8, 0.6, 1, 2, hsp * 4 * facing, (vsp * 4) - 2, 10, 3, HITBOX_SHAPE.circle, 1);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_fx_style, HIT_FX.normal_weak);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.shieldstun_scaling, 0);
					}
				}
			
			if (run && attack_frame == 0)
				{
				//Animation
				anim_frame = 8;
				
				if (!on_ground())
					{
					if (vsp < 0)
						{
						var _hitbox = create_melee(0, 5, 0.8, 0.6, 5, 10, 0.1, 12, 30, 3, HITBOX_SHAPE.circle, 2);
						hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong2);
						}
					}
				else
					{
					var _hitbox = create_melee(0, 5, 0.8, 0.6, 6, 12, 0.5, 12, 55, 3, HITBOX_SHAPE.circle, 2);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, snd_hit_strong2);
					hitbox_set_property(_hitbox, HITBOX_PROPERTY.shieldstun_scaling, 0.1);
					}
				attack_phase++;
				attack_frame = 15;
				}
			break;
			}
		//Finish
		case 2:
			{
			if (on_ground())
				{
				friction_gravity(ground_friction);
				}
			else
				{
				friction_gravity(air_friction, grav, max_fall_speed);
				}
				
			//Animation
			if (attack_frame == 12)
				anim_frame = 9;
			if (attack_frame == 9)
				anim_frame = 10;
			if (attack_frame == 5)
				anim_frame = 11;
			
			if (attack_frame == 0)
				{
				if (on_ground())
					{
					attack_stop(PLAYER_STATE.idle);
					}
				else
					{
					attack_stop(PLAYER_STATE.helpless);
					}
				}
			break;
			}
		}
	}
//Movement
if (on_ground())
	{
	move_grounded();
	}
else
	{
	move();
	}