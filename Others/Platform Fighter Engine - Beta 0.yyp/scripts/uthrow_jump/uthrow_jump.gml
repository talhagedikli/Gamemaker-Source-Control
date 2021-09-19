function uthrow_jump() {
	//Upward Throw
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	//Actions
	aerial_drift();
	friction_gravity(air_friction, grav, 2);
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_fthrow0;
				anim_speed = 0;
				anim_frame = 0;
		
				attack_frame = 20;
			
				//Jump upwards
				set_speed(0, -10, false, false);
				grabbed_id.grab_hold_x = 0;
				return;
				}
			//Startup -> Active
			case 0:
				{
				if (attack_frame == 15)
					anim_frame = 1;
				if (attack_frame == 10)
					anim_frame = 2;
				if (attack_frame == 5)
					anim_frame=  3;
				
			
				if (attack_frame == 0)
					{
					anim_sprite = spr_dspec_shine;
					anim_frame = 0;
					anim_speed = 1;
				
					attack_phase++;
					attack_frame = 10;
					set_speed(0, 0, false, false);
					//Throw in the direction pointed
					if (!stick_tilted(Lstick))
						{
						var _dir = 270;
						var _spd = 13;
						var _hitbox = create_targetbox(0, 0, 2, 2, 9, _spd, 0.3, 15, _dir, 1, HITBOX_SHAPE.square, 0, grabbed_id, FLIPPER.fixed);
						_hitbox.hit_sfx = snd_hit_punch;
						_hitbox.hit_fx_style = HIT_FX.normal_strong;
						}
					else
						{
						var _dir = stick_get_direction(Lstick);
						var _spd = 6 + (abs(angle_difference(_dir, 270)) / 180) * 4;
						var _hitbox = create_targetbox(0, 0, 2, 2, 9, _spd, 0.6, 15, _dir, 1, HITBOX_SHAPE.square, 0, grabbed_id, FLIPPER.fixed);
						_hitbox.hit_sfx = snd_hit_punch;
						_hitbox.hit_fx_style = HIT_FX.normal_strong;
						}
					}
				break;
				}
			//Active -> Finish
			case 1:
				{
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


}
