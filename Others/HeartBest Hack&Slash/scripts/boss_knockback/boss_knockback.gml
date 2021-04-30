// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function boss_knockback(){
	move_and_collide(knockback_speed, 0);
	var knockback_friction = 0.15;
	knockback_speed = approach(knockback_speed, 0, knockback_friction);
	
}