/// @description 
var tid = layer_tilemap_get_id("orwan");
if (!surface_exists(surTile)) {
	var aw = surface_get_width(application_surface);
	var ah = surface_get_height(application_surface);
	surTile = surface_create(aw, ah);
}


surface_set_target(surTile);
draw_tilemap(tid, 0, 0);
surface_reset_target();

draw_surface(surTile, 0, 0);