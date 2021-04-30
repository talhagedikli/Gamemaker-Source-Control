x = o_player.x;
y = o_player.y + 10;

if (o_player.controller == 0)
{
image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (abs(controllerh) > 0.2 || (abs(controllerv)) > 0.2)
	{
		controller_angle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controller_angle;
}

firingdelay = firingdelay - 1;
recoil = max(0, recoil-1);

if ((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0)) 
{
	recoil = 4;
	firingdelay = 5;
	screen_shake(2,10);
	audio_play_sound(a_shot,5,false);
	audio_sound_pitch(a_shot,choose(0.8,1,1.2));
	with (instance_create_layer(x,y,"Bullets",o_bullet))
	{
		spd = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
		
	}
	
	with (o_player) 
	{
		gunkickx = lengthdir_x(1,other.image_angle-180);
		gunkicky = lengthdir_y(0.75,other.image_angle-180);
	}
}

x = x - lengthdir_x(recoil, image_angle);  // lengthdir gitmek istediğin uzaklık ve yönü yaz. Başında "-" olduğu için ters yön.
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle <270)
{
    image_yscale = -1;
}
else
{
	image_yscale = 1;
}