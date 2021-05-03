/// @description 
cellH			= 16;
cellW			= 16;

timeHeldRight	= 0;
timeHeldLeft	= 0;
timeHeldUp		= 0;
timeHeldDown	= 0;

delayed_input = function(time, input, inputHeld, repeatDly, repeatSpd) {
	static time = 0;
	
	if (input) time = repeatDly;
	if (time > 0) {
		time--;
		if ((time == 0) and inputHeld) {
			time = repeatSpd;
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



