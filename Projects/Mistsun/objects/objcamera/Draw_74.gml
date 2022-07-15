// yalcc camera
if (surface_exists(view_surf)) {
    // draw_surface_part(view_surf, frac(x), frac(y), gameWidth, gameHeight, 0, 0);
    draw_surface(view_surf, -frac(x), -frac(y));
}