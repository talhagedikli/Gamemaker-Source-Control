// Tweens V2
function xTween(_type = TWEENTYPE.LINEAR) constructor
{
	enum TWEENTYPE
	{ // Channel indexes
		LINEAR,
		EASEIN,
		EASEINOUT,
		EASEOUT,
		CUBICEASEIN,
		CUBICEASEINOUT,
		CUBICEASEOUT,
		QUARTEASEIN,
		QUARTEASEINOUT,
		QUARTEASEOUT,
		EXPOEASEIN,
		EXPOEASEINOUT,
		EXPOEASEOUT,
		CIRCEASEIN,
		CIRCEASEINOUT,
		CIRCEASEOUT,
		BACKEASEIN,
		BACKEASEINOUT,
		BACKEASEOUT,
		ELASTICEASEIN,
		ELASTICEASEINOUT,
		ELASTICEASEOUT,
		BOUNCEEASEIN,
		BOUNCEEASEINOUT,
		BOUNCEEASEOUT,
		FASTTOSLOW,
		MIDSLOW
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
	
	reverse = false;
	static __clamp = function()
	{
		x = clamp(x, 0, 1);
		y = clamp(y, y1, y2);
	}
	static start = function(_start, _end, _duration, _ticksize = 1)
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
	static stop = function()
	{
		time	= 0;
		value	= 0;
		active	= false;
		done	= false;
		return self;
	}
	static reset = function(_ticksize = ticksize)
	{
		ticksize	= _ticksize;
		time		= 0;
		value		= 0;
		done		= false;
		active		= true;
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
	static run = function()
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
	
	global.gpClock.add_cycle_method(function() 
	{
		run();
	});
}





