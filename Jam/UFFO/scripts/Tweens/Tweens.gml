// Tweens V2
function Tween(_type = TWEENTYPE.LINEAR, _ticksize = 1) constructor
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
	tickSize	= _ticksize;
	
	x1			= 0;
	x2			= 0;
	x			= 0;
	y			= 0;
	duration	= 0;
	
	reverse = false;
	static start = function(_start, _end, _duration)
	{
		if (!active)
		{
			active	= true;
		}
		x1			= _start;
		x2			= _end;
		duration	= _duration;
		var rate	= animcurve_channel_evaluate(channel, time / duration);
		x			= rate;
	}
	static stop = function()
	{
		time = 0;
		value = 0;
		active = false;
		done = false;
		return self;
	}
	
	static reset = function()
	{
		time = 0;
		value = 0;
		done = false;
		active = true;
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
		var rate	= animcurve_channel_evaluate(channel, time / duration);
		x			= rate;
		value		= lerp(x1, x2, rate);
		if (active)
		{
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
	
	// global.clock.add_cycle_method(function() {
	// 	var rate = animcurve_channel_evaluate(channel, time / __duration); //  / (_duration * 60)
	// 	value = lerp(__start, __end, rate);
	// 	//var rate	= animcurve_channel_evaluate(channel, time / _duration); //  / (_duration * 60)
	// 	//value		= lerp(_start, _end, rate);
	// 	if (!wait && active)
	// 	{
	// 		time++;
	// 		if (time > __duration)
	// 		{
	// 			done = true;
	// 		}
	// 	}

		
	// });
}





