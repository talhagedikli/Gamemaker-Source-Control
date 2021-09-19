function fair_zetterburn() {
	//Forward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions / Cancels
	if run && cancel_ground_check() run = false;
	fastfall_attack_try();
	aerial_drift();
	friction_gravity(air_friction, grav, max_fall_speed);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fair_zetterburn;
				anim_speed = 0;
				anim_frame = 0;
			
				set_speed(0, -1, true, true);
			
				attack_frame = 9;
				return;
				}
			//Startup -> Active
			case 0:
				{
				//Animation
				if (attack_frame < 3)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					attack_frame = 3;
					attack_phase++;
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				//Animation
				anim_frame = 2;
			
				if (attack_frame == 2)
					{
					//Make the hitbox
					create_melee(40, 10, 0.17, 0.17, 13, 8, 0.75, 10, 40, 4, HITBOX_SHAPE.circle, 0);
					create_melee(30, -70, 0.23, 0.16, 6, 5, 0.2, 5, 60, 4, HITBOX_SHAPE.circle, 0);
					create_melee(45, -20, 0.85, 1.25, 8, 6, 0.25, 5, 45, 4, HITBOX_SHAPE.circle, 0);
					}
				if (attack_frame == 0)
					{
					attack_frame = 10;
					attack_phase++;
					}
				break;
				}
			//Finish
			case 2:
				{
				//Animation
				anim_frame = 3;
			
				if (attack_frame == 0)
					{
					//Revert back to the aerial state
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
