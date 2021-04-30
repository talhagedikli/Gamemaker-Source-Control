if (!surface_exists(surf))
	{
	
	var _cw = camera_get_view_width(VIEW);
	var _ch = camera_get_view_height(VIEW);
	
	surf = surface_create(_cw, _ch);
	
	surface_set_target(surf);
	
	draw_set_colour(c_black);
	draw_set_alpha(0);
	draw_rectangle(0, 0, _cw, _cw, false);
	
	surface_reset_target();
	}
	else
	{
		if (surface_exists(surf)) 
		{
		var _cw = camera_get_view_width(VIEW);
		var _ch = camera_get_view_height(VIEW);
		var _cx = camera_get_view_x(VIEW);
		var _cy = camera_get_view_y(VIEW);
		var _drk = 0.4;
		
		surface_set_target(surf);
		
		draw_set_color(c_black);
		draw_set_alpha(_drk);
		draw_rectangle(0, 0, _cw, _ch, 0);
		
		gpu_set_blendmode(bm_subtract);
		
		with (objLightParent)
		{
			var _sw = sprite_width / 2;
			var _sh = sprite_height / 2;
			
			switch(object_index)
			{
				case objPlayer:
			    draw_sprite_ext(sprLight, 0, x - _cx, y - _cy - 4, 0.2 + random(0.001), 0.2 + random(0.001), 0, c_white, 1);
			    break;
			}

		}
		gpu_set_blendmode(bm_normal);
		
		draw_set_alpha(1);
		
		surface_reset_target();
		
		draw_surface(surf, _cx, _cy);
		}
	}