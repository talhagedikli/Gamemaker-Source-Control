/// @description 
image_xscale	= 0.5;
image_yscale	= 0.5;

cellH			= 16;
cellW			= 16;

timeHeldRight	= 0;
timeHeldLeft	= 0;
timeHeldUp		= 0;
timeHeldDown	= 0;

delayed_input = function(_input, _inputHeld, _time, _repeatDly, _repeatSpd) {
	if (_input) _time = _repeatDly;
	if (_time > 0) {
		_time--;
		if ((_time == 0) and _inputHeld) {
			_time = _repeatSpd;
			return true;
		}
	}	
}
////Holding Right Button
//if (right) timeHeldRight = repeatDelay;
//if (timeHeldRight > 0) {
//	timeHeldRight--;
//	if ((timeHeldRight == 0) and heldRight) {
//		timeHeldRight = repeatSpeed;
//		right = true;
//	}
//}



