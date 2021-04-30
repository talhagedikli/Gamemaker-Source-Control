/// @description dimensions
var cam = view_get_camera(0);
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

display_set_gui_size(view_w, view_h);
surface_resize(application_surface, view_w, view_h);
window_set_size(view_w, view_h);
