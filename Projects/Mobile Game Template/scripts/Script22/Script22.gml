#region Data
function array_shuffled(arr)
{
	var len = array_length(arr);
	for (var i = 0; i < len; i++)
	{
		var r = irandom(len-1);
		
		var arr1 = arr[i];
		var arr2 = arr[r];
		
		arr[i] = arr2;
		arr[r] = arr1;
	}
	return arr;
}

function array_shuffle(arr)
{
	array_sort(arr, function() {
		return irandom_range(-1, 1);
	});
}

function array_reverse(arr)
{
	var l = array_length(arr);
	var a = array_create(l);
	var i = 0; repeat(l)
	{
		a[i] = arr[(l-1) - i];
		i++;
	}
	return a;
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
#endregion

#region Functions
// Set surface free safely
function surface_free_safe(sur)
{
	if (surface_exists(sur))
	{
		surface_free(sur);
	}
}

// Create instances safely
function instance_create_layer_safe(_x, _y, _layer, _obj)
{
	if (!instance_exists(_obj)) return instance_create_layer(_x, _y, _layer, _obj);	
	return noone;
}

// Create instances safely
function instance_create_depth_safe(_x, _y, _depth, _obj)
{
	if (!instance_exists(_obj)) return instance_create_depth(_x, _y, _depth, _obj);	
	return noone;
}

// Quick set halign and valign
function draw_set_aling(halign, valign)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

// Quick set color and alpha
function draw_set_blend(color, alpha)
{
	draw_set_color(color);
	draw_set_alpha(alpha);
}

// lengthdir_x and lengthdir_y together with vectors
function lengthdir(len = new Vector2(0), dir = new Vector2(0)) 
{
	return new Vector2(lengthdir_x(len.x, dir.x), lengthdir_y(len.y, dir.y));
}

//Concatenate a series of arguments into a string
function concat() 
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    return _string;
}
 
//Show debug message enhanced with string concatenation
function debug_message()
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    show_debug_message(_string);
}

//Show debug message enhanced with string concatenation
function screen_message()
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    show_message(_string);
}

//Move value towards another value by a given amount
function approach(_a, _b, _amount) 
{
    if (_a < _b)
    {
        _a += _amount;
        if (_a > _b)
            return _b;
    }
    else
    {
        _a -= _amount;
        if (_a < _b)
            return _b;
    }
    return _a;
}
 
//Sine waves a value between two values over a given time. 
function wave(_from, _to, _duration, _offset) 
{
    var a4 = (_to - _from) * 0.5;
    return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4; 
}
 
//Wraps a value between a minimum and a given wrap point
function wrap(_value, _minimum, _wrapAt) 
{
 
    var _mod = ( _value - _minimum ) mod ( _wrapAt - _minimum );
    if ( _mod < 0 ) return _mod + _wrapAt else return _mod + _minimum;
}

function normalize_value(value, min, max)
{
	var normalized = (value - min) / (max - min);
	normalized = clamp(normalized, 0, 1);
	return normalized;
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
#endregion

#region Constructors
function Typewriter(_text, _spd = 0.25) constructor
{
	text	= _text;
	char	= 1;
	charSpd = _spd;
	len		= string_length(text);
	static write = function(_text = text)
	{
		if (text != _text)
		{
			text = _text;
			len		= string_length(text);
		}
		if (char < len)
		{
			char += charSpd;
		}
		return string_copy(text, 1, char);
	}
	static reset = function(_text = text)
	{
		text = _text;
		char = 1;
	}
}
#endregion

#region Save&Load
/// Saving a string as a buffer
function save_string(_string, _filename) 
{
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

/// Loading a string from a buffer
function load_string(_filename) 
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);
	return _string;
}
#endregion

