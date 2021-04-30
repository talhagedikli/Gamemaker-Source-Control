x = owner.x;
y = owner.y + 10;

image_xscale = abs(owner.image_xscale);			//abs pozitif yapar
image_yscale = abs(owner.image_yscale);

if (instance_exists(o_player))
{
	if (o_player.x < x) image_yscale = -image_yscale;
	if (point_distance(o_player.x,o_player.y,x,y) < 600)
	{
		image_angle = point_direction(x,y,o_player.x,o_player.y);
		countdown--;
		if (countdown <= 0) 
		{
			countdown = countdown_rate;
			if (!collision_line(x,y,o_player.x,o_player.y,o_wall,false,false))	//ARADA DUVAR VAR MI YOK MY
			{	
				// bullet code here
				audio_play_sound(a_shot,5,false);
				audio_sound_pitch(a_shot,choose(0.8,1,1.2));
				with (instance_create_layer(x,y,"Bullets",o_enemy_bullet))
				{
				spd = 10;
				direction = other.image_angle + random_range(-3,3);
				image_angle = direction;
				}
			}
		}
	}
}