/// @description Normal Camera Mode
//character in the middle of the cam
function mode_normal()
{
	//we are in endstep cause we assume that we move in step event
	camera_set_view_size(VIEW, viewWidth, viewHeight);

	if (instance_exists(objPlayer)) 
	{
		
		var _xval = clamp(choose(-shake_magnitude, shake_magnitude), 0, room_width-viewWidth); 
		var _yval = clamp(choose(-shake_magnitude, shake_magnitude), 0, room_height- viewHeight); 
		var _x = clamp(objPlayer.x - viewWidth/2, 0, room_width-viewWidth);
		var _y = clamp(objPlayer.y - viewHeight/2, 0, room_height-viewHeight);
		camera_set_view_pos(VIEW, _x, _y);
	
		var _curX = camera_get_view_x(VIEW);
		var _curY = camera_get_view_y(VIEW);
	
		var _spd = 0.1;
	
		if (shake)
		{
			shake_time --;
			camera_set_view_pos(VIEW, lerp(_curX, _x+_xval, _spd), lerp(_curY, _y+_yval, _spd));
			if (shake_time <= 0) 
			{ 
			    shake_magnitude -= shake_fade; 

			    if (shake_magnitude <= 0) 
			    { 
			        camera_set_view_pos(VIEW, lerp(_curX, _x, _spd), lerp(_curY, _y, _spd));
			        shake = false; 
			    } 
			}
		}
		else
		{
			camera_set_view_pos(VIEW, lerp(_curX, _x, _spd), lerp(_curY, _y, _spd));
		}
	
	
	}

}


/// @description Camera Cell Mode
//384*216
function mode_cell()
{
	//we are in endstep cause we assume that we move in step event
	camera_set_view_size(VIEW, viewWidth, viewHeight);

	if (instance_exists(objPlayer)) 
	{

		var _xVal = clamp(choose(-shake_magnitude, shake_magnitude), 0, room_width-viewWidth); 
		var _yVal = clamp(choose(-shake_magnitude, shake_magnitude), 0, room_height- viewHeight); 
		var _x = clamp(objPlayer.x - viewWidth/2, 0, room_width-viewWidth);
		var _y = clamp(objPlayer.y - viewHeight/2, 0, room_height-viewHeight);
		camera_set_view_pos(VIEW, 0, _y);
	
		var _curX = camera_get_view_x(VIEW);
		var _curY = camera_get_view_y(VIEW);
	
		var _cellN = room_width div viewWidth;
		var _camCell = _curX div viewWidth;
		var _playerCell = objPlayer.x div viewWidth;
		var _times = clamp(((objPlayer.x-_curX) div viewWidth), 0, _cellN-1);
		var _spd = 0.1;
	
		camera_set_view_pos(VIEW, viewWidth*_times, _curY);

	}

}