///@func All_Connected_Controllers()
///@desc Returns an array of all of the connected controller devices
function All_Connected_Controllers() {
	var _connected = [];
	var _num = 0;
	for(var i = 0; i < number_of_devices; i++)
		{
		if (gamepad_is_connected(i))
			{
			_connected[_num] = i;
			_num++;
			}
		}
	return _connected;


}
