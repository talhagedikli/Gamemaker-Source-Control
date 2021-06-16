/// @description 
var vc = view_camera[0];
if (smooth && surface_exists(view_surf)) {
	var ax = camera_get_view_x(vc) - camX;
	var ay = camera_get_view_y(vc) - camY;
	draw_surface(view_surf, ax, ay);
}
display_set_gui_size(view_wport[0], view_hport[0]);
draw_set_color(c_dkgray);
draw_set_alpha(0.8);
draw_rectangle(0, 0, 250, 50, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text(3, 5, "I AM HERE TO TEST GUI STUFF");
display_set_gui_size(viewWidth, viewHeight);

draw_set_color(c_dkgray);
draw_set_alpha(0.8);
draw_rectangle(0, 50, 250, 100, false);
draw_set_color(c_white);
draw_set_alpha(1);

draw_text(3, 55, "I AM HERE TO TEST GUI STUFF");