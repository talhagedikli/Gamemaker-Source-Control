 ///@arg knockback_sprite
///@arg next_state
function knockback_state(knockback_sprite, next_state){
		set_state_sprite(knockback_sprite, 0, 0)
		image_xscale = -sign(knockback_speed);
		move_and_collide(knockback_speed, 0);
		var knockback_friction = 0.3;
		knockback_speed = approach(knockback_speed, 0, knockback_friction);
		if knockback_speed ==0 {		
			state = next_state;
		}	

}    