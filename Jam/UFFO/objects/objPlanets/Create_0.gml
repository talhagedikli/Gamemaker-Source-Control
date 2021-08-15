randomize();
image_index		= irandom_range(0, image_number - 1);
speed			= random_range(0.1, 0.3) * global.difficulty;
direction		= 180;
image_speed		= 0;
var scl			= 2;
image_xscale	= scl;
image_yscale	= scl;
image_alpha		= image_index == image_number - 1 ? 0.5 : 1;
angleSpd		= 0.001;
spaceCol		= c_gray;
image_blend 	= merge_color(c_white, c_dkgray, 0.8);
destroy			= function()
{
	if (bbox_right < 0)
	{
		instance_destroy();
	}
}

