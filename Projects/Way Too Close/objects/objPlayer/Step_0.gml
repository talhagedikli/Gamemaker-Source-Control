state.step();
if (ds_list_size(wepons) > 0)
{
	if (InputManager.keyQPressed)
	{
		focused = ceil(focused + 0.1);
	}
	else if (InputManager.keyQ)
	{
		focused += 0.1;
	}
	focused = focused mod ds_list_size(wepons);
}
//x = clamp(bbox_left, 0, room_width);
xScale = approach(xScale, 1, 0.03);
yScale = approach(yScale, 1, 0.03);
xPos = x;
yPos = y;