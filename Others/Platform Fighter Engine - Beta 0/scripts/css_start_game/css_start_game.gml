///@func css_start_game()
with(obj_css_ui)
	{
	var _number = css_number_of_players();
	if (_number >= 2)
		{
		//Clear existing data
		global.players = [];
		global.number_of_players = _number;
		//Create all player data
		for(var i = 0; i < _number; i++)
			{
			var _index = css_player_index(i);
			//Random characters
			var _character = css_player_get(_index, CSS_PLAYER.character);
			var _is_random = false;
			if (get_char_data(_character, CHAR_DATA.name) == "Random")
				{
				_is_random = true;
				//Create an array of all characters that are NOT the random button, and choose one
				var _possible = [];
				for(var m = 0; m < array_length_1d(global.all_character_data); m++)
					{
					if (get_char_data(m, CHAR_DATA.name) != "Random")
						{
						_possible[array_length_1d(_possible)] = m;
						}
					}
				_character = _possible[irandom(array_length_1d(_possible) - 1)];
				}
			global.players[@ i] = Player_Data_Create
				(
				_character,
				css_player_get(_index, CSS_PLAYER.color),
				css_player_get(_index, CSS_PLAYER.device),
				css_player_get(_index, CSS_PLAYER.device_type),
				css_player_get(_index, CSS_PLAYER.profile),
				_is_random,
				css_player_get(_index, CSS_PLAYER.is_cpu),
				css_player_get(_index, CSS_PLAYER.cpu_type),
				);
			//Save token positions
			var _token = tokens[| i];
			global.css_token_positions[@ i] = [_token[CSS_TOKEN.x], _token[CSS_TOKEN.y]];
			}
				
		//Move to the stage selection screen
		room_goto_next();
		}
	}