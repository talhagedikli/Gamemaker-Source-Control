///@func UI_Cursor_Set(index, property, value)
///@param index
///@param property
///@param value

with(obj_ui_runner)
	{
	for(var i = 0; i < ds_list_size(cursors); i++)
		{
		var _cursor = cursors[| i];
		if (_cursor[UI_CURSOR.index] == argument0)
			{
			_cursor[@ argument1] = argument2;
			return true;
			}
		}
	}
return false;