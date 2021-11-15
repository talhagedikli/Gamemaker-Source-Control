/// @description Input manager create event that inherited by the other input managers
// Defaults
uiInput 	= true;
gpInput 	= true;
active		= true;
// These values will be used in step event for all other objects
p = {
	horizontalInput		: 0,
	verticalInput		: 0,
	keyRight			: 0,
	keyLeft				: 0,
	keyDown				: 0,
	keyUp				: 0,
	
	rotateLeft			: 0,
	rotateRight			: 0,
	
	keyRightPressed 	: 0,
	keyLeftPressed		: 0,
	keyDownPressed		: 0,
	keyUpPressed		: 0,
	

}
p2 = {
	horizontalInput		: 0,
	verticalInput		: 0,
	keyRight			: 0,
	keyLeft				: 0,
	keyDown				: 0,
	keyUp				: 0,
	
	keyRightPressed 	: 0,
	keyLeftPressed		: 0,
	keyDownPressed		: 0,
	keyUpPressed		: 0,
}

global.gpClock.add_begin_method(function()
{
	if (active) 
	{
		with (p)
		{
			horizontalInput		= (keyboard_check(vk_right) - keyboard_check(vk_left));		// Will be -1, 0 or 1
			verticalInput		= (keyboard_check(vk_down) - keyboard_check(vk_up));		// Will be -1, 0 or 1

			keyRight			= keyboard_check(vk_right);
			keyLeft				= keyboard_check(vk_left);
			keyDown				= keyboard_check(vk_down);
			keyUp				= keyboard_check(vk_up);
			
			rotateLeft			= keyboard_check(ord("E"));
			rotateRight			= keyboard_check(ord("Q"));

			keyRightPressed 	= keyboard_check_pressed(ord("D"));
			keyLeftPressed		= keyboard_check_pressed(ord("A"));
			keyDownPressed		= keyboard_check_pressed(ord("S"));
			keyUpPressed		= keyboard_check_pressed(ord("W"));
		}
		with (p2)
		{
			horizontalInput		= (keyboard_check(ord("D")) - keyboard_check(ord("A")));		// Will be -1, 0 or 1
			verticalInput		= (keyboard_check(ord("S")) - keyboard_check(ord("W")));		// Will be -1, 0 or 1
		
			keyRight			= keyboard_check(ord("D"));
			keyLeft				= keyboard_check(ord("A"));
			keyDown				= keyboard_check(ord("S"));
			keyUp				= keyboard_check(ord("W"));
		
			keyRightPressed 	= keyboard_check_pressed(ord("D"));
			keyLeftPressed		= keyboard_check_pressed(ord("A"));
			keyDownPressed		= keyboard_check_pressed(ord("S"));
			keyUpPressed		= keyboard_check_pressed(ord("W"));
		}
	} 
	else 
	{
		with (p)
		{
			keyRight			= 0;
			keyLeft				= 0;
			keyDown				= 0;
			keyUp				= 0;
			
			rotateLeft			= 0;
			rotateRight			= 0;
		
			keyRightPressed 	= 0;
			keyLeftPressed		= 0;
			keyDownPressed		= 0;
			keyUpPressed		= 0;
		}
		with (p2)
		{
			keyRight			= 0;
			keyLeft				= 0;
			keyDown				= 0;
			keyUp				= 0;
		
			keyRightPressed 	= 0;
			keyLeftPressed		= 0;
			keyDownPressed		= 0;
			keyUpPressed		= 0;
		}
	}
});















