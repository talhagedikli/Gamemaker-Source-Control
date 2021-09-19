///Standard_Parry_Stun
function Standard_Parry_Stun() {
	//Contains the standard actions for the parry stun state.
	var run = true;
#region Animation
	if (on_ground())
		{
		continue_anim_loop(my_sprites[? "ParryS"]);
		}
#endregion
#region Friction and Gravity
	if (on_ground())
		{
		friction_gravity(hard_landing_friction, grav, max_fall_speed);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
		}
#endregion
#region When the lag is done
	if (run && state_frame == 0)
		{
		//Return to idle state
		set_state(PLAYER_STATE.idle);
		run = false;
		}
#endregion
	move();


}
