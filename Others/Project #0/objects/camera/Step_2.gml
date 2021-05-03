//some variables
camX	= camera_get_view_x(VIEW);
camY	= camera_get_view_y(VIEW);

// scaling fullscreen
//if window_get_fullscreen()
//{
//	var _fw = window_get_width();
//	var _fh = window_get_height();
//	if surface_exists(application_surface)
//		surface_resize(application_surface, _fw, _fh);
//	display_set_gui_size(-1, -1);
//}
//else
//{
//	var _ww = window_get_width(); 
//	var _wh = window_get_height(); 
//	if surface_exists(application_surface)
//		surface_resize(application_surface, _ww, _wh);
//	display_set_gui_size(-1, -1);
//}

//set camera's size
if (global.zoom)
{
	camW = lerp(camW, newW, zoomSpd);
	camH = lerp(camH, newH, zoomSpd);
}
else
{
	camW = lerp(camW, defaultW, zoomSpd);
	camH = lerp(camH, defaultH, zoomSpd);

}

camera_set_view_size(VIEW, camW, camH);

//"following"'s positions by camera
targetX	= following.x - camW/2;
targetY	= following.y - camH/2;


switch (state)
{
	case cammodes.normal:
		if (instance_exists(following))
		{
			//follow the "following" object
			//x pos
			camX = lerp(camX, targetX, followSpd);
			//y pos
			camY = lerp(camY, targetY, followSpd);
			
			//screen shake script to apply it
			apply_screen_shake();
		}
	break; 
	
	case cammodes.cell:
	
		if (instance_exists(following)) 
		{
			//to prevent smth
			camX = camXStart
			//var _cellN = room_width div viewWidth;
			//var _camCell = camX div viewWidth;
			//var _playerCell = objPlayer.x div viewWidth;
			var _times = (following.x - camX) div viewWidth;
			
			//x pos
			camX = viewWidth*_times;
			//y pos
			camY = lerp(camY, targetY, followSpd);
			
			//screen shake script to apply it
			apply_screen_shake();

		}
	break;
	
	case cammodes.zoom:
		
		if (instance_exists(following))
		{
			//if zoomed in, make camera smaller
			newW = defaultW/2;
			newH = defaultH/2;
			
			//go to who you are focused to
			camX = lerp(camX, targetX, followSpd); 
			camY = lerp(camY, targetY, followSpd);
		}
		
		//NOTE: does not have screen shake
	break;
}

//clamp camera's position values inside of the room (cam width and height are
// dynamic)
camX = clamp(camX, 0, room_width - camW);
camY = clamp(camY, 0, room_height - camH);

//apply the camera's positions
camera_set_view_pos(VIEW, camX, camY);


//track the transition layer
if (layer_sequence_exists("transitions", global.sequenceLayer)) 
{
	layer_sequence_x(global.sequenceLayer, camX);
	layer_sequence_y(global.sequenceLayer, camY);
}

//parallax background
if (layer_exists("orwanBG"))
{
	layer_x("orwanBG", camX/16);
}

if (layer_exists("gokyuzu"))
{
	layer_x("gokyuzu", camX/2);
}

if (layer_exists("dag"))
{
	layer_x("dag", camX/8);
}

if (layer_exists("yer"))
{
	layer_x("yer", camX/32);
}


