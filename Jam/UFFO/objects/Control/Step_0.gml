/// @description 
//if (state == "normal")
//{
//	state_init(function()
//	{
//		InputManager.active = true;
//	});
//	global.difficulty += 0.001;
//}
//else if (state == "end")
//{
//	state_init(function()
//	{
//		InputManager.active = false;
//	});

//	if (keyboard_check_pressed(ord("R")))
//	{
//		game_restart();
//	}
//}

state.step();

