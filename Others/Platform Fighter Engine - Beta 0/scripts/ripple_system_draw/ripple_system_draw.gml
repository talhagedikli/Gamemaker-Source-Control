///@func ripple_system_draw(surface,system_index)
///@args surface,system_index
///@desc Draws all of the ripples in the system
var _final_surf = argument[0];
var _map = argument[1];
var _list = _map[? "List"];
var _surf = _map[? "Surface"];
draw_set_circle_precision(60);
//Draw all ripples onto a single surface
if (surface_exists(_surf))
	{
	surface_set_target(_surf);
	draw_clear_alpha(c_white,0);
	draw_surface(_final_surf,0,0);
	for(var i=0;i<ds_list_size(_list);i++)
		{
		var _ripple = _list[|i];
		//Draw the ripple
		var _x = _ripple[RIPPLE.X];
		var _y = _ripple[RIPPLE.Y];
		var _s = _ripple[RIPPLE.Size];
		var _c = _ripple[RIPPLE.Color];
		var _a = _ripple[RIPPLE.Alpha];
	
		var _stored_alpha = draw_get_alpha();
	
		draw_set_alpha(_a);
		draw_circle_color(_x-x,_y-y,_s,_c,_c,false);
		draw_set_alpha(_stored_alpha);
		}
	surface_reset_target();
	}
else
	{
	//Renew the surface if it gets destroyed
	var _size = _map[? "Surface_Size"];
	_map[? "Surface"] = surface_create(_size[0],_size[1]);
	}
//Draw that overlayed onto the main surface
if (surface_exists(_final_surf))
	{
	surface_set_target(_final_surf);
	
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	
	draw_surface(_surf,0,0);
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	}