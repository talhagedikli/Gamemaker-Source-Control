//Up Special
/*
- Control the player with the left stick
- The move lasts longer at higher damage
*/
var run = true;
var _phase = argument_count > 0 ? argument[0] : attack_phase;
//Timer
attack_frame=max(--attack_frame,0);
//Main Phases
if (run)
	{
	switch(_phase)
		{
		//Initialize
		case PHASE.start:
			{
			//Animation
			anim_speed=0;
			anim_frame=0;
			
			set_speed(0,0,false,false);
			
			attack_frame=15;
			return;
			}
		//Startup
		case 0:
			{
			if (attack_frame==0)
				{
				//Animation
				anim_frame=1;
				change_facing();
				
				//Launch
				var launch_direction = stick_get_direction(Lstick);
				var launch_speed = 20;
				set_speed(lengthdir_x(launch_speed,launch_direction),lengthdir_y(launch_speed,launch_direction),false,false);
				
				create_melee(0,0,0.5,0.5,5,7,1,3,45,10,HITBOX_SHAPE.circle,0);
				
				attack_frame=18 + floor(damage / 4);
				attack_phase++;
				}
			break;
			}
		//Active
		case 1:
			{
			//Steering
			var steer_speed = 8;
			var old_direction = point_direction(0,0,hsp+hsp_frac,vsp+vsp_frac);
			var new_direction = old_direction - clamp(angle_difference(old_direction,stick_get_direction(Lstick)),-steer_speed,steer_speed);
			var launch_speed = 20;
			set_speed(lengthdir_x(launch_speed,new_direction),lengthdir_y(launch_speed,new_direction),false,false);
			
			if (attack_frame==0)
				{
				//Aerial vs grounded ending
				if (on_ground())
					{
					attack_frame=15;
					attack_phase=3;
					}
				else
					{
					attack_frame=5;
					attack_phase=2;
					}
				}
			break;
			}
		//Endlag aerial
		case 2:
			{
			//Animation
			anim_frame=0;
			
			//Drift
			set_speed(clamp(hsp,-5,5),clamp(vsp,-5,5),false,false);
			aerial_drift();
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.helpless);
				}
			break;
			}
		//Endlag grounded
		case 3:
			{
			//Animation
			anim_frame=0;
			
			//Friction (sliding)
			set_speed(clamp(hsp,-15,15),0,false,true);
			friction_gravity(ground_friction,grav,max_fall_speed);
			
			if (attack_frame==0)
				{
				attack_stop(PLAYER_STATE.idle);
				}
			break;
			}
		}
	}
//Movement
move();