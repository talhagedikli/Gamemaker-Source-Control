ui_button_step();

if (ui_clicked)
	{
	with(obj_css_player_window)
		{
		if (index == other.index)
			{
			state = CSS_PLAYER_WINDOW_STATE.select_character;
			break;
			}
		}
	}