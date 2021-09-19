///@func Stick_Cache_Values(stick,axish,axisv,count)
///@param stick
///@param axish
///@param axisv
///@param count
///@desc Stores calculated values in instance variables for later use
var _x = round_n(argument[1]);
var _y = round_n(argument[2]);
var _count = argument[3];

if (argument[0] == Lstick)
	{
	//Move down older entries
	if (_count)
		{
		control_tilted_l = min(++control_tilted_l, max_buffer_length);
		control_flicked_l = min(++control_flicked_l, max_buffer_length);
		for(var m = max_buffer_length - 1; m > 0; m--)
			{
			control_states_l[@ m] = control_states_l[m - 1];
			}
		}
	
	//Add in a new entry
	var _new = [];
	_new[@ CONTROL_STICK.xval] = _x;
	_new[@ CONTROL_STICK.yval] = _y;
	_new[@ CONTROL_STICK.dir] = round(point_direction(0, 0, _x, _y));
	_new[@ CONTROL_STICK.dist] = point_distance(0, 0, _x, _y);
	
	//Speed
	var _prev = control_states_l[stick_check_frames - 1];
	var _xp = _prev[CONTROL_STICK.xval];
	var _yp = _prev[CONTROL_STICK.yval];
	_new[@ CONTROL_STICK.spd] = point_distance(_xp, _yp, _x, _y);
	
	//Add to the front
	control_states_l[@ 0] = _new;
	}
else
	{
	//Move down older entries
	if (_count)
		{
		control_tilted_r = min(++control_tilted_r, max_buffer_length);
		control_flicked_r = min(++control_flicked_r, max_buffer_length);
		for(var m = max_buffer_length - 1; m > 0; m--)
			{
			control_states_r[@ m] = control_states_r[m - 1];
			}
		}
	
	//Add in a new entry
	var _new = [];
	_new[@ CONTROL_STICK.xval] = _x;
	_new[@ CONTROL_STICK.yval] = _y;
	_new[@ CONTROL_STICK.dir] = round(point_direction(0, 0, _x, _y));
	_new[@ CONTROL_STICK.dist] = point_distance(0, 0, _x, _y);
	
	//Speed
	var _prev = control_states_r[stick_check_frames - 1];
	var _xp = _prev[CONTROL_STICK.xval];
	var _yp = _prev[CONTROL_STICK.yval];
	_new[@ CONTROL_STICK.spd] = point_distance(_xp, _yp, _x, _y);
	
	//Add to the front
	control_states_r[@ 0] = _new;
	}