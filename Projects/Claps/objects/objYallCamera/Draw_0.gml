if (surface_exists(view_surf)) {
    draw_surface_part(view_surf, frac(x), frac(y), game_width, game_height, 0, 0);
    // or draw_surface(view_surf, -frac(x), -frac(y));
}