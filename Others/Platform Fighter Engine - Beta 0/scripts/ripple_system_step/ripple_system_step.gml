///@func ripple_system_step(system_index,number)
///@args system_index,number
///@desc Calculates movement / animation of all of the ripples in the system.
///You can calculate multiple steps at once to speed up the animations.
var _map = argument[0];
var _list = _map[? "List"];
var _number = argument[1];
for(var i=0;i<abs(_number);i++)
	{
	for(var m=0;m<ds_list_size(_list);m++)
		{
		var _ripple = _list[|m];
		//Change the positions
		if (_ripple[RIPPLE.Attached])
			{
			//_ripple[@RIPPLE.X] = _ripple[RIPPLE.StartX];
			//_ripple[@RIPPLE.Y] = _ripple[RIPPLE.StartY];
			}
		//Destroy the effect if its lifetime runs out
		_ripple[@RIPPLE.Lifetime] -= _number;
		if (_ripple[RIPPLE.Lifetime] <= 0)
			{
			//ds_list_delete(_list,m);
			ripple_effect_destroy(_map,m);
			//Shift down the i value to take the list shift into account
			m--;
			}
		else
			{
			//Calculate the other properties
			var _percent = 1 - (_ripple[RIPPLE.Lifetime] / _ripple[RIPPLE.MaxLife]);
			_ripple[@RIPPLE.Size] = lerp(_ripple[RIPPLE.MinSize],_ripple[RIPPLE.MaxSize],_percent);
			_ripple[@RIPPLE.Color] = merge_color(_ripple[RIPPLE.MinColor],_ripple[RIPPLE.MaxColor],_percent);
			_ripple[@RIPPLE.Alpha] = lerp(_ripple[RIPPLE.MinAlpha],_ripple[RIPPLE.MaxAlpha],_percent);
			}
		}
	}
//Renew the surface if it gets destroyed
if (!surface_exists(_map[? "Surface"]))
	{
	var _size = _map[? "Surface_Size"];
	_map[? "Surface"] = surface_create(_size[0],_size[1]);
	}