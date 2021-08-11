direction		= 180;
speed			= 1 * global.difficulty;

color			= surface_getpixel(objSky.sur, room_width / 2, y);
var c			= choose(global.starfieldColor, c_dkgray, c_gray, c_white);
color			= merge_color(c_white, c, 0.4)
angleSpd		= choose(-2, -1, 0, 1, 2);
hp				= 2;
fadeOut			= false;
scale			= choose(1, 1.5, 2, 3);
image_blend		= color;
image_index		= irandom_range(0, image_number - 1);
image_xscale	= scale;
image_yscale	= scale;
image_speed		= 0;
destroy = function()
{
	var a = audio_play_sound(aDestroy, 1, false);
	fadeOut = true;
}

leftOutRoom = function()
{
	if (bbox_right < 0) return true;
	return false;
}

/// @func getDamage()
getDamage = function()
{
	if (hp > 0)
	{
		hp--;
	}
	if (hp <= 0) destroy();
	image_blend = c_red;
}