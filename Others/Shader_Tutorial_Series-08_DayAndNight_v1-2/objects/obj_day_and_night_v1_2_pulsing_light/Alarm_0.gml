/// @description change scale

scale_change_start		= image_xscale;
scale_change_target		= base_scale + scale_change_direction * random(scale_change_max);
scale_change_direction *= -1;
scale_change_timer		= 0;
alarm[0]				= scale_change_speed + random(scale_change_speed);
