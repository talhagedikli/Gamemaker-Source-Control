/// @description Draw application surface

dx = 0; dy = 0;
xs = 1; ys = 1;

if (fullscreen)
    {
    if (keep_ratio)
        {
        //Keep aspect ratio
        // (Use same scale for both dimensions, whichever is smaller and fits the screen)
        var ratio_min;
        ratio_min = min(display_get_width()/base_resolution_x,display_get_height()/base_resolution_y);
        xs = ratio_min;
        ys = ratio_min;
        dx = (display_get_width()/2)-(ratio_min*base_resolution_x/2);
        dy = (display_get_height()/2)-(ratio_min*base_resolution_y/2);
        }
    else if (full_scale)
        {
        //Fill entire screen (stretch)
        // (Use different scale for the dimensions, based on the size of the display)
        xs = display_get_width()/base_resolution_x;
        ys = display_get_height()/base_resolution_y;
        }
    else
        {
        //Base it on scale
        // (Same scale, but not filling the entire screen)
        dx = (display_get_width()/2)-(scale*base_resolution_x/2);
        dy = (display_get_height()/2)-(scale*base_resolution_y/2);
        xs = scale;
        ys = scale;
        }
    }
else
    {
    //Base it on scale
    // (Windowed, so it doesn't matter)
    xs = scale;
    ys = scale;
    }

draw_surfaces_main(dx,dy,xs,ys);


