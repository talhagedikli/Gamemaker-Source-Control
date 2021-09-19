///@func collision(x, y, [flags], [array], [obj])
///@param x
///@param y
///@param [flags]
///@param [array]
///@param [obj]
var _x = argument[0];
var _y = argument[1];
var _f = argument_count > 2 ? argument[2] : 0;
var _a = argument_count > 3 ? argument[3] : false;
var _o = argument_count > 4 ? argument[4] : obj_collidable;

//Clear the list
ds_list_clear(global.col_list);

//Populate the list with instance ids
if (instance_place_list(_x, _y, _o, global.col_list, true) > 0)
	{
	if (_a)
		{
		if (_f == 0)
			{
			var _array = array_create(ds_list_size(global.col_list), noone);
			//Make an array of the list
			for(var i = 0; i < ds_list_size(global.col_list); i++)
				{
				_array[i] = global.col_list[i];
				}
			return _array;
			}
		else
			{
			var _array = [];
			//Make an array of the items in the list that have the correct flags
			for(var i = 0; i < ds_list_size(global.col_list); i++)
				{
				var _inst = global.col_list[| i];
				if (_f & _inst.flags == _f)
					{
					_array[array_length_1d(_array)] = _inst;
					}
				}
			return _array;
			}
		}
	else
		{
		if (_f == 0)
			{
			//Return one of the instances from the list
			var _inst = global.col_list[| 0];
			return _inst;
			}
		else
			{
			//Return the first instance to have the correct flags
			for(var i = 0; i < ds_list_size(global.col_list); i++)
				{
				var _inst = global.col_list[| i];
				if (_f & _inst.flags == _f)
					{
					return _inst;
					}
				}
			return noone;
			}
		}
	}
else
	{
	//Return either a blank array or noone
	return _a ? [] : noone;
	}