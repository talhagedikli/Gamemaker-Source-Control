/// @description get/set inputs

var gp_dev			=	global.gamepad_device;

global.key_left		=	keyboard_check(vk_left)					|| keyboard_check(ord("A"))	|| 
						gamepad_button_check(gp_dev, gp_padl)	|| (gamepad_axis_value(gp_dev, gp_axislh) < -0.5);
global.key_right	=	keyboard_check(vk_right)				|| keyboard_check(ord("D"))	|| 
						gamepad_button_check(gp_dev, gp_padr)	|| (gamepad_axis_value(gp_dev, gp_axislh) >  0.5);
global.key_up		=	keyboard_check(vk_up)					|| keyboard_check(ord("W"))	|| 
						gamepad_button_check(gp_dev, gp_padu)	|| (gamepad_axis_value(gp_dev, gp_axislv) < -0.5);
global.key_down		=	keyboard_check(vk_down)					|| keyboard_check(ord("S"))	|| 
						gamepad_button_check(gp_dev, gp_padd)	|| (gamepad_axis_value(gp_dev, gp_axislv) >  0.5);
global.key_jump		=	keyboard_check_pressed(vk_up)			|| keyboard_check_pressed(vk_space) ||
						gamepad_button_check_pressed(gp_dev, gp_face1);
