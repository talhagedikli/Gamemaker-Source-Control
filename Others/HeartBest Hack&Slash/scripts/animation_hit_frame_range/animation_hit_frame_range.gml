// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@param low
///@param high
function animation_hit_frame_range(_low, _high)
{
	return image_index >= _low and image_index <= _high;

}