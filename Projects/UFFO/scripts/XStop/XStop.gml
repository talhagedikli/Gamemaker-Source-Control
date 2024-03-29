function Timer() constructor
{ // For basic timer
	time		= 0;
	timeLeft	= 0;
	done		= false;
	active		= false;
	duration	= 0;
	loop		= false;
	tickSize	= 1;
	/// @func start(duration, [tickSize], [loop]))
	static start = function(_duration = infinity, _tickSize = 1, _loop = false)
	{
		duration	= _duration;
		loop		= _loop;
		tickSize	= _tickSize;
		timeLeft	= duration - time;
		if (done == true)		done	= false;
		if (active == false)	active	= true;
		return self;
	}
	static run = function()
	{
		if (active)
		{
			if (time >= duration)
			{
				done = true;
				if (loop)	reset();
				//else		stop();
			}
			else
			{
				time		+= 1 / tickSize;
				timeLeft	= duration - time;
			}
		}
		return self;
	}
	static set_duration = function(dur)
	{
		duration	= dur;
		return self;
	}
	static on_timeout = function(_func)
	{
		if (done)
		{
			_func();
		}
		return self;
	}
	static reset = function(_duration = duration)
	{
		time		= 0;
		duration	= _duration;
		done		= false;
		active		= true;
		return self;

	}
	static stop = function()
	{
		time	= 0;
		active	= false;
		done	= true;
		return self;
	}
	static pause = function()
	{
		active = false;
		return self;
	}
	static resume = function()
	{
		active = true;
		return self;
	}
	static get_paused = function()
	{
		return active;
	}
}