///@func css_player_list_position(index)
///@param index
///@desc Returns the list position of the player with the given index.

with(obj_css_data)
	{
	for(var i = 0; i < ds_list_size(players); i++)
		{
		var _player = players[| i];
		if (_player[CSS_PLAYER.index] == argument0)
			{
			return i;
			}
		}
	}
return undefined;