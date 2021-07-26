if (global.zoom)
{
	updateCameraSize(newW, newH);
}
else
{
	updateCameraSize(defaultW, defaultH);
}	
	
state.step();
	
camX = clamp(camX, -shake_magnitude, room_width - camW + shake_magnitude);
camY = clamp(camY, -shake_magnitude, room_height - camH + shake_magnitude);
camera_set_view_size(VIEW, camW, camH);

if keyboard_check_pressed(ord("S")) 
{
	smooth = !smooth;
	application_surface_enable(!smooth);

	var pad = smooth ? 1 : 0;
	camera_set_view_size(VIEW, camW + pad, camH + pad);	
}

//apply the camera's positions and size

camera_set_view_pos(VIEW, camX, camY);


	//Smooth camera
if (smooth) 
{
	if (!surface_exists(viewSurf)) 
	{
		viewSurf = surface_create(viewWidth * windowScale + 1, viewHeight * windowScale + 1);
	}
	view_surface_id[0] = viewSurf;
} 
else 
{
	if (surface_exists(viewSurf)) 
	{
		surface_free(viewSurf);
		viewSurf = -1;
	}
	view_surface_id[0] = -1;
}
//track the transition layer
if (layer_sequence_exists("transitions", global.sequenceLayer))
{
	layer_sequence_x(global.sequenceLayer, camX);
	layer_sequence_y(global.sequenceLayer, camY);
}	
	
	
