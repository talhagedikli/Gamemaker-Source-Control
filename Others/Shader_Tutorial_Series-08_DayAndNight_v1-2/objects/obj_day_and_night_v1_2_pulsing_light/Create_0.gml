/// @description Init

randomize();
base_scale				= image_xscale;
scale_change_max		= 0.01;						// changeable in room	| max value added to base_scale to create a flickering light
scale_change_direction	= 1;						// changes in the alarm	| scales up or down
scale_change_start		= image_xscale;				// changes in the alarm	| tween the scale from this
scale_change_target		= random(scale_change_max);	// changes in the alarm	| tween the scale to  this
scale_change_speed		= room_speed * 0.1;			// changeable in room	| how quickly the scale changes direction
scale_change_timer		= 0;						// don't change			| used to tween in step event
alarm[0]				= 1;						// don't change			| changes scaling variables