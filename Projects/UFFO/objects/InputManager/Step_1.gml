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

	keyRightPressed		= keyboard_check_pressed(vk_right);
	keyLeftPressed		= keyboard_check_pressed(vk_left);
	keyDownPressed		= keyboard_check_pressed(vk_down);
	keyUpPressed		= keyboard_check_pressed(vk_up);
	
	keyDash				= keyboard_check(ord("X"));
	keyShoot			= keyboard_check(ord("Z"));
	keyShootPressed		= keyboard_check_pressed(ord("Z"));
	keySwitchPressed	= keyboard_check_pressed(ord("Q"));
	keySwitch			= keyboard_check(ord("Q"));
} 
else 
{
	keyRight			= 0;
	keyLeft				= 0;
	keyDown				= 0;
	keyUp				= 0;
	
	keyEPressed			= 0;
	keyRightPressed		= 0;
	keyLeftPressed		= 0;
	keyDownPressed		= 0;
	keyUpPressed		= 0;

	keyDash				= 0;
	keyShoot			= 0;
	keyShootPressed		= 0;
	keySwitchPressed	= 0;
	keySwitch			= 0;
}



