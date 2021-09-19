//Ledge Attack for character0
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
friction_gravity(ground_friction,grav,max_fall_speed);
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
			anim_sprite=spr_ledge_attack0;
			anim_speed=0;
			anim_frame=0;
		
			attack_frame=5;
			hurtbox_set_inv(hurtbox, INV.invincible, 10);
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
			
				attack_phase++;
				attack_frame=5;
				var _hitbox = create_melee(20,10,1,0.5,6,9,0.4,3,40,4,HITBOX_SHAPE.circle,0);
				_hitbox.hit_fx_style = HIT_FX.slash;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=2;
			
				attack_phase++;
				attack_frame = attack_has_hit() ? 5 : 12;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame==3)
				anim_frame=3;
			
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