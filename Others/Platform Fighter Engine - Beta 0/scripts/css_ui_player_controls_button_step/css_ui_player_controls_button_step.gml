ui_button_step();

if (ui_clicked)
	{
	with(obj_css_player_window)
		{
		if (index == other.index)
			{
			state = CSS_PLAYER_WINDOW_STATE.controls;
			custom_controls_map = Profile_Get(css_player_get(index, CSS_PLAYER.profile), PROFILE.custom_controls);
			
			//The cursor that clicked on the button gets reset
			UI_Cursor_Set(index, UI_CURSOR.clicked, false);
			
			//Make the cursor inactive
			css_ui_cursor_set_active(index, false);
			break;
			}
		}
	}