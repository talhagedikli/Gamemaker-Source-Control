if (!is_undefined(life))
{
	if (life <= 0)
	{
		active = false;
	}
	life--;
}

if (!active)
{
	if (ds_list_size(collisionList) > 0)
	{
		ds_list_clear(collisionList);
	}
	image_blend = c_blue;
}
else
{
	image_blend = color;
}