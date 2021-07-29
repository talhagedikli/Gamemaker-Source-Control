image_angle += angleSpd;
if (fadeOut)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

if (image_blend != c_white)
{
	image_blend = merge_color(image_blend, c_white, 0.1);
}


var bul = instance_place(x, y, objBulletParent)

if (instance_exists(bul))
{
	getDamage();
	instance_destroy(bul);
}
