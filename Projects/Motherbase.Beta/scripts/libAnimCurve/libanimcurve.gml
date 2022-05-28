/// @desc Description for Animcurve
/// @param {real} _animcurve description
/// @param {mixed} _channel description
/// @param {real} [_spd=0.01] description
/// @param {bool} [_loop=false] description
/// @param {bool} [_autostart=false] description
/// @param {bool} [_autorun=false] description
function Animcurve(_animcurve, _channel, _spd = 0.01, _loop = false, _autostart = false, _autorun = false) : Lwo() constructor
{

    curveStruct		= animcurve_get(_animcurve);
    channel			= animcurve_get_channel(curveStruct, _channel);
    curveSpeed		= _spd;
    loop			= _loop;
    active			= _autostart;
    done			= false;
    x				= 0;
    y				= animcurve_channel_evaluate(channel, x);
    
	y1				= animcurve_channel_evaluate(channel, 0);
	y2				= animcurve_channel_evaluate(channel, 1);
	autorun			= _autorun;
	

    //if (_autorun) array_push(ANIMCURVES, self);
	
	__step_end__ = function()
	{
		if (autorun) run();
	}
	
    static start = function()
    {
        active = true;
    }
    static run = function()
    {
        if (active)
        {
			// TO-DO: Switch x y
			y = animcurve_channel_evaluate(channel, x);
			x = clamp(x, 0, 1);
			y = clamp(y, y1, y2);
			x += curveSpeed;
            //if (x >= 1)
            //{
            //    done = true;
            //    active = false;
            //}
			//else
			//{
			//	x += curveSpeed;
			//}
			// New
			if (done)
			{
				if (loop) reset();
				else stop();
			}			
			else if (x >= 1)
			{
				done = true;	
			}
        }
		else
		{
			
		}
        return self;
    }

    static reset = function()
    {
        active = true;
        done = false;
        x = 0;
		y = animcurve_channel_evaluate(channel, x);

        return self;
    }
    static stop = function()
    {
        active = false;
        done = false;
        x = 0;
        y = animcurve_channel_evaluate(channel, x);
        return self;
    }
    static getValue = function()
    {
        return y;
    }
    static getPosition = function()
    {
        return x;
    }
    static onTimeout = function(_func)
    {
        if (done)
        {
            _func();
        }
    }
}
