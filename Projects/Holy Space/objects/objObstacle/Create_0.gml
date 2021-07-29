speed		= -0.5;
angleSpd	= choose(-2, -1, 0, 1, 2);
hp			= 2;
fadeOut		= false;
scale		= choose(1, 1.5, 2, 3);
image_blend	= c_white;

image_xscale	= scale;
image_yscale	= scale;

destroy = function()
{
	fadeOut = true;
}

/// @func getDamage()
getDamage = function()
{
	if (hp > 0)
	{
		hp--;
	}
	if (hp <= 0) destroy();
	image_blend = c_red;
}