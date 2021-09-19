//Up Special for Fox
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
			set_anim(spr_uspec_fox, 0, 0);
			
			//Variable management
			if (!variable_instance_exists(id, "uspec_fox_direction"))
				{
				uspec_fox_direction = 0;
				}
			
			set_speed(0, 0.5, false, false);
			attack_frame = 30;
			return;
			}
		//Startup -> Active
		case 0:
			{
			//Animation
			if (attack_frame == 24)
				anim_frame = 1;
			if (attack_frame == 18)
				anim_frame = 2;
			if (attack_frame == 12)
				anim_frame = 3;
			if (attack_frame == 6)
				anim_frame = 4;
				
			//Multihit Attacks
			if (attack_frame % 3 == 0)
				{
				hitbox_group_reset(0);
				var _hitbox = create_melee(0, 0, 0.9, 0.9, 1, 0, 0, 4, 180, 2, HITBOX_SHAPE.circle, 0, FLIPPER.toward_player_center);
				_hitbox.hitlag_scaling = 0;
				_hitbox.techable = false;
				}
				
			if (attack_frame == 0)
				{
				//Point in the correct direction
				var _dir = (stick_tilted(Lstick)) ? stick_get_direction(Lstick) : 90;
				set_speed(lengthdir_x(12, _dir), lengthdir_y(12, _dir), false, false);
				hitboxes_destroy_attached_all();
				var _hitbox = create_melee(0, 0, 0.9, 0.9, 9, 5, 0.5, 10, _dir, 25, HITBOX_SHAPE.circle, 1, FLIPPER.fixed);
				_hitbox.hitstun_scaling = 0.8;
				uspec_fox_direction = _dir;
				
				//Animation
				anim_frame = 5;
				anim_angle = (facing == 1 ? _dir : _dir - 180);
				
				attack_frame = 25;
				attack_phase++;
				}
			break;
			}
		//Active -> Endlag
		case 1:
			{
			//Animation
			if (attack_frame % 3 == 0)
				{
				anim_frame++;
				if (anim_frame > 9)
					anim_frame = 5;
				}
				
			//Hit the ground
			if (on_ground())
				{
				if (abs(angle_difference(uspec_fox_direction, 270)) < 45)
					{
					hitboxes_destroy_attached_all();
					set_speed(hsp / 2, -6, false, false);
					attack_frame = 20;
					attack_phase = 3;
					break;
					}
				}
			
			//Grab ledges
			if check_ledge_grab() return;
			
			//Speed
			set_speed(lengthdir_x(12, uspec_fox_direction), lengthdir_y(12, uspec_fox_direction), false, false);
			
			if (attack_frame == 0)
				{
				set_speed(hsp / 2, vsp / 2, false, false);
				attack_frame = 20;
				attack_phase++;
				}
			break;
			}
		//Finish
		case 2:
			{
			//Animation
			if (attack_frame == 16)
				anim_frame = 10;
			if (attack_frame == 12)
				anim_frame = 11;
			if (attack_frame == 8)
				anim_frame = 12;
			if (attack_frame == 4)
				anim_frame = 13;
				
			//Grab ledges
			if check_ledge_grab() return;
				
			//Now has friction/gravity
			friction_gravity(air_friction, grav, max_fall_speed);
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		//Grounded bounce
		case 3:
			{
			//Animation
			if (attack_frame == 16)
				anim_frame = 10;
			if (attack_frame == 12)
				anim_frame = 11;
			if (attack_frame == 8)
				anim_frame = 12;
			if (attack_frame == 4)
				anim_frame = 13;
				
			//Now has friction/gravity
			friction_gravity(air_friction, grav, max_fall_speed);
			
			//Drift
			aerial_drift();
			
			if (attack_frame == 0)
				{
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		}
	}
//Movement
move_hit_platforms();