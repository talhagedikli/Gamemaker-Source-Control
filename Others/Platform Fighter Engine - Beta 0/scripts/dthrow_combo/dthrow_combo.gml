//Downward Throw
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
friction_gravity(ground_friction, grav, max_fall_speed);
if run && cancel_air_check() run = false;
//Phases
if (run)
	{
	switch(_phase)
		{
		case PHASE.start:
			{
			//Animation
			anim_sprite = spr_dspec_shine;
			anim_speed = 0;
			anim_frame = 0;
		
			attack_frame = 13;
			
			//Grant superarmor to avoid interruptions
			hurtbox_set_inv(hurtbox, INV.invincible, 20);
			
			//Move opponent close
			grabbed_id.grab_hold_x = 10;
			grabbed_id.grab_hold_y = -15;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame == 6)
				{
				anim_frame = 1;
				grabbed_id.grab_hold_y = 15;
				}
				
			//Final hitbox
			if (attack_frame == 0)
				{
				anim_frame = 2;
				attack_phase++;
				attack_frame = 13;
				var _hitbox = create_targetbox(0, 0, 1, 1, 7, 8, 0.6, 7, 65, 1, HITBOX_SHAPE.square, 0, grabbed_id);
				_hitbox.hit_fx_style = [HIT_FX.normal_weak];
				_hitbox.hit_sfx = [snd_hit_weak, snd_hit_weak2];
				_hitbox.techable = false;
				_hitbox.di_angle = 0;
				create_fx(spr_dust_impact, 1, 0, 21, x, bbox_bottom + 1, 1, 90, "FX_Layer_Below");
				}
			break;
			}
		//Active -> Finish
		case 1:
			{
			if (attack_frame == 9)
				anim_frame = 3;
			if (attack_frame = 5)
				anim_frame = 4;
			
			//Finish
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Stay on the ground
move_grounded();