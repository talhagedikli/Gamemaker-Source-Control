function sss_ui_music_button_step() {
	ui_button_step();

	text = "Music Volume - " + string(global.volume_music * 100) + "%";

	if (ui_clicked)
		{
		if (global.volume_music == 1)
			{
			global.volume_music = 0;
			}
		else if (global.volume_music == 0)
			{
			global.volume_music = 0.5;
			}
		else
			{
			global.volume_music = 1;
			}
		}


}
