state.step();
if (leftOutRoom()) instance_destroy();
if (fadeOut)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

if (image_blend != color)
{
	image_blend = merge_color(image_blend, color, 0.05);
}

var bul = instance_place(x, y, objBullet);
if (bul != noone)
{
	if (bul.owner.object_index == objPlayer1 && !bul.state.state_is("death"))
	{
		var a = audio_play_sound(aHurt, 1, false);
		getDamage(bul);
	}
		
}
image_angle += angleSpd;
