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

//apply the camera's positions and size

camera_set_view_pos(VIEW, camX, camY);

//track the transition layer
//if (layer_sequence_exists("transitions", global.sequenceLayer))
//{
//	layer_sequence_x(global.sequenceLayer, camX);
//	layer_sequence_y(global.sequenceLayer, camY);
//}	
	
	
