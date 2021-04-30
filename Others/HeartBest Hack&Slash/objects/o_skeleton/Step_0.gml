  switch (state)
{
	#region Move State
	case "move":
		
		if input.right 
		{
			move_and_collide(run_speed, 0);
			image_xscale = 1;
			sprite_index = s_skeleton_run;
			image_speed = 0.3;
		}

		if input.left
		{
			move_and_collide(-run_speed, 0);
			image_xscale = -1;
			sprite_index = s_skeleton_run;
			image_speed = 0.3;
	
		}

		if not input.right and not input.left
		{
			sprite_index = s_skeleton_idle;
			image_speed = 0.2;
		}
		else
		{
			if animation_hit_frame(2) or animation_hit_frame(5)
			{
				audio_play_sound(a_footstep, 2, false);
			}
		}
	
		if input.roll
		{	
			state = "roll";
		}
		
		if input.attack
		{
			state = "attack one";
		}
		break;
		#endregion
		
	#region Roll State
	case "roll":
		
		set_state_sprite(s_skeleton_roll, 0.3,0);
	
		if image_xscale = 1 
		{
			move_and_collide(roll_speed, 0);
		}
	
		if image_xscale = -1 
		{
			move_and_collide(-roll_speed, 0);
		}
		
		if animation_end()
		{
			state = "move"
		}
		break;
		#endregion
	
	#region Attack one
	case "attack one":
		
		set_state_sprite(s_skeleton_attack_one, 0.3, 0);
		
		if animation_hit_frame(0)
		{
			audio_play_sound(a_miss, 3, false);
			create_hitbox(x, y, self, s_skeleton_attack_one_damage , 3, 4, 5, image_xscale);
		}
		
		if input.attack and animation_hit_frame_range(2, 4)
		{
			state = "attack two";
		}
		
		if animation_end()
		{
			state = "move";
		}
		break;
		#endregion
	
	#region Attack Two
	case "attack two":
		set_state_sprite(s_skeleton_attack_two, 0.3, 0);
		
		if animation_hit_frame(1)
   		{
			audio_play_sound(a_miss, 3, false);
			create_hitbox(x, y, self, s_skeleton_attack_two_damage, 3, 4, 5, image_xscale);
		}
		
		if input.attack and animation_hit_frame_range(2, 4)
		{
			state = "attack three";
		}
		
		if animation_end()
		{
			state = "move";
		}
		break;
		#endregion
	
 	#region Attack Three
	case "attack three":
		set_state_sprite(s_skeleton_attack_three, 0.3, 0);
		
		if animation_hit_frame(2)
		{
			audio_play_sound(a_miss, 3, false); 
			create_hitbox(x, y, self, s_skeleton_attack_one_damage, 6, 4, 8, image_xscale);
		}      
		
		if animation_end()
		{
			state = "move";
		}
		break;
		#endregion
	
	#region Knockback State
	case "knockback":
		knockback_state(s_skeleton_hitstun, "move");
		break;
		#endregion

	default:
		show_debug_message("State" + state + "does not exist")
		state = "move";
		break;
}

