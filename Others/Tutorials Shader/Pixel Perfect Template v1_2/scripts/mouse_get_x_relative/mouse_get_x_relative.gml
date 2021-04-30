/// @description mouse_get_x_relative()
function mouse_get_x_relative() {
	//Returns the mouse's x position, relative to the game window.
	//Can be called from any instance.

	if (instance_exists(obj_control))
	    {
	    var T;
	    T = display_mouse_get_x();
	    if (obj_control.fullscreen)
	        {
	        T -= obj_control.dx;
	        } else {
	        T -= window_get_x();
	        }
	    T /= obj_control.xs;
    
	    return (round(T));
	    }
	else
	    {
	    return (0);
	    }




}
