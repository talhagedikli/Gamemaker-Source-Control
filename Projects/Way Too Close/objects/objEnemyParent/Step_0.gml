event_inherited();
if (blend.x != c_white)
{
	blend.x = merge_color(blend.x, c_white, 0.1);
}

image_blend = blend.x;
