if (fadeOut)
{
	alpha -= 0.01;
	if (alpha <= 0)
	{
		instance_destroy();
	}
}