///@func Profile_Get(profile_num,setting)
///@param profile_num
///@param setting
var _list = global.profiles[| argument[0]],
	_setting = argument[1];
	
return _list[| _setting];