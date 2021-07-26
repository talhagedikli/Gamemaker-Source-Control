///Create Event of the controller object
global.clock	= new iota_clock();
global.clock.set_update_frequency(60);
state = "normal";

element		= SCRIBBLE_NULL_ELEMENT;

global.clock.add_cycle_method(function()
{
	if (state == "normal")
	{
		if (InputManager.active == false) InputManager.active = true;
	}
	else if (state == "end")
	{
		InputManager.active = false;
		if (keyboard_check_pressed(ord("R")))
		{
			game_restart();
		}
	}
});
