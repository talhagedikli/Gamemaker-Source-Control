/// @description tween_output_01(input_value, input_range_min, input_range_max);
/// @param input_value
/// @param input_range_min
/// @param input_range_max
function tween_linear_output_01(argument0, argument1, argument2) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range
	to an output range of 0 to 1 in a linear fashion: normal -> normal

	input_value			The value to remap
						could i.e. be a timers current value
					
	input_range_min		The starting point of the input value
						i.e. current_time at start of the tween
					
	input_range_max		The end point of the input value
						i.e. current_time at start of the tween + duration
					
	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	c * t / d + b; */


	/* Long version:
	var in_min		= argument1;			// -
	var in_value	= argument0 - in_min;	// t
	var in_range	= argument2 - in_min;	// d
	//var out_min	= 0;					// b
	//var out_range	= 1;					// c

	return in_value / in_range; */


	// Short version:
	return (argument0 - argument1) / (argument2 - argument1); 



}
