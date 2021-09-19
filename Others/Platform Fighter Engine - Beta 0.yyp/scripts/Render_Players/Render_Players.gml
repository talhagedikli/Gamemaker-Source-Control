///@func Render_Players(list)
///@param list
function Render_Players(argument0) {
	var _l = argument0;
	for(var i = 0; i < ds_list_size(_l); i++)
		{
		var _player = _l[| i];
		with(_player)
			{
			if (renderer == other.object_index)
				{
				event_user(user_event_draw);
				}
			}
		}


}
