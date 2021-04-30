/// @description mouse_get_y_relative()
function mouse_get_y_relative() {
	//Returns the mouse's y position, relative to the game window.
	//Can be called from any instance.

	if (instance_exists(obj_control))
	    {
	    var T;
	    T = display_mouse_get_y();
	    if (obj_control.fullscreen)
	        {
	        T -= obj_control.dy;
	        } else {
	        T -= window_get_y();
	        }
	    T /= obj_control.ys;
    
	    return (round(T));
	    }
	else
	    {
	    return (0);
	    }




}
