if (surface_exists(sLights)) {
    surface_free(sLights);
    sLights = -1;
}

application_surface_draw_enable(true);
gpu_set_tex_filter(false); //optional scale problems