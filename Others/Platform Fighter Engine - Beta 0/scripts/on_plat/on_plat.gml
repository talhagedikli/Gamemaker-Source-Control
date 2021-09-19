///@func on_plat([x],[y]);
///@param [x]
///@param [y]
var _x, _y, _f;
_x = argument_count > 0 ? argument[0] : x;
_y = argument_count > 1 ? argument[1] : y;
_f = flags_create(FLAG.plat);

//Direct collision checking - fast
if (platform_check_type == 0)
	{	
	if (collision(_x, _y + 1, false, _f) && 
		!collision(_x, _y, false, _f) && vsp >= 0)
		{
		return true;
		}
	}
else
//Multi-platform list collision checking - slow
if (platform_check_type == 1)
	{
	var _array = collision(_x, _y + 1, true, _f);
	//Loop through all collisions
	for(var i = 0; i < array_length_1d(_array); i++)
		{
		var _plat = _array[i];
		//If you above the platform
		if (bbox_bottom < _plat.bbox_top && vsp >= 0)
			{
			return true;
			}
		}
	}
return false;