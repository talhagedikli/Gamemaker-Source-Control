///@desc screenshake(magnitude,frames)
///@arg magnitude	strength of the shake (radius in pixel)
///@arg frames		60frames = 1sec
function screen_shake(magnitude,frames)
{
with (o_camera)
{
	if (magnitude > shake_remain)
	{
		shake_magnitude = magnitude;
		shake_remain = magnitude;
		shake_length = frames;
	}
}
}