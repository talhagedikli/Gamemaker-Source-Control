 //real = number
if _creator = noone or _creator = other or ds_list_find_index(hit_objects, other) != -1
{
	exit;
}

other.hp -= _damage;
audio_play_sound(a_medium_hit, 4, false);
repeat (10) {
    instance_create_layer(other.x, other.y, "Effects", o_hit_effect);
}

if instance_exists(o_skeleton)
{

 	if (_creator.object_index == o_skeleton and other.hp <=0 and other.state != "death" ) 
	{
	    o_skeleton.kills +=1;
	}
	if (other.object_index == o_skeleton )
		{
		// WE HIT THE PLAYER
		add_screenshake(4,8);
		
		if other.hp <= 0
		{	
				var number = sprite_get_number(s_skeleton_bones);
				add_screenshake(8, 8);
				for (var i=0; i<number; i++) 
				{
			    var bx = other.x + random_range(-8, 8);
				var by = other.y + random_range(-24, 8);
				var bone = instance_create_layer(bx, by, "Instances", o_skeleton_bones);
				bone.direction = 90 - (image_xscale * random_range(30, 60));
				bone.speed = random_range(2, 5);
				bone.image_index = i;
				if i==5 bone.image_angle = 130;
				}
				ini_open("save.ini");
				ini_write_real("Scores", "Kills", other.kills);
				var highscore = ini_read_real("Scores", "Highscore",0);
				if other.kills > highscore
				{
					ini_write_real("Scores", "Highscore", other.kills);
				}
				ini_close();
				
		}
		}
		else 
		{
			other.alarm[0] = 120;
			add_screenshake(1,4);
		}
	}

ds_list_add(hit_objects, other);
if other.state != "death" and other.object_index != o_boss
{
other.state = "knockback";
}
other.knockback_speed = _knockback * image_xscale;
