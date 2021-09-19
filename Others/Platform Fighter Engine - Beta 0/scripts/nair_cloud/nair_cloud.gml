//Neutral Aerial
//Logic Control Variable
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame = max(--attack_frame, 0);
//Actions
friction_gravity(air_friction, grav, max_fall_speed);
fastfall_attack_try();
aerial_drift();
allow_hitfall();
//Cancels
if run && cancel_ground_check()	run = false;
//Main Phases
if (run)
	{
	switch(_phase)
		{
		//Initialize
		case PHASE.start:
			{
			anim_sprite = spr_nair_cloud;
			anim_speed = 0;
			anim_frame = 0;
			
			landing_lag = 10;
			attack_frame = 6;
			set_speed(0, -1, true, true);
			return;
			}
		//Startup
		case 0:
			{
			if (attack_frame == 3)
				anim_frame = 1;

			if (attack_frame == 0)
				{
				anim_frame = 2;
				create_melee(-38, -24, 0.3, 0.3, 8, 6, 0.6, 6, 50, 2, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				attack_frame = 14;
				attack_phase++;
				}
			break;
			}
		//Active
		case 1:
			{
			if (attack_frame == 12)
				{
				anim_frame = 3;
				create_melee(2, -42, 0.5, 0.5, 8, 8, 0.6, 4, 50, 4, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame == 10)
				{
				anim_frame = 4;
				create_melee(40, -20, 0.5, 0.5, 8, 8, 0.6, 4, 50, 4, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame == 8)
				{
				anim_frame = 5;
				create_melee(40, 8, 0.5, 0.5, 8, 8, 0.6, 4, 50, 5, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame == 6)
				{
				anim_frame = 6;
				create_melee(10, 42, 0.5, 0.5, 8, 5, 0.6, 4, 50, 6, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
			if (attack_frame == 3)
				{
				anim_frame = 7;
				create_melee(-26, 44, 0.4, 0.4, 8, 5, 0.6, 4, 50, 3, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
				}
				
			if (attack_frame == 0)
				{
				anim_frame = 8;
				if (attack_has_hit())
					{
					attack_frame = 7;
					landing_lag = 4;
					}
				else
					{
					attack_frame = 20;
					}
				attack_phase++;
				}
			break;
			}
		//Endlag
		case 2:
			{
			//Animation
			if (attack_frame == 18)
				anim_frame = 9;
			if (attack_frame == 14)
				anim_frame = 10;
			if (attack_frame == 10)
				anim_frame = 11;
			if (attack_frame == 6)
				anim_frame = 12;
			if (attack_frame == 2)
				anim_frame = 13;

			//Jump cancel out of lag
			if (attack_has_hit() && cancel_jump_check()) then break;
			
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