/// @description advance timer

if dragging {
	global.slider1 = clamp((mouse_x - x) / slider_width, 0, 1);
} else {
	if (timer_type == 1) {
		global.slider1 += timer_step * timer_sign;
		if (global.slider1 >= 1) || (global.slider1 <= 0) timer_sign = -timer_sign;
	} else if (timer_type == 2) {
		global.slider1 += timer_step;
		if (global.slider1 >= 1) global.slider1 -= 1;
	}
	global.slider1 = clamp(global.slider1, 0, 1);
}