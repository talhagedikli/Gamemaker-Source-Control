image_angle += angleSpd;
destroy();
if (instance_exists(objSky))
{
	image_blend = merge_color(c_white, surface_getpixel(objSky.sur, x, y), 0.7);
}