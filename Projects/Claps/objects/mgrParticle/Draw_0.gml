if (!surface_exists(surPS))
{
	surPS = surface_create(mgrCamera.viewWidth, mgrCamera.viewHeight);
}
else
{
	surface_set_target(surPS);
	part_system_drawit(global.PS);
	surface_reset_target();
}

