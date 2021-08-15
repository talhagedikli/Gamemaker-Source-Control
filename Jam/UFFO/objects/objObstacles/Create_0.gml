direction		= 180;
speed			= 1 * global.difficulty;

var c			= choose(c_gray);
color			= merge_color(c_white, c, 0.5)
angleSpd		= choose(-2, -1, 0, 1, 2);
hp				= 2;
point			= hp * 100;
fadeOut			= false;
scale			= choose(1, 1.5, 2, 3);
image_blend		= color;
image_index		= irandom_range(0, image_number - 1);
image_xscale	= scale;
image_yscale	= scale;
image_speed		= 0;
destroy = function()
{
	global.score	+= point;
	var a = audio_play_sound(aDestroy, 1, false);
	fadeOut = true;
}

leftOutRoom = function()
{
	if (bbox_right < 0) return true;
	return false;
}

getDamage = function(bullet)
{
	if (hp > 0)
	{
		hp -= bullet.damage;
	}
	bullet.destroy();
	if (hp <= 0) destroy();
	image_blend = c_red;
}
if (image_index == 0 || image_index == 1 || image_index == 2 || image_index == 3 || image_index == 4)
{
	hp = random_range(3.5, 4.5);
	point			= hp * 100;
}
else if (image_index ==  5 || image_index == 6)
{
	hp = random_range(1.8, 2.5);
	point			= hp * 100;
}
else
{
	hp = random_range(0.5, 1);
	point			= hp * 100;
}