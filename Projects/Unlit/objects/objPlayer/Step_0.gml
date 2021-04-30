/// @description 
player_buttons_init();

#region MOVEMENT

if (keyRightPressed) {
	x += stepSize;
} else if (keyLeftPressed) {
	x -= stepSize;
} else if (keyUpPressed) {
	y -= stepSize;
} else if (keyDownPressed) {
	y += stepSize;
}


if (keyRight) {
	pressGap--;
	if (pressGap < 0) {
		x += stepSize;
		pressGap = pressGapMax;
	}
} else if (keyLeft) {
	pressGap--;
	if (pressGap < 0) {
		x -= stepSize;
		pressGap = pressGapMax;
	}
} else if (keyDown) {
	pressGap--;
	if (pressGap < 0) {
		y += stepSize;
		pressGap = pressGapMax;
	}
} else if (keyUp) {
	pressGap--;
	if (pressGap < 0) {
		y -= stepSize;
		pressGap = pressGapMax;
	}
} else {
	pressGap = pressGapMax;
}
#endregion

















