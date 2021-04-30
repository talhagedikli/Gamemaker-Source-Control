/// @description Test Inputs

if keyboard_check_pressed(ord("Q")) slider_set_draw_value(irandom(2), irandom(1));
if keyboard_check_pressed(ord("W")) slider_set_automation_speed(irandom(2), random_range(0.03, 0.05));
if keyboard_check_pressed(ord("E")) slider_set_caption(irandom(2), choose("hi", "ho", "he"));
if keyboard_check_pressed(ord("R")) slider_set_sprite(irandom(2), choose(spr_btn_31x31px, spr_btn_96x31px, spr_btn_127x31px));
if keyboard_check_pressed(ord("T")) slider_set_value(irandom(2), random(1));

if keyboard_check_pressed(ord("A")) trigger_set_caption(irandom(2), choose("hi", "ho", "he"));
if keyboard_check_pressed(ord("S")) trigger_set_sprite(irandom(2), choose(spr_btn_31x31px, spr_btn_96x31px, spr_btn_127x31px));

if keyboard_check_pressed(ord("G")) toggle_set_caption(irandom(3), irandom(3), choose("hi", "ho", "he"));
switch (irandom(2)) {
	case 0:
	default:
		var spr_off	= spr_btn_31x31px;
		var spr_on	= spr_btn_31x31px_on;
		break;
	case 1:
		var spr_off	= spr_btn_96x31px;
		var spr_on	= spr_btn_96x31px_on;
		break;
	case 2:
		var spr_off	= spr_btn_127x31px;
		var spr_on	= spr_btn_127x31px_on;
		break;
}
if keyboard_check_pressed(ord("H")) toggle_set_sprite(irandom(3), irandom(3), spr_off, spr_on);

if trigger_get_released(0) {
	test_trigger_released = true;
	test_trigger_timer = room_speed;
}
if (test_trigger_released) {
	if (test_trigger_timer <= 0) test_trigger_released = false;
	test_trigger_timer--;
}

if trigger_get_released(1) slider_set_value(0, slider_get_value(0) + 0.5);

if trigger_get_released(2) info_text_set_text("Hello");

var hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var ver = keyboard_check(vk_down) - keyboard_check(vk_up);

camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 5 * hor, camera_get_view_y(view_camera[0]) + 5 * ver);