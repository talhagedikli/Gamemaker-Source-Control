// Feather disable all
#macro INPUT __InputInstance()

function Input() constructor
{
	// These values will be used in event_step event for all other objects
	active = true;
		
	horizontalInput		= false;
	verticalInput		= false;
							
	keyRight			= false;
	keyLeft				= false;
	keyDown				= false;
	keyUp				= false;

	keyShoot			= false;
	keyShootPressed		= false;
	
	keyReloadPressed	= false;
							
							
	keyDashPressed		= false;
	keyRun				= false;
							
	keyRightPressed 	= false;
	keyLeftPressed		= false;
	keyDownPressed		= false;
	keyUpPressed		= false;
							
	keyQuit				= false;
	keyRestart			= false;
	
	__update = function()
	{
		if (active)
		{
			horizontalInput		= (keyboard_check(ord("D")) - keyboard_check(ord("A")));		// Will be -1, 0 or 1
			verticalInput		= (keyboard_check(ord("S")) - keyboard_check(ord("W")));		// Will be -1, 0 or 1
	
			keyRight			= keyboard_check(ord("D"));
			keyLeft				= keyboard_check(ord("A"));
			keyDown				= keyboard_check(ord("S"));
			keyUp				= keyboard_check(ord("W"));
			
			keyShoot			= mouse_check_button(mb_left) || mouse_check_button_pressed(mb_left);
			keyShootPressed		= mouse_check_button_pressed(mb_left);
			
			keyReloadPressed	= keyboard_check_pressed(ord("R"));
		
			keyDashPressed		= keyboard_check_pressed(ord("Z"));
			keyRun				= keyboard_check(ord("B"));
	
			keyRightPressed 	= keyboard_check_pressed(ord("D"));
			keyLeftPressed		= keyboard_check_pressed(ord("A"));
			keyDownPressed		= keyboard_check_pressed(ord("S"));
			keyUpPressed		= keyboard_check_pressed(ord("W"));
					
			keyQuit				= keyboard_check_pressed(vk_escape);
			keyRestart			= keyboard_check_pressed(ord("R"));
		}
	}
	
	__caller = time_source_create(time_source_game, 1, time_source_units_frames, self.__update, [], -1);
	time_source_start(__caller);
}

function __InputInstance()
{
	static _ins = new Input();
	return _ins;
}

