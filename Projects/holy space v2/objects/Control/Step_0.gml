/// @description 
if (state == "normal")
{
	InputManager.active = true;
	global.difficulty += 0.001;
}
else if (state == "end")
{
	InputManager.active = false;
	if (keyboard_check_pressed(ord("R")))
	{
		game_restart();
	}
}

var i = 0; repeat(array_length(global.timers))
{
	var t = global.timers[i];
	if (t.active)
	{
		t.run()
	}
	i++;
}