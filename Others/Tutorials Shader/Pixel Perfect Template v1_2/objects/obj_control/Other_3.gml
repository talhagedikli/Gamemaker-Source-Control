/// @description Close up

sdm("Closing game...");

surface_free(hud_surface);

if (save_graphics)
    {
    //Save new graphics options
    ini_open(config_file);
    ini_write_real("graphics","fullscreen",fullscreen);
    ini_write_real("graphics","full_scale",full_scale);
    ini_write_real("graphics","keep_ratio",keep_ratio);
    ini_write_real("graphics","scale",scale);
    ini_write_real("graphics","scale_max",scale_max);
    ini_close();
    }

sdm("Game closed.");

