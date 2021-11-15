// Tweens V2
#macro TWEENS global.__tweens

global.__tweens = [];

function Tween(_type = TweenType.Linear) constructor
{
	enum TweenType
	{ // Channel indexes
		Linear,
		EaseIn,
		EaseOut,
		EaseOut,
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
		MidSlow
	}
	channel		= animcurve_get_channel(acTweens, _type);
	time		= 0;
	value		= 0;
	done		= false;
	active		= false;
	tickSize	= 1;
	
	x1			= 0;
	x2			= 1;
	x			= 0;
	y1			= 0;
	y2			= 0;
	y			= 0;
	duration	= 0;
	reverse 	= false;
	
	array_push(TWEENS, self);
	
	static __clamp = function()
	{
		x = clamp(x, 0, 1);
		y = clamp(y, y1, y2);
	}
	static Start = function(_start, _end, _duration, _ticksize = 1)
	{
		active		= true;
		tickSize	= _ticksize;
		y1			= _start;
		y2			= _end;
		duration	= _duration;
		// !!! Already exists in "run" method
		// var rate	= animcurve_channel_evaluate(channel, time / duration);
		// x			= rate;
	}
	static Stop = function()
	{
		time	= 0;
		value	= 0;
		active	= false;
		done	= false;
		return self;
	}
	static Reset = function(_ticksize = ticksize)
	{
		ticksize	= _ticksize;
		time		= 0;
		value		= 0;
		done		= false;
		active		= true;
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
	static Run = function()
	{
		if (active)
		{
			var rate	= animcurve_channel_evaluate(channel, time / duration);
			x			= rate;
			y			= lerp(y1, y2, rate);
			__clamp();
			if (time >= duration)
			{
				done = true;
				//if (loop)	reset();
				//else		stop();
			}
			else
			{
				time		+= 1 / tickSize;
			}			
		}
		return self;
	}
	static GetValueX = function()
	{
		return self.x;
	}
	static GetValueY = function()
	{
		return self.y;
	}
	// global.gpClock.add_cycle_method(function() 
	// {
	// 	run();
	// });
}





