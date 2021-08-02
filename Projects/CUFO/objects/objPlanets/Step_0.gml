image_angle += angleSpd;
destroy();
if (instance_exists(objSky) || image_blend != merge_color(c_white, spaceCol, 0.7))
{
	image_blend = merge_color(c_white, spaceCol, 0.7);
}