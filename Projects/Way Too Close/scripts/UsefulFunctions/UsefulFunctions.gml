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

function normalize_value(value, min, max)
{
	var normalized = (value - min) / (max - min);
	normalized = clamp(normalized, 0, 1);
	return normalized;
}


function wave(_from, _to, _duration, offset)
{
	//Wave(from, to, duration, offset)
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
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

/// @description draw a sprite using four- or nine-slicing
/// @arg sprite
/// @arg subimg
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg color
/// @arg alpha
/// @arg [slice_top_left] if not supplied, the origin will be used for four-slicing
/// @arg [slice_width] if width and height are not supplied, the slice_top_left will be used for four slicing
/// @arg [slice_height]
function draw_sprite_sliced(
	sprite,
	subimg,
	_x,
	_y,
	width,
	height,
	color,
	alpha
) {
	// full nine-slicing
	if argument_count == 11 {
		var slice_coords = argument[8];
		var slice_width = argument[9];
		var slice_height = argument[10];
		var slice_xy = { x: slice_coords[0], y: slice_coords[1] };
		var slice_top_left = slice_xy;
		var slice_top_right = { x: slice_xy.x + slice_width, y: slice_xy.y };
		var slice_bottom_left = { x: slice_xy.x, y: slice_xy.y + slice_height };
		var slice_bottom_right = { x: slice_xy.x + slice_width, y: slice_xy.y + slice_height };
	}
	// four-slicing
	else if argument_count == 9 {
		var slice_coords = argument[8];
		var slice_xy = { x: slice_coords[0], y: slice_coords[1] };
		var slice_top_left = slice_xy;
		var slice_top_right = slice_xy;
		var slice_bottom_left = slice_xy;
		var slice_bottom_right = slice_xy;
	}
	// four-slice by origin
	else if argument_count == 8 {
		var slice_xy = { x: sprite_get_xoffset(sprite), y: sprite_get_yoffset(sprite) };
		var slice_top_left = slice_xy;
		var slice_top_right = slice_xy;
		var slice_bottom_left = slice_xy;
		var slice_bottom_right = slice_xy;
	}
	else {
		throw "Invalid parameters for draw_sprite_sliced - expecting 8, 9, or 11 parameters";
	}
	
	var spr_width = sprite_get_width(sprite);
	var spr_height = sprite_get_height(sprite);
	
	// the inner target width is the desired width minus the left and right widths of the slice
	var inner_target_width = width - (slice_top_left.x + (spr_width - slice_top_right.x));
	
	// the inner target height is the desired width minus the top and bottom heights of the slice
	var inner_target_height = height - (slice_top_left.y + (spr_height - slice_bottom_left.y));
	
	var inner_slice_width = slice_top_right.x - slice_top_left.x;
	var inner_slice_height = slice_bottom_left.y - slice_top_left.y;
	
	// draw minimum 1 pixel from the inner slice
	if inner_slice_width == 0 inner_slice_width = 1;
	if inner_slice_height == 0 inner_slice_height = 1;
	
	var inner_x_scale = inner_target_width / inner_slice_width;
	var inner_y_scale = inner_target_height / inner_slice_height;

	// top left
	draw_sprite_part_ext(
		sprite, subimg,
		0, 0, 
		slice_top_left.x, slice_top_left.y,
		_x, _y,
		1, 1,
		color, alpha);
	
	// top middle
	draw_sprite_part_ext(
		sprite, subimg,
		slice_top_left.x, 0, // top of the sprite, indented to the slice left x
		inner_slice_width, slice_top_left.y,
		_x + slice_top_left.x, _y,
		inner_x_scale, 1,
		color, alpha);
		
	// top right
	draw_sprite_part_ext(
		sprite, subimg,
		slice_top_right.x, 0, 
		spr_width - slice_top_right.x, slice_top_right.y,
		_x + slice_top_left.x + inner_target_width, _y,
		1, 1,
		color, alpha);
	
	// middle left
	draw_sprite_part_ext(
		sprite, subimg,
		0, slice_top_left.y,
		slice_top_left.x, inner_slice_height,
		_x, _y + slice_top_left.y,
		1, inner_y_scale,
		color, alpha);
	
	// middle inner
	draw_sprite_part_ext(
		sprite, subimg,
		slice_top_left.x, slice_top_left.y,
		inner_slice_width, inner_slice_height,
		_x + slice_top_left.x, _y + slice_top_left.y,
		inner_x_scale, inner_y_scale,
		color, alpha);
	
	// middle right
	draw_sprite_part_ext(
		sprite, subimg,
		slice_top_right.x, slice_top_right.y,
		spr_width - slice_top_right.x, inner_slice_height,
		_x + slice_top_left.x + inner_target_width, _y + slice_top_left.y,
		1, inner_y_scale,
		color, alpha);
		
		
	// bottom left
	draw_sprite_part_ext(
		sprite, subimg,
		0, slice_bottom_left.y,
		slice_bottom_left.x, spr_height - slice_bottom_right.y,
		_x, _y + slice_top_left.y + inner_target_height,
		1, 1,
		color, alpha);
	
	// bottom middle
	draw_sprite_part_ext(
		sprite, subimg,
		slice_bottom_left.x, slice_bottom_left.y,
		inner_slice_width, spr_height - slice_bottom_right.y,
		_x + slice_bottom_left.x, _y + slice_top_left.y + inner_target_height,
		inner_x_scale, 1,
		color, alpha);
	
	// bottom right
	draw_sprite_part_ext(
		sprite, subimg,
		slice_bottom_right.x, slice_bottom_right.y,
		spr_width - slice_bottom_right.x, spr_height - slice_bottom_right.y,
		_x + slice_bottom_left.x + inner_target_width, _y + slice_top_right.y + inner_target_height,
		1, 1,
		color, alpha);
}

function array_shuffle(_array) {
	var _len = array_length(_array), _last = 0, _i = 0;
	while(_len) {
		_i = irandom(--_len);
		_last = _array[_len];
		_array[_len] = _array[_i];
		_array[_i] = _last;
	}
	return _array;
}





