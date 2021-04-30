 //Get Player Input
if (hascontrol)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left or key_right or key_jump) 
	{
	    controller = 0;
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2) //abs pozitif yapar mutlak değer
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh));
		controller = 1;
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//Calculate Movement

var move = key_right - key_left;

hsp = (move * walksp) + gunkickx;
gunkickx = 0;

vsp = (vsp + grv) + gunkicky;
gunkicky = 0;

//jumping
can_jump -= 1;
if (can_jump > 0) && (key_jump) {
    vsp = -4;
	can_jump = 0;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,o_wall)) 
{
    while (!place_meeting(x+sign(hsp),y,o_wall))  //false olana kadar devam
	{
	    x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,o_wall)) 
{
    while (!place_meeting(x,y+sign(vsp),o_wall))  //false olana kadar devam
	{
	    y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,o_wall)) 
{
    sprite_index = s_player_airborne;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	can_jump = 10;
	if (sprite_index == s_player_airborne) 
{
	audio_play_sound(a_landing,4,false);
	audio_sound_pitch(a_landing,choose(0.8,1,1.2));
	repeat (5)
	{
		with (instance_create_layer(x,bbox_bottom,"Bullets",o_dust))	//bbox collision of the player
		{
			vsp = 0;
		}
	}
}
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = s_player;
	}
	else
	{
		sprite_index = s_player_run;
			
	}
	
}

if (hsp != 0) image_xscale = sign(hsp);