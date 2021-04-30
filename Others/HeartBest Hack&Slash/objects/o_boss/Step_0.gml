switch (state) {
    case "chase":
        boss_chase_state();

		boss_knockback();
        break;
		
	case "stall":
		set_state_sprite(s_boss_idle, 0.15, 0);
		if alarm[1] <= 0 
		{
			state = "chase";
		}
		boss_knockback();
		break;
		
	case "attack":
		set_state_sprite(s_boss_attack, 0.25, 0);
		if animation_hit_frame(7)
		{
			audio_play_sound(a_medium_hit, 3, false);
			audio_play_sound(a_big_hit, 2, false);
			create_hitbox(x, y, self, s_boss_attack_damage, 10, 3, 20, image_xscale);
			add_screenshake(10, 16);
		}
		if animation_end()
		{	state = "stall"
			alarm[1] = 30;
		}
		move_and_collide(knockback_speed, 0);
		var knockback_friction = 0.15;
		knockback_speed = approach(knockback_speed, 0, knockback_friction);
			
		break;
		
	case "death":
		death_state(s_boss_die);
		break
	
	
	
	
	default:
        // code here
        break;
}      