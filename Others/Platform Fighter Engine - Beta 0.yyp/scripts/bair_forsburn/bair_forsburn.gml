function bair_forsburn() {
	//Backward Aerial
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame=max(--attack_frame,0);
	friction_gravity(air_friction,grav,max_fall_speed);
	fastfall_attack_try();
	allow_hitfall();
	aerial_drift();
	//Canceling
	if run && cancel_ground_check() run = false;
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite=spr_bair_forsburn;
				anim_speed=0;
				anim_frame=0;
				landing_lag=8;
				set_speed(0,-1,true,true);
				vsp_frac=0;
				attack_frame=13;
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
					attack_frame=14;
					create_melee(-35,10,0.5,0.4,12,8,1,8,140,2,HITBOX_SHAPE.circle,0);
					create_melee(-60,15,0.6,0.2,6,6,0.6,5,130,14,HITBOX_SHAPE.square,0);
					}
				break;
				}
			//Active -> Endlag
			case 1:
				{
				if (attack_frame<8)
					{
					//Animation
					anim_frame=2;
					}
				if (attack_frame==0)
					{
					attack_phase++;
					attack_frame=8;
					}
				break;
				}
			//Finish
			case 2:
				{
				if (attack_frame<2)
					{
					//Animation
					anim_frame=3;
					}
				if (attack_frame==0)
					{
					attack_stop(PLAYER_STATE.aerial);
					}
				break;
				}
			}
		}
	//Movement
	move();


}
