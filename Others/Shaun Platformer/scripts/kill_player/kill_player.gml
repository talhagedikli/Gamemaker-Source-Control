// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function kill_player(){
	with (o_gun) instance_destroy();
	instance_change(o_player_dead,true);

	direction = point_direction(other.x,other.y,x,y);
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2;
	if (sign(hsp)!=0) image_xscale = sign(hsp);
	
	global.kills -= global.killsthisroom;

}