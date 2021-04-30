function get_input(){
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	roll = keyboard_check_pressed(vk_space);
	attack = keyboard_check_pressed(vk_lcontrol);
	
	keyboard_set_map(ord("A"), vk_left);
	keyboard_set_map(ord("D"), vk_right);
	keyboard_set_map(ord("J"), vk_lcontrol);
	keyboard_set_map(ord("K"), vk_space);
	
}