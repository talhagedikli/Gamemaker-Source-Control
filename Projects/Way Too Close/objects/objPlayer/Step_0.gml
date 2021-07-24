state.step();
if (array_length(inventory) > 0)
{
	if (InputManager.keyQPressed)
	{
		focused = ceil(focused + 0.1);
		focusTimer.start(focusDelay);
	}
	else if (InputManager.keyQ && focusTimer.done)
	{
		focused += 0.1;
		focusTimer.stop();
	}
	focused = focused mod array_length(inventory);
}
showInv		= InputManager.keyIPressed ? !showInv : showInv;
invBgAlpha	= showInv ? flerp(invBgAlpha, 0.8, 0.1) : flerp(invBgAlpha, 0, 0.1);

cx = CAM_X; 
cy = CAM_Y; 
cw = CAM_W;
ch = CAM_H;
camSize = Camera.getSize();
camPos	= Camera.getPosition();

//x = clamp(bbox_left, 0, room_width);
xScale = approach(xScale, 1, 0.03);
yScale = approach(yScale, 1, 0.03);
xPos = x;
yPos = y;

