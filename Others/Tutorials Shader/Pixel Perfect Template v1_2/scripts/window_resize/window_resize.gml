/// @description window_resize()
function window_resize() {
	//Resizes the window to the appropriate scale.

	window_set_size(scale*base_resolution_x,scale*base_resolution_y);

	//Center the window
	alarm[1] = 1;




}
