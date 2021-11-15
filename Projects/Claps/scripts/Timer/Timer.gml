#macro TIMERS global.__timers

global.__timers = [];
function Timer() constructor
{ // For basic timer
	time		= 0;
	timeLeft	= 0;
	done		= false;
	active		= false;
	duration	= 0;
	loop		= false;
	tickSize	= 1;
	array_push(TIMERS, self);
	/// @func start(duration, [loop], [tickSize])
	static Start = function(_duration = infinity, _loop = false, _tickSize = 1, _onto = function() {})
	{
		duration	= _duration;
		loop		= _loop;
		tickSize	= _tickSize;
		timeLeft	= duration - time;
		if (done == true)		done	= false;
		if (active == false)	active	= true;
		return self;
	}
	static Run = function()
	{
		if (active)
		{
			if (time >= duration)
			{
				done = true;
			}
			else
			{
				time		+= 1 / tickSize;
				timeLeft	= duration - time;
			}
		}
		return self;
	}
	static SetDuration = function(dur)
	{
		duration	= dur;
		return self;
	}
	static OnTimeout = function(_func)
	{
		if (done)
		{
			_func();
			if (loop) self.Reset();
		}
		return self;
	}
	static Reset = function(_duration = duration)
	{
		time		= 0;
		duration	= _duration;
		done		= false;
		active		= true;
		return self;

	}
	static Stop = function()
	{
		time	= 0;
		active	= false;
		done	= true;
		return self;
	}
	static Pause = function()
	{
		active = false;
		return self;
	}
	static Resume = function()
	{
		active = true;
		return self;
	}
	static GetPaused = function()
	{
		return active;
	}
	static GetTime = function()
	{
		return self.time;
	}
	static GetTimeLeft = function()
	{
		return self.timeLeft
	}
	//global.gpClock.add_cycle_method(function() 
	//{
	//	run();
	//});
}