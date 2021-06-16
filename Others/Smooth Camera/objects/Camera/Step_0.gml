/// @description  scaling fullscreen
//if window_get_fullscreen()
//{
//	var _ww = window_get_width(); 
//	var _wh = window_get_height(); 
//	surface_resize(application_surface, _ww, _wh);
//	display_set_gui_size(_ww, _wh);
//}
//else
//{
//	var _ww = window_get_width(); 
//	var _wh = window_get_height(); 
//	surface_resize(application_surface, _ww, _wh);
//some variables

var hi = keyboard_check(vk_right) - keyboard_check(vk_left);
var vi = keyboard_check(vk_down) - keyboard_check(vk_up);


camX = lerp(camX, camX + (hi * 10), 0.05);
camY = lerp(camY, camY + (vi * 10), 0.05);






