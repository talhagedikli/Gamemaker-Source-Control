///@func bitflag_to_string(number)
///@param number
///@desc Returns a string of 0s and 1s that represents the number.

var _str = "";
var _num = argument0;

while(_num >= 1)
	{
	_str = string(_num % 2) + _str;
	_num /= 2;
	}
	
return _str;