/// @description move


// PAUSE SCROLL ON RMB:
//-----------------------------------------------------------------------------

if (mouse_check_button_pressed(mb_right))		scroll = false;

if (global.mobile){
	if mouse_check_button_released(mb_left)		scroll = true;
} else {
	if mouse_check_button_released(mb_right)	scroll = true;
}



// SCROLL
//-----------------------------------------------------------------------------

if (scroll) {
	x += hspd;
	if (x < 0) x += sprite_width;

	y += vspd;
	if (y < 0) y += sprite_height;
}