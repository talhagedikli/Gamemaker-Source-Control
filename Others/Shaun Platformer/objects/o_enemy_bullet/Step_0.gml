 x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
 

if (place_meeting(x,y,o_wall)) && (image_index != 0)
{
	while (place_meeting(x,y,o_wall))
	{
	x -= lengthdir_x(1,direction);
	y -= lengthdir_y(1,direction);	
	}
	spd = 0;
	if (direction <= 180 && direction >= 0)
	{
	instance_change(o_hitspark,true);
	}
	else
	{
		x = xstart;
		y = ystart;
		spd=25;
		audio_play_sound(a_shot_ground,10,false);
		audio_sound_pitch(a_shot_ground,choose(0.8,1,1.2));
		instance_destroy();
	}

}
	