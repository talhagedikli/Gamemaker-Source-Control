/// @description drag or automate slider

if (mouse_down) {
	value = clamp((device_mouse_x_to_gui(0) - x + 0.5 * bar_width - btn_x_padding) / slider_width, 0, 1);
} else {
	if (automation_type == 1) {
		value += automation_spd * automation_sign;
		if (value >= 1) || (value <= 0) automation_sign = -automation_sign;
	} else if (automation_type == 2) {
		value += automation_spd;
		if (value >= 1) value -= 1;
	}
	value = clamp(value, 0, 1);
}

