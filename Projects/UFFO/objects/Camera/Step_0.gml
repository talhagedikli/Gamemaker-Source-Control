//if WIN_W != APP_W || WIN_H != APP_H 
//{
//	surface_resize(application_surface, WIN_W, WIN_H);
//}

if (window_get_fullscreen())
{
	surface_resize(application_surface, DIS_W, DIS_H);
}
else
{
	surface_resize(application_surface, WIN_W, WIN_H);
}