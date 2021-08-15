///Create Event of the controller object
global.difficulty	= 1;
global.score		= 0;
global.highScore	= 0;
SaveManager.load();
diffIncrement		= 0.001;
tempScore			= 0;
scoreIncrement		= 1;
endText			= new Typewriter("Press R to restart");
scoreText		= new Typewriter(string(global.score));
highscoreText	= new Typewriter(string(global.highScore));
state			= new SnowState("normal");
global.starfieldColor = make_color_rgb(0.2 * 255, 0.3 * 255, 0.5 * 255);
info = [
	new Typewriter("Press Q to cycle wepons", 5),
	new Typewriter("Press Z to shoot", 5),
	new Typewriter("Press X to dash", 5)
];

state.add("normal", {
	enter: function()
	{
		InputManager.active = true;
	},
	step: function()
	{
		if (room == rWorld)
		{
			tempScore			+= scoreIncrement; 
			global.difficulty	+= diffIncrement;
			global.score		+= 5 / 60;
		}
	},
	draw_gui: function()
	{
		var gw = GUI_W, gh = GUI_H;
		draw_set_aling(fa_center, fa_top);
		draw_text_transformed(gw / 2, 0, ceil(global.score), 3, 3, 0);	

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
		global.score = round(global.score);
		global.highScore = max(global.score, global.highScore);
		global.highScore = round(global.highScore);
		global.score	= round(global.score);
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
		var gw = GUI_W, gh = GUI_H, scl = 2, height = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
		draw_set_aling(fa_center, fa_center);
		draw_text_transformed(gw / 2, gh / 2, endText.write(), 2, 2, 0);
		if (endText.done)
		{
			draw_set_aling(fa_center, fa_top);
			draw_text_transformed(gw / 2, 0, highscoreText.write("High Score: " + string(global.highScore)), scl, scl, 0);
			if (highscoreText.done)
			{
				draw_text_transformed(gw / 2, height * scl, scoreText.write("Score: " + string(global.score)), scl, scl, 0);
			}
		}	
	
	},
	leave: function()
	{
	}
});

//if audio_system_is_available()
//{
//	here;
//    if audio_is_paused(global.Music)
//    {
//        audio_resume_sound(global.Music)
//    }
//    else
//    {
//        if !audio_is_playing(global.Music)
//        {
//            global.Music = audio_play_sound(snd_Music, 0, true);
//        }
//    }
//}
//else
//{
//    if audio_is_playing(global.Music)
//    {
//        audio_pause_sound(global.Music);
//    }
//}