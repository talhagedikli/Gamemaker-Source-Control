/// @description 
moveCam = keyboard_check(ord("C"));

if (moveCam)
{
	x += (keyboard_check(ord("D")) - keyboard_check(ord("A")))*6;
	y += (keyboard_check(ord("S")) - keyboard_check(ord("W")))*6;
}
else
{
	x = clamp(x, following.x-hborder, following.x+hborder);
	y = clamp(y, following.y-vborder, following.y+vborder);
}