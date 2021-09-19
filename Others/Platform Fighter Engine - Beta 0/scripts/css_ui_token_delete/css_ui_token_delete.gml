///@func css_ui_token_delete(index)
///@param index

with(obj_css_ui)
	{
	for(var i = 0; i < ds_list_size(tokens); i++)
		{
		var _token = tokens[| i];
		if (_token[CSS_CURSOR.index] == argument0)
			{
			ds_list_delete(tokens, i);
			return true;
			}
		}
	}
return false;