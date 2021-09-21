

if (window_get_fullscreen())
{
	surface_resize(application_surface, DIS_W, DIS_H);
}
else
{
	surface_resize(application_surface, WIN_W, WIN_H);
}