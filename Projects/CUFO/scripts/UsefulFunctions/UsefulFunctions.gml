
/// @description wrap(value, min, max)
/// @function wrap
/// @param value The value to wrap into the bounds
/// @param min Minimum bound, inclusive
/// @param max Maximum bound, inclusive
// Returns the value wrapped to the range [min, max] (min and max can be swapped).
// Calls floor() on reals, but GML's modulo is doing something weird and original_wrap just hangs indefinitely on some values anyways so oh well.
function wrap(val, minValue, maxValue)
{
	var value = floor(val);
	var _min = floor(min(minValue, maxValue));
	var _max = floor(max(minValue, maxValue));
	var range = _max - _min + 1; // + 1 is because max bound is inclusive
	
	return (((value - _min) % range) + range) % range + _min;
}
/// @description  approach(start, end, shift);
/// @param start
/// @param  end
/// @param  shift
function approach(argument0, argument1, argument2)
{
	if (argument0 < argument1)
	{
		return min(argument0 + argument2, argument1);
	}
	else
	{
		return max(argument0 - argument2, argument1);
	}
}

function squash_and_stretch(xscl, yscl)
{
	image_xscale = xscl;
	image_yscale = yscl;
}

function normalize_value(value, min, max)
{
	var normalized = (value - min) / (max - min);
	normalized = clamp(normalized, 0, 1);
	return normalized;
}


function wave(_from, _to, _duration, offset)
{
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin((((current_time * 0.001) + _duration * offset) / _duration) * (pi * 2)) * _a4;
}
/// @description Puts sin function inside of abs function
function asin(time = current_time)
{
	return abs(dsin(time));
}

/// @description Puts cos function inside of abs function
function acos(time = current_time)
{
	return abs(dcos(time));
}

///Map(val, min1, max1, min2, max2)   
function remap(value, min1, max1, min2, max2)
{
	/*      
	value = 110;      
	m = Map(value, 0, 100, -20, -10);      
	// m = -9      
	*/
	return min2 + (max2 - min2) * ((value - min1) / (max1 - min1));
}

/// @description
/// @description Chance(percent)
/// @param percent
function chance(_percent)
{
	// Returns true or false depending on RNG
	// ex: 
	//		Chance(0.7);	-> Returns true 70% of the time
	return _percent > random(1);
}

// Finite lerp function
function flerp(val1, val2, amount, epsilon = EPSILON)
{
	return abs(val1 - val2) > epsilon ? lerp(val1, val2, amount) : val2;
}

function array_safe(_array, _value)
{
	var i = 0; repeat(array_length(_array))
	{
		if (_array[i] == _value)
		{
			return false;
			break;
		}
		i++;
	}
	return true;
}

function ds_list_safe(_list, _value)
{
	var i = 0; repeat(ds_list_size(_list))
	{
		if (_list[| i] == _value)
		{
			return false;
			break;
		}
		i++;
	}
	return true;
}

