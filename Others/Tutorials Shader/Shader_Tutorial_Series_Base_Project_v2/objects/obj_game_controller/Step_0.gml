/// @description Quit | Switch Room

// QUIT:
//-----------------------------------------------------------------------------

if (keyboard_check_pressed(vk_escape)) game_end();
if (keyboard_check_pressed(vk_backspace) && !gamepad_button_check(global.gamepad_device, gp_face2)) game_end();


// SWITCH ROOM BY KEYBOARD INPUTS:
//-----------------------------------------------------------------------------
var rm = 1000000;

if		keyboard_check_pressed(ord("0")) rm = 0;
else if keyboard_check_pressed(ord("1")) rm = 1;
else if keyboard_check_pressed(ord("2")) rm = 2;
else if keyboard_check_pressed(ord("3")) rm = 3;
else if keyboard_check_pressed(ord("4")) rm = 4;
else if keyboard_check_pressed(ord("5")) rm = 5;
else if keyboard_check_pressed(ord("6")) rm = 6;
else if keyboard_check_pressed(ord("7")) rm = 7;
else if keyboard_check_pressed(ord("8")) rm = 8;
else if keyboard_check_pressed(ord("9")) rm = 9;

var shift	= keyboard_check(vk_shift);
var ctrl	= keyboard_check(vk_control);
if room_exists(rm + 10 * shift + 20 * ctrl)
	room_goto( rm + 10 * shift + 20 * ctrl);

