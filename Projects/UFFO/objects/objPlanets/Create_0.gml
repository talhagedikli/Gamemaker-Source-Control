randomize();
image_index		= irandom_range(0, image_number - 1);
speed			= random_range(0.5, 1);
direction		= 180;
image_speed		= 0;
var scl			= irandom_range(1, 1);
image_xscale	= scl;
image_yscale	= scl;
image_alpha		= image_index == image_number - 1 ? 0.5 : 1;
angleSpd		= image_index == image_number - 1 ? 0.1 : random_range(0, 0.05);
destroy			= function()
{
	if (bbox_right < room_width)
	{
		if (bbox_right < 0)
		{
			instance_destroy();
		}
	}
}

// Shader
res		= shader_get_uniform(shStarfield, "iResolution"); 
time	= shader_get_uniform(shStarfield, "time");
color	= shader_get_uniform(shStarfield, "color");
timer	= new Timer();

timer.start(infinity);