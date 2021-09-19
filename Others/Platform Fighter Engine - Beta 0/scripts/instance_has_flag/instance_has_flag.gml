///@func instance_has_flag(id,flag_index)
///@param id
///@param flag_index
var _id = argument[0];
var _f = argument[1];
with(_id)
	{
	return (flags >> _f) & 1;
	}