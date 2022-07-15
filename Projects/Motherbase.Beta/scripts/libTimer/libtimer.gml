/// @description Basic alarms with structs
/// @param {real} _duration Duration
/// @param {bool} [_loop=false] false] description
/// @param {bool} [_autostart=false] false] Whether you want timer to start automaticly or not
/// @param {bool} [_autorun=true] true] Whether you wish to run timer automaticly (in core object) or not
/// @returns {unset} description
function Timer(_duration, _loop=false, _autostart=false) : Lwo() constructor
{
	timeLeft	= 0.;
	duration	= _duration;
	time		= 0.;

	active		= _autostart;
	loop		= _loop;
	done		= false;
	timeLeft	= duration - time;
	
	runner		= time_source_create(time_source_game, 1, time_source_units_frames, run, [], 1, time_source_expire_after);
	time_source_start(runner);
	//__step_end__ = function()
	//{
	//	run();
	//}
	//if (_autorun) array_push(TIMERS, self)
	

	static start = function()
	{
		//duration	= _duration;
		//loop		= _loop;
		//timeLeft	= duration - time;
		done		= false;
		active		= true;
		return self;
	}
	static run = method(self, function()
	{
		if (active)
		{
			time		+= 1;
			timeLeft	= duration - time;
			//if (time >= duration)
			//{
			//	done	= true;
			//	active	= false;
			//}
			
			if (done)
			{
				if (loop) reset();
				else stop();
			}			
			else if (time >= duration)
			{
				done = true;	
			}
			

		}
		time_source_start(runner);
		return self;
	})
	/// @param {real} _duration
	
	static setDuration = function(_duration = duration)
	{
		duration	= _duration;
		return self;
	}
	/// @param {bool} _loop
	static setLoop = function(_loop = loop)
	{
		loop = _loop;
		return self;
	}
	/// @param {function} _func 
	static onTimeout = function(_func)
	{
		if (done)
		{
			_func();
			//if (loop) reset();
			//else stop();
		}
		return self;
	}
	static reset = function()
	{
		time		= 0;
		//duration	= _duration;
		done		= false;
		active		= true;
		return self;

	}
	static stop = function()
	{
		time	= 0;
		active	= false;
		done	= false;
		return self;
	}
	/// @param {bool} _active Set active
	static setActive = method(self, function(_active)
	{
		active = _active;
		return self;
	})
	static isActive = function()
	{
		return active;
	}
	static getTime = function()
	{
		return time;
	}
	/// @param {real} _time Time to seek
	static seekTime = function(_time)
	{
		return time == _time ? true : false;
	}
	static getTimeLeft = function()
	{
		return timeLeft
	}
}















