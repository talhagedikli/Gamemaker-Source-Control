/// @description tween_quadratic_in_simple(input_value);
/// @param input_value
function tween_quadratic_in_simple(argument0) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range of 0 to 1
	to an output range of 0 to 1 in a "quadratic in" fashion: slow -> fast

	input_value			The value to remap
						could i.e. be a timers current value
					
	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	t /= d;
	c * t * t + b;*/

	/* Long version:
	//var in_min	= 0;			// -
	var in_value	= argument0;	// t
	//var in_range	= 1;			// d
	//var out_min	= 0;			// b
	//var out_range	= 1;			// c

	return in_value * in_value; */

	// Short version:
	return argument0 * argument0;



}