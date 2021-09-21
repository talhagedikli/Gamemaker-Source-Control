/// @description Input manager create event that inherited by the other input managers
// Defaults

// These values will be used in step event for all other objects
p1 = {
	horizontalInput		: 0,
	verticalInput		: 0,
	keyRight			: 0,
	keyLeft				: 0,
	keyDown				: 0,
	keyUp				: 0,
	
	keyEPressed			: 0,
	keyRightPressed		: 0,
	keyLeftPressed		: 0,
	keyDownPressed		: 0,
	keyUpPressed		: 0,
	
	keyDash				: 0,
	keyShoot			: 0,
	keyShootPressed		: 0,
	keySwitchPressed	: 0,
	keySwitch			: 0,
	keyHitPressed		: 0,
	searchKeyPressed	: 0
}
p2 = {
	horizontalInput		: 0,
	verticalInput		: 0,
	keyRight			: 0,
	keyLeft				: 0,
	keyDown				: 0,
	keyUp				: 0,
	
	keyEPressed			: 0,
	keyRightPressed		: 0,
	keyLeftPressed		: 0,
	keyDownPressed		: 0,
	keyUpPressed		: 0,
	
	keyDash				: 0,
	keyShoot			: 0,
	keyShootPressed		: 0,
	keySwitchPressed	: 0,
	keySwitch			: 0
}
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
active		= true;

horizontalInput 	= 0;
verticalInput		= 0;

global.gameplayClock.add_begin_method(function()
{
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
	keyHitPressed		= keyboard_check_pressed(ord("A"));
	with (p1)
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
		
		keyDash				= keyboard_check(ord("N"));
		keyShoot			= keyboard_check(vk_space);
		keyShootPressed		= keyboard_check_pressed(vk_space);
		keySwitchPressed	= keyboard_check_pressed(ord("B"));
		keySwitch			= keyboard_check(ord("B"));
		keyHitPressed		= keyboard_check_pressed(ord("A"));
		searchKeyPressed	= keyboard_check_pressed(ord("S"));
	}
	with (p2)
	{
		horizontalInput		= (keyboard_check(ord("D")) - keyboard_check(ord("A")));		// Will be -1, 0 or 1
		verticalInput		= (keyboard_check(ord("S")) - keyboard_check(ord("W")));		// Will be -1, 0 or 1
		
		keyRight			= keyboard_check(ord("D"));
		keyLeft				= keyboard_check(ord("A"));
		keyDown				= keyboard_check(ord("S"));
		keyUp				= keyboard_check(ord("W"));
	
		keyRightPressed		= keyboard_check_pressed(ord("D"));
		keyLeftPressed		= keyboard_check_pressed(ord("A"));
		keyDownPressed		= keyboard_check_pressed(ord("S"));
		keyUpPressed		= keyboard_check_pressed(ord("W"));
		
		keyDash				= keyboard_check(vk_lshift);
		keyShoot			= keyboard_check(ord("E"));
		keyShootPressed		= keyboard_check_pressed(ord("E"));
		keySwitchPressed	= keyboard_check_pressed(ord("Q"));
		keySwitch			= keyboard_check(ord("Q"));
	}
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
	with (p1)
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
		keyHitPressed		= 0;
	}
	with (p2)
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
}



	
});















