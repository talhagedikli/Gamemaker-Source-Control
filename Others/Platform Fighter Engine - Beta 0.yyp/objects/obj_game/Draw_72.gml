/// @description Clear the surface
if (!surface_exists(game_surface))
	{
	game_surface = surface_create(window_width, window_height);
	}
	
surface_set_target(game_surface);
draw_clear(c_white);
surface_reset_target();