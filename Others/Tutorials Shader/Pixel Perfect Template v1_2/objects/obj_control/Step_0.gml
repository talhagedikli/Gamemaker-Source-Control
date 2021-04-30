/// @description Hotkeys

if (keyboard_check_pressed(key_restart))
    {
    sdm("Restarting game...");
    game_restart();
    }
else if (keyboard_check_pressed(key_fullscreen))
    {
    fullscreen = !fullscreen;
    window_set_fullscreen(fullscreen);
    notify("Toggled Fullscreen: "+get_on_off(fullscreen),room_speed*2);
    if (!fullscreen)
        {
        //Center window, if not fullscreen.
        window_resize();
        alarm[1] = 1;
        }
    }
else if (keyboard_check_pressed(key_full_scale))
    {
    full_scale = !full_scale;
    notify("Toggled Full Scale: "+get_on_off(full_scale),room_speed*2);
    }
else if (keyboard_check_pressed(key_ratio))
    {
    keep_ratio = !keep_ratio;
    notify("Toggled Aspect Ratio: "+get_on_off(keep_ratio),room_speed*2);
    }
else if (keyboard_check_pressed(key_scaleup))
    {
    scale++;
    if (scale > scale_max)
        {
        scale = 1;
        }
    if (!fullscreen)
        {
        //Resize the window based on the scale.
        window_resize();
        }
    notify("Scaled to "+string(scale)+"x",room_speed*2);
    }
else if (keyboard_check(key_quit))
    {
    quit--;
    if (quit <= 0)
        {
        game_end();
        }
    }
else
    {
    quit = quit_full;
    }


