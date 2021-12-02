application_surface_enable(false);
// viewWidth, viewHeight are your base resolution (ideally constants)
following = noone;
Follow = function(_id = self.id)
{
	/// @func Follow(id)
	self.following = _id;
}
width	= GAME_RESOLUTION.x;
height	= GAME_RESOLUTION.y;
scale	= WINDOW_SCALE;
// in GMS1, set view_wview and view_hview instead
//camera_set_view_size(VIEW, viewWidth, viewHeight);
//surface_resize(application_surface, viewWidth, viewHeight);
CAMERA.SetSize(width + 1, height + 1);
WINDOW.SetSize(width * scale, height * scale);
GUI.SetSize(width, height);
// Center window
alarm[0] = 1;
surView = -1;


tt = new Timer(60, true, false);
//shake
shake			= false;
shakeTime		= 0;
shakeMagnitude	= 0;
shakeFade		= 0;
__ApplyScreenShake = function () 
{
	if (shake)
	{
		//reduce shake time by 1(every step)
		shakeTime -= 1;
			
		//calculate shake magnitude
		var _xval = random_range(-shakeMagnitude, shakeMagnitude); 
		var _yval = random_range(-shakeMagnitude, shakeMagnitude);
			
		//apply the shake
		x += _xval;
		y += _yval;
			
		if (shakeTime <= 0) 
		{
			//if shake time is zero, shake fade
			shakeMagnitude -= shakeFade; 

			if (shakeMagnitude <= 0) 
			{
				//if shake fade is zero, turn shake of
			    shake = false; 
			} 
		}
	}
}
Shake = function(_time, _magnitude, _fade = _magnitude)
{
	self.shakeTime		= _time;
	self.shakeMagnitude = _magnitude;
	self.shakeFade		= _fade;
	self.shake			= true;
}