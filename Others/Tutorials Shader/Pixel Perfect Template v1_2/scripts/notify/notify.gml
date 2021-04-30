/// @description notify(string,time)
/// @param string
/// @param time
function notify(argument0, argument1) {
	//Shows a global notification

	obj_control.notification = string(argument0);
	obj_control.alarm[2] = argument1;
	sdm("Notification: "+string(argument0));




}
