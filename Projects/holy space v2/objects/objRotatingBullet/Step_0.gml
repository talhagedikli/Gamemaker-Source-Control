/// @description Insert description here
// You can write your code in this editor
image_angle += angleSpd;
direction	= image_angle;

if (fadeOut)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0) instance_destroy();
}

if (abs(startPos.x - x) < 1 && abs(startPos.y - y) < 1) destroy();