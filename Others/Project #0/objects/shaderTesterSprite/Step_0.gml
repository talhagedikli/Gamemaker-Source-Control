/// @description 
#region VALUE CHANGES
//if (keyboard_check(ord("B")))
//{
//	if keyboard_check_pressed(vk_add)		brValue += 0.1;
//	if keyboard_check_pressed(vk_subtract)	brValue -= 0.1;
//}

if (keyboard_check(vk_numpad0))
{
	if keyboard_check_pressed(vk_add)		global.slider0 += 0.1;
	if keyboard_check_pressed(vk_subtract)	global.slider0 -= 0.1;
	global.slider0 = clamp(global.slider0, 0, 1);
}

if (keyboard_check(vk_numpad1))
{
	if keyboard_check_pressed(vk_add)		global.slider1 += 0.1;
	if keyboard_check_pressed(vk_subtract)	global.slider1 -= 0.1;
	global.slider1 = clamp(global.slider1, 0, 1);
}

if (keyboard_check(vk_numpad2))
{
	if keyboard_check_pressed(vk_add)		global.slider2 += 0.1;
	if keyboard_check_pressed(vk_subtract)	global.slider2 -= 0.1;
	global.slider2 = clamp(global.slider2, 0, 1);
}


#endregion

