/// @description  scaling fullscreen
if WIN_W != APP_W || WIN_H != APP_H {
	surface_resize(application_surface, WIN_W, WIN_H);
}

if WIN_W != GUI_W || WIN_H != GUI_H {
	display_set_gui_size(WIN_W, WIN_H);
}


