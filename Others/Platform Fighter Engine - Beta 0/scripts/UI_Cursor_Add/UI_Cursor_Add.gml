///@func UI_Add_Cursor
///@param index
///@param x
///@param y

var _new = [];
_new[UI_CURSOR.index] = argument0;
_new[UI_CURSOR.x] = argument1;
_new[UI_CURSOR.y] = argument2;
_new[UI_CURSOR.clicked] = false; //clicked
_new[UI_CURSOR.held_time] = 0; //held time

with(obj_ui_runner)
	{
	ds_list_add(cursors, _new);
	return (ds_list_size(cursors) - 1);
	}