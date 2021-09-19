///@func Timestamp_Create()
///@desc Creates a timestamp in the correct format
function Timestamp_Create() {
	var _stamp = "";
	_stamp += to_string(current_month, "-", current_day, "-", current_year, " (", current_hour, "-", current_minute, "-", current_second, ")");
	return _stamp;


}
