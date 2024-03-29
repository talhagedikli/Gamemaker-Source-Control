/// @description tween_quartic_in_input_01(input_value, output_range_min, output_range_max);
/// @param input_value
/// @param output_range_min
/// @param output_range_max
function tween_quartic_in_input_01(argument0, argument1, argument2) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range of 0 to 1
	to an output range in a "quartic in" fashion: slow -> fast

	input_value			The value to remap
						could i.e. be a timers current value
					
	output_range_min	The starting point of the remapped value
						i.e. x & y at the start of the tween
					
	output_range_max	The end point of the remapped value
						i.e. x & y at the end of the tween

	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	t /= d;
	return c*t*t*t*t + b; */


	/* Long version: 
	//var in_min	= 0;					// -
	var in_value	= argument0;			// t
	//var in_range	= 1;					// d
	var out_min		= argument1;			// b
	var out_range	= argument2 - out_min;	// c

	return out_range * in_value * in_value * in_value * in_value + out_min;  */

	// Short version:
	return (argument2 - argument1) * argument0 * argument0 * argument0 * argument0 + argument1;



}
