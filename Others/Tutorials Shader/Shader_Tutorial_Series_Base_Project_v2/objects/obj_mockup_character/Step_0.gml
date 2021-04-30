/// @description (un)pause


// PAUSE ANIMATION ON RMB:
//-----------------------------------------------------------------------------

if (mouse_check_button_pressed(mb_right))		image_speed = 0;

if (global.mobile){
	if mouse_check_button_released(mb_left)		image_speed = img_spd;
} else {
	if mouse_check_button_released(mb_right)	image_speed = img_spd;
}

