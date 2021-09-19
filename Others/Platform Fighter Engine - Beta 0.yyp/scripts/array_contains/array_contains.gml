///@func array_contains(array,value)
///@param array
///@param value
///@desc Returns true if the value is in the array.
function array_contains(argument0, argument1) {

	var _a = argument0;
	var _v = argument1;

	for(var i = 0; i < array_length_1d(_a); i++)
		{
		if (_a[i] == _v)
			{
			return true;
			}
		}
	return false;


}
