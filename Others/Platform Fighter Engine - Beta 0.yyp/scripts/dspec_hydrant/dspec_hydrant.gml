function dspec_hydrant() {
	//Down Special
	/*
	- Drops a fire hydrant object
	*/
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
		aerial_drift();
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
			
				attack_frame = 6;
				return;
				}
			//Create hydrant
			case 0:
				{
				//Animation
				if (attack_frame == 0)
					{
					//Animation
					anim_frame = 2;
				
					attack_phase++;
					attack_frame = 35;
					if (on_ground())
						{
						set_speed(0, -7, false, false);
						}
					else
						{
						set_speed(0, -4, true, false);
						}
					
					//Create the hydrant, but only if there isn't a user-owned hydrant in play currently
					var _existing = false;
					with(obj_dspec_hydrant)
						{
						if (owner == other.id)
							{
							_existing = true;
							break;
							}
						}
					if (!_existing)
						{
						var _hydrant = create_entity(x, y, obj_dspec_hydrant);
						//Fill the hydrant's hitbox groups with the player's ID so the player cannot be hit
						with(_hydrant)
							{
							facing = other.facing;
							hitbox_group_whitelist_id(other.id, 0);
							hitbox_group_whitelist_id(other.id, 2);
							}
						}
					}
				break;
				}
			//Finish
			case 1:
				{
				//Animation
				if (attack_frame == 20)
					anim_frame = 3;
			
				if (attack_frame == 0)
					{
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();


}
