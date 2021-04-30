/// @description tween_cubic_out_in_simple(input_value);
/// @param input_value
function tween_cubic_out_in_simple(argument0) {
	/*
	_______________________________________________________________________________
	INFO:
	-------------------------------------------------------------------------------
	This script remaps/tweens an input value from an input range of 0 to 1
	to an output range of 0 to 1 in a "cubic out/in" fashion: slow -> fast -> slow

	input_value			The value to remap
						could i.e. be a timers current value
					
	returns				the input_value remapped to the output_range
						so basically out_value
	_____________________________________________________________________________*/

	/* original version:
	t /= d/2;
	if (t < 1) return c/2*t*t*t + b;
	t -= 2;
	return c/2*(t*t*t + 2) + b; */


	/* Long version:
	//var in_min	= 0;			// -
	var in_value	= argument0;	// t
	//var in_range	= 1;			// d
	//var out_min	= 0;			// b
	//var out_range	= 1;			// c

	in_value *= 2;
	if (in_value < 1)
	return 0.5 * in_value * in_value * in_value;
	in_value -= 2;
	return 0.5 * (in_value * in_value * in_value + 2); */


	// Short version:
	var in_value = argument0 * 2;
	if (in_value < 1)
	return 0.5 * in_value * in_value * in_value;
	in_value -= 2;
	return 0.5 * (in_value * in_value * in_value + 2);



}
