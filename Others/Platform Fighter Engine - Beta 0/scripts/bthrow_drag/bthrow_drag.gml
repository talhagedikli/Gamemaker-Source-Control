//Backward Throw
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
			anim_sprite = spr_bthrow_drag;
			anim_speed = 0;
			anim_frame = 0;
		
			attack_frame = 10;
			
			//No speed
			set_speed(0, 0, false, false);
			
			//Move the grabbed player behind
			grabbed_id.grab_hold_x = -45;
			grabbed_id.grab_hold_y = 2;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame == 5)
				anim_frame = 1;
				
			if (attack_frame == 0)
				{
				set_speed(-10 * facing, 0, false, false);
				anim_frame = 2;
			
				attack_phase++;
				attack_frame = 45;
				grabbed_id.grab_hold_x = -sign(facing) * 50;
				//Drag hitbox
				var _hitbox = create_magnetbox(-20, 14, 0.5, 0.5, 1, 1, -20, 2, 20, 14, HITBOX_SHAPE.square, 0);
				_hitbox.hit_sfx = snd_hit_weak2;
				_hitbox.hit_fx_style = HIT_FX.none;
				}
			break;
			}
		//Active -> Finish
		case 1:
			{
			//Animation
			if (attack_frame == 42)
				anim_frame = 3;
			if (attack_frame == 39)
				anim_frame = 4;
			if (attack_frame == 36)
				anim_frame = 5;
			if (attack_frame == 33)
				anim_frame = 6;
			if (attack_frame == 28)
				anim_frame = 8;
			if (attack_frame == 19)
				anim_frame = 9;
			if (attack_frame == 8)
				anim_frame = 10;
				
			//Drag loops
			if (attack_frame >= 11 && attack_frame % 2 == 0)
				{
				hitbox_group_reset(0);
				}
			
			//Final hit
			if (attack_frame == 30)
				{
				set_speed(0, 0, false, false);
				anim_frame = 7;
				var _hitbox = create_melee(-22, 0, 1, 0.7, 9, 13, 0.6, 4, 135, 7, HITBOX_SHAPE.circle, 1);
				_hitbox.hit_sfx = snd_hit_punch;
				_hitbox.hit_fx_style = HIT_FX.slash;
				}
			
			//Cancels
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