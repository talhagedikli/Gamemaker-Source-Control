///Create Event of the controller object
global.difficulty	= 1;
global.score		= 0;
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
	draw_gui: function()
	{
		var gw = GUI_W, gh = GUI_H;
		draw_set_aling(fa_center, fa_center);
		draw_text(gw / 2, gh / 10, global.score);		
	},
	leave: function()
	{
	}
});
state.add("end", {
	enter: function()
	{
		InputManager.active = false;
		part_type_gravity(global.ptExhaust, 0, 0);
	},
	step: function()
	{
		if (keyboard_check_pressed(ord("R")))
		{
			global.score = 0;
			game_restart();
		}
	},
	draw_gui: function()
	{
		var gw = GUI_W, gh = GUI_H;
		draw_set_aling(fa_center, fa_center);
		draw_text(gw / 2, gh / 2, endText.write());
	},
	leave: function()
	{
	}
});