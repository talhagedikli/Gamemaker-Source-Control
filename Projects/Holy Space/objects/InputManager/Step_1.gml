/// @description 
/// @description 

if (active) 
{
	horizontalInput		= (keyboard_check(vk_right) - keyboard_check(vk_left));		// Will be -1, 0 or 1
	verticalInput		= (keyboard_check(vk_down) - keyboard_check(vk_up));		// Will be -1, 0 or 1

	keyRight			= keyboard_check(vk_right);
	keyLeft				= keyboard_check(vk_left);
	keyDown				= keyboard_check(vk_down);
	keyUp				= keyboard_check(vk_up);

	keySpace			= SPACE;
	keyAlt				= ALT;
	keyR				= keyboard_check(ord("R"));
	keyEsc				= keyboard_check(vk_escape);
	keyShiftPressed		= keyboard_check_pressed(vk_shift);

	keyIPressed			= keyboard_check_pressed(ord("I"));
	keyI				= keyboard_check(ord("I"));
	keyEPressed			= keyboard_check_pressed(ord("E"));

	keyRightPressed		= RIGHT_PRESSED;
	keyLeftPressed		= LEFT_PRESSED;
	keyDownPressed		= DOWN_PRESSED;
	keyUpPressed		= UP_PRESSED;

	keySpacePressed		= SPACE_PRESSED;
	keyAltPressed		= ALT_PRESSED;
	keyRPressed			= keyboard_check_pressed(ord("R"));
	keyEscPressed		= keyboard_check_pressed(vk_escape);
	
	keyDash				= keyboard_check(ord("X"));
	keyShoot			= keyboard_check(ord("Z"));
	keyShootPressed		= keyboard_check_pressed(ord("Z"));
	keySwitchPressed	= keyboard_check_pressed(ord("Q"));
	keySwitch			= keyboard_check(ord("Q"));
} 
else 
{
	keyRight			= undefined;
	keyLeft				= undefined;
	keyDown				= undefined;
	keyUp				= undefined;
	
	keySpace			= undefined;
	keyAlt				= undefined;
	keyR				= undefined;
	keyEsc				= undefined;
	keyShiftPressed		= undefined;
	keyIPressed			= undefined;
	keyI				= undefined;
	
	keyEPressed			= undefined;
	keyRightPressed		= undefined;
	keyLeftPressed		= undefined;
	keyDownPressed		= undefined;
	keyUpPressed		= undefined;
	
	keySpacePressed		= undefined;
	keyAltPressed		= undefined;
	keyRPressed			= undefined;
	keyEscPressed		= undefined;
	
	keyDash				= undefined;
	keyShoot			= undefined;
	keyShootPressed		= undefined;
	keySwitchPressed	= 0;
	keySwitch			= 0;
}



