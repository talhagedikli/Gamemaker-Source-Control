///Create Event of the controller object
global.difficulty	= 1;
endText = new Typewriter("Press R to restart")
state = new SnowState("normal");

state.add("normal", {
	enter: function()
	{
		InputManager.active = true;
	},
	step: function()
	{
		global.difficulty += 0.001;
	},
	leave: function()
	{
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
		}
	},
	leave: function()
	{
	}
});