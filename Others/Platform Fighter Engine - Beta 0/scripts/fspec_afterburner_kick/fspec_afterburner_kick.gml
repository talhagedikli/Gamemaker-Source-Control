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
			anim_sprite = spr_fspec_afterburner_kick;
			anim_speed = 0;
			anim_frame = 0;
			
			set_speed(0, 0, true, false);
			attack_frame = 9;
			return;
			}
		//Startup -> Active
		case 0:
			{
			if (attack_frame == 6)
				anim_frame = 1;
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 2;
				
				//Speed
				set_speed(16 * facing, -3, false, false);
				
				attack_phase++;
				attack_frame = 6;
				create_melee(24, -5, 1.4, 0.5, 7, 13, 0.1, 12, 65, 7, HITBOX_SHAPE.circle, 0);
				create_melee(32, -16, 1.4, 0.5, 7, 13, 0.1, 12, 65, 7, HITBOX_SHAPE.circle, 0);
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Grab ledges
			if check_ledge_grab() return;
			
			//Speed
			set_speed(13 * facing, -3, false, false);
			
			//Animation
			if (attack_frame % 3 == 0)
				{
				anim_frame = anim_frame >= 7 ? 3 : anim_frame + 1;
				}
			
			if (attack_frame == 5)
				{
				create_melee(24, -5, 1.4, 0.5, 6, 10, 0.2, 8, 90, 13, HITBOX_SHAPE.circle, 0);
				create_melee(32, -16, 1.4, 0.5, 6, 10, 0.2, 8, 90, 13, HITBOX_SHAPE.circle, 0);
				}
			if (attack_frame == 0)
				{
				//Animation
				anim_frame = 3;
				
				//Whiff lag
				if (attack_has_hit())
					{
					attack_set_cooldown(0);
					attack_frame = 10;
					attack_phase = 2;
					}
				else
					{
					attack_set_cooldown(50);
					attack_frame = 15;
					attack_phase = 3;
					}
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame % 3 == 0)
				{
				anim_frame = anim_frame >= 7 ? 3 : anim_frame + 1;
				}
			if (attack_frame < 3)
				{
				anim_frame = 8;
				}
			
			//Speed
			friction_gravity(0.5);
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.aerial);
				}
			break;
			}
		//Alternate lag finish
		case 3:
			{
			//Animation
			if (attack_frame > 14)
				{
				if (attack_frame % 3 == 0)
					{
					anim_frame = anim_frame >= 7 ? 3 : anim_frame + 1;
					}
				}
			else if (attack_frame > 8)
				{
				anim_frame = 8;
				}
			else
				{
				anim_frame = 9;
				}
			
			//Speed
			friction_gravity(0.8, 0.2);
			
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