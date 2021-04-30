// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//@arg intensity
//@arg duration
function add_screenshake(intensity, duration){
	if not instance_exists(o_camera) exit;
	
	with (o_camera) {
	    screenshake = intensity;
		alarm[0] = duration;
	}
}