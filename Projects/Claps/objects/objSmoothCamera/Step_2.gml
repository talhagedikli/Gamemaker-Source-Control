// in GMS1, set view_xview and view_yview instead
var xTo, yTo;
if (instance_exists(following))
{
	var cs = CAMERA.GetSize();
	xTo = round(following.x) - (cs.x / 2);
	yTo = round(following.y) - (cs.y / 2);
}
else
{
	xTo = x;
	yTo = y;
}
x = flerp(x, xTo, 0.15);
y = flerp(y, yTo, 0.15);
CAMERA.SetPos(floor(x), floor(y));
if (!surface_exists(view_surf)) {
    view_surf = surface_create(game_width + 1, game_height + 1);
}
view_surface_id[0] = view_surf;
