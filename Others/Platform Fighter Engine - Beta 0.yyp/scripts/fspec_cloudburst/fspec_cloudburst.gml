function fspec_cloudburst() {
	//Forward Special
	/*
	- Fires a controllable cloud
	- Hold the button to keep controlling the cloud
	*/
	var run = true;
	var _phase = argument_count > 0 ? argument[0] : attack_phase;
	//Timer
	attack_frame = max(--attack_frame, 0);
	if (on_ground())
		friction_gravity(ground_friction,grav,max_fall_speed);
	else
		friction_gravity(air_friction,grav,max_fall_speed);
	
	//Phases
	if (run)
		{
		switch(_phase)
			{
			case PHASE.start:
				{
				//Animation
				anim_sprite = spr_dspec_shine;
				anim_speed = 0;
				anim_frame = 0;

				attack_frame = 10;
				fspec_cloudburst_id = noone;
				return;
				}
			//Startup -> Shoot
			case 0:
				{
				//Animation
				if (attack_frame == 5)
					anim_frame = 1;
				
				if (attack_frame == 0)
					{
					anim_frame = 2;
				
					attack_phase++;
					attack_frame=10;
					var _cloud = create_entity(x + (25 * facing), y, obj_fspec_cloudburst, "Player_Front");
					_cloud.hsp = 15 * facing;
					_cloud.vsp = 0;
					fspec_cloudburst_id = _cloud;
					}
				break;
				}
			//Endlag -> Finish
			case 1:
				{
				//Animation
				if (attack_frame == 8)
					anim_frame = 3;
				
				//Curve
				if (instance_exists(fspec_cloudburst_id))
					{
					if (stick_tilted(Lstick))
						{
						var _cloud = fspec_cloudburst_id;
						var _newdir = stick_get_direction(Lstick);
						var _olddir = point_direction(0, 0, _cloud.hsp, _cloud.vsp);
						var _dir = _olddir - clamp(angle_difference(_olddir, _newdir), -4, 4);
						_cloud.hsp = lengthdir_x(15, _dir);
						_cloud.vsp = lengthdir_y(15, _dir);
						}
					}
			
				//You can infinitely extend the attack by holding the button
				if (attack_frame == 0 && !button_hold(INPUT.special, 1))
					{
					if (instance_exists(fspec_cloudburst_id))
						{
						fspec_cloudburst_id.mode = 1;
						}
					attack_set_cooldown(60);
					attack_stop();
					}
				break;
				}
			}
		}
	//Movement
	move();


}
