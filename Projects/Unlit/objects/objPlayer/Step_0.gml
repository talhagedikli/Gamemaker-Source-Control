/// @description 
#region Movement
depth = -y;
//Inputs
var right = keyboard_check_pressed(vk_right);
var left = keyboard_check_pressed(vk_left);
var up = keyboard_check_pressed(vk_up);
var down = keyboard_check_pressed(vk_down);

var heldRight = keyboard_check(vk_right);
var heldLeft = keyboard_check(vk_left);
var heldUp = keyboard_check(vk_up);
var heldDown = keyboard_check(vk_down);

var repeatSpeed = 6;
var repeatDelay = 25;

//Holding Right Button
if (right) timeHeldRight = repeatDelay;
if (timeHeldRight > 0) {
	timeHeldRight--;
	if ((timeHeldRight == 0) and heldRight) {
		timeHeldRight = repeatSpeed;
		right = true;
	}
}
//Holding Left Button
if (left) timeHeldLeft = repeatDelay;
if (timeHeldLeft > 0) {
	timeHeldLeft--;
	if ((timeHeldLeft == 0) and heldLeft) {
		timeHeldLeft = repeatSpeed;
		left = true;
	}
}
//Holding Left Button
if (up) timeHeldUp = repeatDelay;
if (timeHeldUp > 0) {
	timeHeldUp--;
	if ((timeHeldUp == 0) and heldUp) {
		timeHeldUp = repeatSpeed;
		up = true;
	}
}
//Holding Left Button
if (down) timeHeldDown = repeatDelay;
if (timeHeldDown > 0) {
	timeHeldDown--;
	if ((timeHeldDown == 0) and heldDown) {
		timeHeldDown = repeatSpeed;
		down = true;
	}
}



//Calculating move
var hMove = right - left;
var vMove = down - up;

//Applying move
xSpeed = hMove * cellW;
ySpeed = vMove * cellH;

if (!place_meeting(x + sign(xSpeed), y + (ySpeed), objBlock)) {
	x += xSpeed;
	y += ySpeed;
}

//check_collisions_pixel_perfect();

#endregion















