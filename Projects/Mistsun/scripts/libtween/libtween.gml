enum TweenType
{
	Linear,
	EaseIn,
	EaseOut,
	EaseInOut,
	CubicEaseIn,
	CubicEaseInOut,
	CubicEaseOut,
	QuartEaseIn,
	QuartEaseInOut,
	QuartEaseOut,
	ExpoEaseIn,
	ExpoEaseInOut,
	ExpoEaseOut,
	CircEaseIn,
	CircEaseInOut,
	CircEaseOut,
	BackEaseIn,
	BackEaseInOut,
	BackEaseOut,
	ElasticEaseIn,
	ElasticEaseInOut,
	ElasticEaseOut,
	BounceEaseIn,
	BounceEaseInOut,
	BounceEaseOut,
	FastToSlow,
	MidSlow,
	Length
}
/// @desc Description for Tween
/// @param {real} [_type]=TweenType.Linear TweenType.Linear description
/// @param {any*} _start description
/// @param {any*} _end description
/// @param {real} [_duration]=-1 1 description
/// @param {bool} [_args]=true description
function Tween(_type=TweenType.Linear, _start=undefined, _end=undefined, _duration=-1, _autoreset=false) constructor
{
	channel		= animcurve_get_channel(acTweens, _type);
	duration	= 0;
	done		= false;
	active		= true;
	loop		= false;
	
	//autorun		= _autostart;
	period		= time_source_units_frames;
	reps		= _duration;
	args		= [];
	
	duration	= reps;
	autoreset	= _autoreset;
	
	time		= 0;
	x1			= 0;
	x2			= 1;
	x			= 0;
	
	y1			= _start;
	y2			= _end;
	y			= y1;
	
	update = function()
	{
		var rate	= animcurve_channel_evaluate(channel, time / duration);
		x			= rate;
		y			= lerp(y1, y2, rate);
		time		+= 1;
		if (autoreset)
		{
			if (self.getState() == time_source_state_stopped)
			{
				self.reset();	
			}
		}
		
	}

	ts		= time_source_create(time_source_game, 1, period, update, args, duration+1, time_source_expire_after);
	
	static start = function(_st=y1, _en=y2, _dur=duration, _reset_position=true)
	{
		if (getState() == time_source_state_initial)
		{
			time = _reset_position ? 0 : time;
			y1 = _st;
			y2 = _en;
			var rate	= animcurve_channel_evaluate(channel, time / duration);
			x			= rate;
			y			= lerp(y1, y2, rate);
			duration = _dur;
			time_source_reconfigure(ts, 1, period, update, args, duration+1, time_source_expire_after); 
			time_source_start(ts);
		}
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
		var _state = time_source_get_state(ts);
	    if (_state == time_source_state_active)
	    {
			return true;
	    }
		return false;
	}
	static isFinished = function()
	{
		var _state = time_source_get_state(ts);
	    if (_state == time_source_state_stopped)
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
		// if (getState() != time_source_state_initial)
		time_source_reset(ts);
		time = 0;
	}
	static stop = function()
	{
		if (time_source_get_state(ts) != time_source_state_stopped)
		{
			time_source_stop(ts);	
		}
	}
	static onTimeout = function()
	{
		
	}
}

