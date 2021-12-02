#region Functions
// Set surface free safely
function surface_free_safe(sur)
{
	if (surface_exists(sur))
	{
		surface_free(sur);
	}
}

// Quick set halign and valign
function draw_set_aling(halign = fa_left, valign = fa_top)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

// Quick set color and alpha
function draw_set_blend(color = c_white, alpha = 1)
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

function normalize(value, min, max)
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