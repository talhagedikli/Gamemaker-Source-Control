///@func buffer_write_values
///@param buffer,[type,value...]
///@desc Writes the given values of the given types to the buffer.
function buffer_write_values() {

	var _buff = argument[0];

	for(var i = 1; i < argument_count; i += 2) {
		var _type = argument[i];
		var _value = argument[i + 1];
		buffer_write(_buff, _type, _value);
	}


}
