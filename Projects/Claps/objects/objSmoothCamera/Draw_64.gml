if (surface_exists(view_surf)) {
    //draw_surface_part(view_surf, frac(x), frac(y), game_width, game_height, 0, 0);
	//draw_surface_part(view_surf, frac(x), frac(y), game_width, game_height, 0, 0);
	//var ax = camera_get_view_x(VIEW) - x;
	//var ay = camera_get_view_y(VIEW) - y;
	//draw_surface(view_surf, ax, ay);
	// draw_surface(view_surf, 0, 0);
	draw_surface(view_surf, -frac(x), -frac(y));
	// draw_surface_part(view_surf, frac(x), frac(y), game_width, game_height, 0, 0);
}