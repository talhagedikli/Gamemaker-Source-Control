function dspec_rest() {
	//Down Special
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	if (on_ground())
		{
		friction_gravity(ground_friction);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
		}
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dspec_shine;
				anim_frame = 0;
				anim_speed = 0;
			
				attack_frame = 1;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
				
					attack_phase++;
					attack_frame = 36;
					//Grounded versus aerial
					create_melee(0, 0, 0.4, 0.4, 30, 14, 1, 25, 90, 3, HITBOX_SHAPE.circle, 0, FLIPPER.from_player_center_horizontal);
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Animation
				if (attack_frame == 20)
					anim_frame = 3;

				if (run && attack_frame == 0)
					{
					attack_phase++;
					attack_frame = 15;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				anim_frame = 4;
			
				if (attack_frame == 0)
					{
					if (on_ground())
						{
						attack_stop(PLAYER_STATE.idle);
						}
					else
						{
						attack_stop(PLAYER_STATE.aerial);
						}
					}
				break;
				}
			}
		}
	//Movement
	move();


}
