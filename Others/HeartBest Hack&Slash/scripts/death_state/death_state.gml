// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//@arg death_sprite

function death_state(death_sprite){
	set_state_sprite(death_sprite, 0.125, 0);
	friction = true;
	
	if image_index >= image_number - 1	
	{
		image_index = image_number - 1;
		image_speed = 0;
		
		if (image_alpha > 0) 
		{
		    image_alpha -= 0.05
		}
		else
		{
			instance_destroy();
		} 
	}
	
	move_and_collide(knockback_speed, 0);
	var knockback_friction = 0.15;
	knockback_speed = approach(knockback_speed, 0, knockback_friction);
}