///Create Event of the controller object
global.difficulty	= 1;
global.clock		= new iota_clock();
global.clock.set_update_frequency(60);

state = new SnowState("normal");

restartElement		= SCRIBBLE_NULL_ELEMENT;


state.add("normal", {
	enter: function()
	{
		InputManager.active = true;
	},
	step: function()
	{
		global.difficulty += 0.001;
	}
});

state.add("end", {
	enter: function()
	{
		InputManager.active = false;
	},
	step: function()
	{
		if (keyboard_check_pressed(ord("R")))
		{
			game_restart();
			restartElement.typewriter_reset();
		}
	}
});

