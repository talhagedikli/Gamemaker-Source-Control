///@func log(values...)
///@param values...
///@desc Converts the values into one long string, then prints a debug message
var _output = "";

for(var i = 0; i < argument_count; i++)
	{
	_output += is_string(argument[i]) ? argument[i] : string(argument[i]);
	}
	
show_debug_message(_output);