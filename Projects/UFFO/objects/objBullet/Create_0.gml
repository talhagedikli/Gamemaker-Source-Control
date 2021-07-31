randomize();
speed		= 2;
angleSpd	= 2;
fadeOut		= false;
startPos	= new Vector2(x, y);
destroy = function()
{
	fadeOut = true;
}
outside = function()
{
	return (bbox_right < 0 || bbox_left > room_width || bbox_top < 0 || bbox_bottom > room_height);
}
state = new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		angleSpd = 0;
	},
	step: function()
	{
		if (outside()) destroy();
	}
});
state.add("rotating", {
	enter: function()
	{
		
	},
	step: function()
	{
		image_angle += angleSpd;
		direction	= image_angle;
		if (abs(startPos.x - x) < 1 && abs(startPos.y - y) < 1) destroy();
	}
});