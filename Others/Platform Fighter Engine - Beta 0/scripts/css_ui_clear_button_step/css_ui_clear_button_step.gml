ui_button_step();

if (ui_clicked)
	{
	with(obj_css_ui)
		{
		var _number = css_number_of_players();
		//Delete player UI
		for(var i = 0; i < _number; i++)
			{
			var _group = (group_start_number + css_player_index(i));
			ui_group_delete(_group);
			}
		//Delete all players
		ds_list_clear(obj_css_data.players);
		//Disconnect controllers
		array_clear(controller_connected, false);
		array_clear(keyboard_connected, false);
		//Delete CSS Cursors
		ds_list_clear(cursors);
		//Delete UI Cursors
		UI_Cursor_Delete_All();
		//Delete Tokens
		ds_list_clear(tokens);
		//Reset index counter
		index_counter = 0;
		//Get rid of autogenerated profiles
		Profile_Clean_Auto();
		}
	}