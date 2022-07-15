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
function Tween(_type=TweenType.Linear, _start, _end, _duration=-1, _args=[], _autostart=false) constructor
{
	channel		= animcurve_get_channel(acTweens, _type);
	duration	= 0;
	done		= false;
	active		= true;
	loop		= false;
	
	autorun		= _autostart;
	period		= time_source_units_frames;
	reps		= _duration;
	args		= _args;
	
	duration	= reps;
	
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
	}

	ts		= time_source_create(time_source_game, 1, period, update, args);
	if (_autostart) time_source_start(ts);
	

	static start = function(_st=y1, _en=y2, _dur=duration, _reset_position=true)
	{
		time = _reset_position ? 0 : time;
		y1 = _st;
		y2 = _en;
		duration = _dur;
		time_source_start(ts);
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
	static isPaused = function()
	{
		var _state = time_source_get_state(ts);
	    if (_state == time_source_state_active)
	    {
			return true;
	    }
	    else if (_state == time_source_state_paused)
	    {
	        return false;
	    }
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
	static reset = function()
	{
		time_source_reset(ts);
		time = 0;
	}
	static onTimeout = function()
	{
		
	}
}

