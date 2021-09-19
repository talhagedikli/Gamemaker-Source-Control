//Dash Attack
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Canceling
if run && cancel_air_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			anim_sprite = spr_dashattack_claw;
			anim_speed = 0;
			anim_frame = 0;
			
			//Initial boost
			set_speed(6 * facing, 0, true, true);
			hsp = clamp(hsp, -11, 11);
			
			//VFX
			var _fx = create_fx(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
			_fx.fx_xs = 2 * facing;
			
			attack_frame = 8;
			return;
			}
		//Startup
		case 0:
			{
			//Friction gravity
			friction_gravity(slide_friction);
			
			//Dash attack cancel up smash
			if (attack_frame > 3)
				{
				var _stick = Choose_Stick_By_Input(INPUT.smash);
				if (stick_tilted(_stick, DIR.up) && button(INPUT.smash))
					{
					attack_start(usmash0);
					break;
					}
				}
				
			if (attack_frame == 6)
				anim_frame = 1;
			if (attack_frame == 4)
				anim_frame = 2;
			if (attack_frame == 2)
				anim_frame = 3;
				
			if (attack_frame == 0)
				{
				anim_frame = 4;
			
				attack_phase++;
				attack_frame = 12;
				
				var _hitbox = create_melee(54, 0, 0.9, 1.0, 10, 7, 0.7, 7, 45, 4, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, [snd_hit_strong, snd_hit_strong2]);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.shieldstun_scaling, 0.4);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.extra_hitlag, 3);
				var _hitbox = create_melee(6, 6, 0.6, 0.6, 10, 7, 0.7, 7, 45, 4, HITBOX_SHAPE.circle, 0, FLIPPER.sakurai);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.hit_sfx, [snd_hit_strong, snd_hit_strong2]);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.shieldstun_scaling, 0.4);
				hitbox_set_property(_hitbox, HITBOX_PROPERTY.extra_hitlag, 3);
				}
			break;
			}
		//Active
		case 1:
			{
			//DACUS
			if (attack_has_hit())
				{
				var _stick = Choose_Stick_By_Input(INPUT.smash);
				if (stick_tilted(_stick, DIR.up, 20))
					{
					if (button(INPUT.smash, 20))
						{
						attack_start(my_attacks[? "Usmash"]);
						return;
						}
					}
				}
				
			//Friction gravity
			friction_gravity(ground_friction);
			
			if (attack_frame == 9)
				anim_frame = 5;
			if (attack_frame == 4)
				anim_frame = 6;
				
			if (attack_frame == 0)
				{
				anim_frame = 7;
				
				attack_phase++;
				attack_frame = attack_has_hit() ? 2 : 18;
				}
			break;
			}
		//Endlag
		case 2:
			{
			//Friction gravity
			friction_gravity(ground_friction);
	
			//Animation
			if (attack_frame == 9)
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