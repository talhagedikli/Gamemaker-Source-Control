/// @description draw_surfaces_main()
function draw_surfaces_main(argument0, argument1, argument2, argument3) {
	//Draws the surfaces for the game: the application surface and the hud surface.

	var dx, dy, xs, ys;
	dx = argument0;
	dy = argument1;
	xs = argument2;
	ys = argument3;

	//Apply shaders here
	if (global.shaders)
	    {
	    draw_apply_shaders();
	    }

	//Draw the actual application surface
	draw_surface_ext(application_surface,dx,dy,xs,ys,0,c_white,1);
	if (global.shaders)
	    {
	    shader_reset();
	    }

	//Draw hud surface
	if (surface_exists(hud_surface))
	    {
	    //Draw the notification
	    if (notification != "")
	        {
	        draw_reset();
	        draw_set_halign(fa_right);
	        draw_set_valign(fa_bottom);
	        surface_set_target(hud_surface);
	        draw_set_color(c_black);
	        draw_text_ext(base_resolution_x-3,base_resolution_y-3,string_hash_to_newline(notification),string_height(string_hash_to_newline("|")),base_resolution_x-6);
	        surface_reset_target();
	        }
    
	    //Draw the surface
	    draw_surface_ext(hud_surface,dx,dy,xs,ys,0,c_white,1);
    
	    surface_set_target(hud_surface);
	    draw_clear_alpha(c_black,0);
	    surface_reset_target();
	    }
	else
	    {
	    //Doesn't exist, lets create it.
	    hud_surface = surface_create(base_resolution_x,base_resolution_y);
    
	    surface_set_target(hud_surface);
	    draw_clear_alpha(c_black,0);
	    surface_reset_target();
	    }




}
