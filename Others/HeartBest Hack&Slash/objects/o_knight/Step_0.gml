switch (state)
{
	#region Chase State
	case "chase":
		set_state_sprite(s_knight_walk, 0.2, 0); 
		chase_state();
		break;
		#endregion
		
	#region Attack State	
	
	case "attack":
	
		set_state_sprite(s_knight_attack, 0.3, 0);
		
		if animation_hit_frame(4)
		{
			audio_play_sound(a_miss, 3, false);
			create_hitbox(x, y, self, s_skeleton_attack_one_damage, 4, 4, 10, image_xscale);
		}
		
		if animation_end()
		{
			state = "chase";
		}
		break;
		#endregion
	
	#region Knockback State
	case "knockback":
	knockback_state(s_knight_hitstun, "chase");
	break;
	#endregion
	
	case "death":
		death_state(s_knight_die);
		break;
	
	default:
	show_debug_message("State" + state + "does not exist")
	state = "chase";
	break;

}