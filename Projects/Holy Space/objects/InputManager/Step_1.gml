/// @description 
/// @description 

if (active) 
{
	horizontalInput	= (keyboard_check(vk_right) - keyboard_check(vk_left));		// Will be -1, 0 or 1
	verticalInput	= (keyboard_check(vk_down) - keyboard_check(vk_up));		// Will be -1, 0 or 1

	keyRight			= keyboard_check(vk_right);
	keyLeft				= keyboard_check(vk_left);
	keyDown				= keyboard_check(vk_down);
	keyUp				= keyboard_check(vk_down);

	keySpace			= SPACE;
	keyAlt				= ALT;
	keyR				= keyboard_check(ord("R"));
	keyEsc				= keyboard_check(vk_escape);
	keyShiftPressed		= keyboard_check_pressed(vk_shift);
	keyQPressed			= keyboard_check_pressed(ord("Q"));
	keyQ				= keyboard_check(ord("Q"));
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
} 
else 
{
	keyRight			= 0;
	keyLeft				= 0;
	keyDown				= 0;
	keyUp				= 0;
						  
	keySpace			= 0;
	keyAlt				= 0;
	keyR				= 0;
	keyEsc				= 0;
	keyShiftPressed		= 0;
	keyQPressed			= 0;
	keyQ				= 0;
	keyIPressed			= 0;
	keyI				= 0;
	keyEPressed			= 0;


						  
	keyRightPressed		= 0;
	keyLeftPressed		= 0;
	keyDownPressed		= 0;
	keyUpPressed		= 0;
						  
	keySpacePressed		= 0;
	keyAltPressed		= 0;
	keyRPressed			= 0;
	keyEscPressed		= 0;
}



