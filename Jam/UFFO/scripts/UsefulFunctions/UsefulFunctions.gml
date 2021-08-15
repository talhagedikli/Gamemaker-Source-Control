
function canvas_fullscreen(base)
{
	var _base = argument0;
	var _bw = browser_width;
	var _bh = browser_height;

	view_wport[0] = _bw;
	view_hport[0] = _bh;
	window_set_size(_bw, _bh);
	window_center();

	var _aspect = (_bw / _bh);
	if (_aspect < 1)
	    {
	    var _vw = _base * _aspect;
	    var _vh = _base;
	    }
	else
	    {
	    _vw = _base;
	    _vh = _base / _aspect;
	    }

	camera_set_view_size(view_camera[0], _vw, _vh);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}

/// @function                       scale_canvas(base width, base height, current width, current height, center);
/// @param {int}    base width      The base width for the game room
/// @param {int}    base height     The base height for the game room
/// @param {int}    current width   The current width of the game canvas
/// @param {int}    current height  The current height of the game canvas
/// @param {bool}   center          Set whether to center the game window on the canvas or not
function scale_canvas(basew, baseh, curw, curh, cent)
{
	var _bw = basew;
	var _bh = baseh;
	var _cw = curw;
	var _ch = curh;
	var _center = cent;
	var _aspect = (_bw / _bh);
	
	if ((_cw / _aspect) > _ch)
	    {
	    window_set_size((_ch *_aspect), _ch);
	    }
	else
	    {
	    window_set_size(_cw, (_cw / _aspect));
	    }
	if (_center)
	    {
	    window_center();
	    }
	
	view_wport[0] = min(window_get_width(), _bw);
	view_hport[0] = min(window_get_height(), _bh)
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}
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

/// @description Puts cos function inside of abs function
function acos(time = current_time)
{
	return abs(dcos(time));
}

// Finite lerp function
function flerp(val1, val2, amount, epsilon = EPSILON)
{
	return abs(val1 - val2) > epsilon ? lerp(val1, val2, amount) : val2;
}

