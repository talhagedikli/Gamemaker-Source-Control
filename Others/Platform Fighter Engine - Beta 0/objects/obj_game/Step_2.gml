/// @description ENDING THE GAME
/*ENDGAME*/
if (state == GAME_STATE.normal)
	{
	//Stock Match
	if (is_stock_match())
		{
		var _win_count = 0;
		var _winners = [];

		//Loop through all players
		with(obj_player)
			{
			//If they haven't lost (yet), they are counted
			if (state != PLAYER_STATE.lost)
				{
				_win_count += 1;
				_winners[array_length_1d(_winners)] = player_number;
				}
			}
	
		//If there is only one winner, the game ends
		//Will eventually need to be updated for team battles
		if (_win_count == 1)
			{
			var _w = _winners[0];
		
			//Pass in player number
			global.win_screen_player = _w;
		
			state = GAME_STATE.ending;
			endcount = end_time;
			}
		else if (_win_count < 1)
			{
			//Random player
			var _w = irandom(instance_number(obj_player) - 1);
			
			//Pass in player number
			global.win_screen_player = _w;
		
			state = GAME_STATE.ending;
			endcount = end_time;
			}
		}
	
	//Time Match
	if (is_time_match())
		{
		//Check if the time has run out
		if (game_time >= global.match_time * game_get_speed(gamespeed_fps) * 60)
			{
			//Sort players by stock & damage
			//Formula for "player score"
			//score = (stock * (max_damage + 1)) - (max_damage - damage);
			var _q = ds_priority_create();
			with(obj_player)
				{
				if (state != PLAYER_STATE.lost)
					{
					var _score;
					var _health;
					if (is_stamina_match())
						{
						_health = 999 - stamina;
						}
					else
						{
						_health = damage;
						}
					if (is_stock_match())
						{
						_score = (stock * (max_damage + 1)) - (max_damage - _health);
						}
					else
						{
						_score = (points * (max_damage + 1)) - (max_damage - _health);
						}
					ds_priority_add(_q, player_number, _score);
					}
				}
			//The player with the highest score wins
			global.win_screen_player = ds_priority_find_max(_q);
			
			state = GAME_STATE.ending;
			endcount = end_time;
			}
		}
	}