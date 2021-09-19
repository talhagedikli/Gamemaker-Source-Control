///Standard_Airdodge
function Standard_Airdodge() {
	//Contains the standard actions for the airdodge state.
	var run = true;
	switch(airdodge_type)
		{
		case AIRDODGE.melee:
			{
		#region Melee
			switch(state_phase)
				{
				case 0:
					{
					if (state_frame == 0)
						{
						state_phase++;
						state_frame = airdodge_active;
						//Invulnerability
						hurtbox_set_inv(hurtbox, INV.invincible, airdodge_active);
						if (run && check_waveland())
							{
							run = false;
							//Reset invulnerability
							hurtbox_set_inv(hurtbox, INV.normal, 0);
							}
						}
					break;
					}
				case 1:
					{
					if (state_frame == 0)
						{
						state_phase++;
						state_frame = airdodge_endlag;
						}
					move_hit_platforms();
					if (run && check_waveland())
						{
						run = false;
						//Reset invulnerability
						hurtbox_set_inv(hurtbox, INV.normal, 0);
						}
					break;
					}
				case 2:
					{
					//No movement in endlag
					set_speed(0, 0, false, false);
					if (state_frame == 0)
						{
						state_phase = 0;
						//Change state
						set_state(PLAYER_STATE.aerial);
						return;
						}
					break;
					}
				}
			break;
		#endregion
			}
		case AIRDODGE.brawl:
			{
		#region Brawl
			switch(state_phase)
				{
				case 0:
					{
					if (state_frame == 0)
						{
						state_phase++;
						state_frame = airdodge_active;
						hurtbox_set_inv(hurtbox, INV.invincible, airdodge_active);
						}
					break;
					}
				case 1:
					{
					if (state_frame == 0)
						{
						state_phase++;
						state_frame = airdodge_endlag;
						}
					break;
					}
				case 2:
					{
					if (state_frame == 0)
						{
						state_phase = 0;
						set_state(PLAYER_STATE.aerial);
						}
					break;
					}
				}
			aerial_drift();
			friction_gravity(air_friction, grav, max_fall_speed);
			move_hit_platforms();
			if (on_ground())
				{
				set_state(PLAYER_STATE.in_lag);
				state_frame = airdodge_land_time;
				//Reset invulnerability
				hurtbox_set_inv(hurtbox, INV.normal, 0);
				}
			break;
		#endregion
			}
		case AIRDODGE.ultimate:
			{
		#region Ultimate
			switch(state_phase)
				{
				case 0:
					{
					if (!airdodge_is_directional)
						{
						friction_gravity(air_friction, grav, max_fall_speed);
						aerial_drift();
						}
					else
						{
						var spd = airdodge_dir_windup_speed, dir = (airdodge_direction - 180);
						set_speed(lengthdir_x(spd, dir), lengthdir_y(spd, dir), false, false);
						}
					if (state_frame == 0)
						{
						state_phase++;
						if (airdodge_is_directional)
							{
							state_frame = airdodge_dir_active;
							var spd = airdodge_dir_speed_min;
							if (airdodge_adjust_speed)
								{
								spd = lerp
									(
									airdodge_dir_speed_max,
									airdodge_dir_speed_min,
									(-dsin(airdodge_direction) * 0.5) + 0.5,
									);
								}
							var dir = airdodge_direction;
							set_speed(lengthdir_x(spd, dir), lengthdir_y(spd, dir), false, false);
							}
						else
							{
							state_frame = airdodge_active;
							}
						hurtbox_set_inv(hurtbox, INV.invincible, airdodge_active);
						}
					move_hit_platforms();
					break;
					}
				case 1:
					{
					if (state_frame == 0)
						{
						state_phase++;
						if (airdodge_is_directional)
							{
							if (airdodge_adjust_endlag)
								{
								state_frame = lerp
									(
									airdodge_dir_endlag_min,
									airdodge_dir_endlag_max,
									(dsin(airdodge_direction) * 0.5) + 0.5,
									);
								}
							else
								{
								state_frame = airdodge_dir_endlag_min;
								}
							}
						else
							{
							state_frame = airdodge_endlag;
							}
						}
					friction_gravity(air_friction, grav, max_fall_speed);
					if (!airdodge_is_directional)
						{
						aerial_drift();
						}
					move_hit_platforms();
					break;
					}
				case 2:
					{
					if (state_frame == 0)
						{
						state_phase = 0;
						set_state(PLAYER_STATE.aerial);
						}
					friction_gravity(air_friction, grav, max_fall_speed);
					aerial_drift_momentum();
					move_hit_platforms();
					break;
					}
				}
			if (on_ground())
				{
				set_state(PLAYER_STATE.in_lag);
				state_frame = airdodge_land_time;
				//Reset invulnerability
				hurtbox_set_inv(hurtbox, INV.normal, 0);
				}
			break;
		#endregion
			}
		}
	//No movement


}
