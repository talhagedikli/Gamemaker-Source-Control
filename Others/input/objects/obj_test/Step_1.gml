input_tick();
input_hotswap_tick();

var _size = gamepad_get_device_count();
var _delta = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
test_index = (test_index + _delta + _size) mod _size;