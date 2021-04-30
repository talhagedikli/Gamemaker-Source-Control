/// @description flicker


var new_scale	= lerp(scale_change_start, scale_change_target, scale_change_timer/scale_change_speed);
image_xscale	= new_scale;
image_yscale	= new_scale;
scale_change_timer++;

var sprite = toggle_get_group_active(1);
switch (sprite) {
	case 0: sprite_index = spr_light_circular_01; break;
	case 1: sprite_index = spr_light_circular_02; break;
	case 2: sprite_index = spr_light_circular_03; break;
	case 3: sprite_index = spr_light_circular_04; break;
}
