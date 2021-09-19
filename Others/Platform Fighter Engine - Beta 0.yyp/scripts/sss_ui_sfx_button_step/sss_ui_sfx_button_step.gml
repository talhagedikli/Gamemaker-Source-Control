function sss_ui_sfx_button_step() {
	ui_button_step();

	text = "Sound Effects Volume - " + string(global.volume_sound_effects * 100) + "%";

	if (ui_clicked)
		{
		if (global.volume_sound_effects == 1)
			{
			global.volume_sound_effects = 0;
			}
		else if (global.volume_sound_effects == 0)
			{
			global.volume_sound_effects = 0.5;
			}
		else
			{
			global.volume_sound_effects = 1;
			}
		}


}
