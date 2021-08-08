image_angle += angleSpd;
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


var bul = instance_place(x, y, objBullet)

if (instance_exists(bul))
{
	getDamage();
	instance_destroy(bul);
}

