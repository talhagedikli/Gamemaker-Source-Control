lifetime--;

if (lifetime <= 10)
	{
	image_alpha = lifetime / 10;
	}

if (lifetime <= 0)
	{
	instance_destroy();
	}