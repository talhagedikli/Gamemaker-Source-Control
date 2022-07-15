/// @desc Description for TimeSource
/// @param {id.TimeSource} _parent description
/// @param {real} _period description
/// @param {Constant} _units description
/// @param {function} _callback description
/// @param {array} [_args]=[] description
/// @param {real} [_reps]=1 description
/// @param {constant} [_expiry_type]=time_source_expire_after description
function TimeSource(_parent, _period, _units, _callback, _args=[], _reps=1, _expiry_type=time_source_expire_after) constructor
{
	ts = time_source_create(_parent, _period, _units, _callback, _args, _reps, _expiry_type);
	static getState = function()
	{
		return time_source_get_state(ts);	
	}
	static reset = function()
	{
		time_source_reset(ts);	
	}
	static start = function()
	{
		time_source_start(ts);	
	}
}