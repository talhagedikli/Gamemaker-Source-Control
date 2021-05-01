/// @description 
image_xscale	= 0.5;
image_yscale	= 0.5;

cellH			= 16;
cellW			= 16;

timeHeldRight	= 0;
timeHeldLeft	= 0;
timeHeldUp		= 0;
timeHeldDown	= 0;

function delayed_input(_input, _inputHeld, _time, _repeatDly, _repeatSpd) {
	if (_input) _time = _repeatDly;
	if (_time > 0) {
		_time--;
		if ((_time == 0) and _inputHeld) {
			_time = _repeatSpd;
			_input = true;
		}
	}	
}




