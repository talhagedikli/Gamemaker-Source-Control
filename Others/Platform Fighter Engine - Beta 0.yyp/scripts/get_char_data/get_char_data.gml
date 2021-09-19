///@func get_char_data(character, data)
///@param character
///@param data
function get_char_data(argument0, argument1) {
	if (argument0 >= 0 && argument0 < array_length_1d(global.all_character_data))
		{
		var _char = global.all_character_data[argument0];
		return _char[argument1];
		}
	else
		{
		return -1;
		}


}
