///@func command_grab(target,hold_x,hold_y)
///@param target
///@param hold_x
///@param hold_y
///@desc Allows you to grab another player during an attack.

var _target = argument0;
var _x = argument1;
var _y = argument2;

with(_target)
	{
	attack_stop(PLAYER_STATE.is_grabbed);
	grab_hold_id = other.id;
	other.grabbed_id = id;
	grab_hold_x = _x;
	grab_hold_y = _y;
	return true;
	}
return false;