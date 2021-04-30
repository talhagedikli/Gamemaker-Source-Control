/// @description (de)select

var mx = click_region_gui ? device_mouse_x_to_gui(0) : mouse_x;
var my = click_region_gui ? device_mouse_y_to_gui(0) : mouse_y;

if mouse_check_button_pressed(mb_left)
&& point_in_rectangle(mx, my, x1_frame, y1_frame, x2_frame, y2_frame)
	if (global.selected_module == id) {
		if (deselectable) global.selected_module = noone;
	} else {
		global.selected_module = id;
	}