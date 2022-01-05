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
		
		keyJump 			= keyboard_check(vk_space);			
		rotateLeft			= keyboard_check(ord("E"));
		rotateRight			= keyboard_check(ord("Q"));

		keyRightPressed 	= keyboard_check_pressed(ord("D"));
		keyLeftPressed		= keyboard_check_pressed(ord("A"));
		keyDownPressed		= keyboard_check_pressed(ord("S"));
		keyUpPressed		= keyboard_check_pressed(ord("W"));
	}
	with (td)
	{
		horizontalInput		= (keyboard_check(vk_right) - keyboard_check(vk_left));		// Will be -1, 0 or 1
		verticalInput		= (keyboard_check(vk_down) - keyboard_check(vk_up));		// Will be -1, 0 or 1

		keyRight			= keyboard_check(vk_right);
		keyLeft				= keyboard_check(vk_left);
		keyDown				= keyboard_check(vk_down);
		keyUp				= keyboard_check(vk_up);
		
		keyJump 			= keyboard_check(vk_space);	
		keyDashPressed		= keyboard_check_pressed(ord("Z"));
		keyRun				= keyboard_check(ord("B"));

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
}
