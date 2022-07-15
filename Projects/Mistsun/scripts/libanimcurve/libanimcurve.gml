/// @desc Description for Animcurve
/// @param {any} _curve description
/// @param {any} _channel description
/// @param {real} duration description
/// @param {bool} [_autoreset]=false description
function Animcurve(_curve, _channel, _duration, _autoreset=false) constructor
{
	channel		= animcurve_get_channel(_curve, _channel);
	x			= 0;
	duration	= _duration;
	args		= [];
	autoreset	= _autoreset;
	
	__update = function()
	{
		x			= time/duration;
		y			= animcurve_channel_evaluate(channel, x);
		time		= time + 1;
		if (autoreset) reset();
	}

	ts		= time_source_create(time_source_game, 1, time_source_units_frames, __update, args, duration); // duration+1
	
	static start = function(_dur=duration, _reset_position=true)
	{
		if (getState() == time_source_state_initial)
		{
			time		= _reset_position ? 0 : time;
			x			= time/duration;
			y			= animcurve_channel_evaluate(channel, x);
			//time		= time + 1;
			duration	= _dur;
			time_source_reconfigure(ts, 1, time_source_units_frames, __update, args, duration);
			time_source_start(ts);
		}
	}
	static reconfigure = function()
	{
		
	}
	static setDuration = function(_duration)
	{
		duration = _duration;
		time_source_reconfigure(ts, 1, time_source_units_frames, __update, args, duration);
	}
	static getDuration = function()
	{
		return self.duration;	
	}
	static getValue = function()
	{
		return self.y;
	}
	static getTime = function()
	{
		return self.time;	
	}
	static getPosition = function()
	{
		return self.x;	
	}
	static isActive = function()
	{
	    if (self.getState() == time_source_state_active)
	    {
			return true;
	    }
		return false;
	}
	static isFinished = function()
	{
	    if (self.getState() == time_source_state_stopped)
	    {
			return true;
	    }
		return false;		
	}
	static getState = function()
	{
		var _state = time_source_get_state(ts);
		return _state;	
	}
	static reset = function()
	{
		time_source_reset(ts);
		time = 0;
	}
	static stop = function()
	{
		if (self.getState() != time_source_state_stopped)
		{
			time_source_stop(ts);	
		}
	}
	static onTimeout = function()
	{
		
	}
}

