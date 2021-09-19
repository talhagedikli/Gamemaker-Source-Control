//width and height 480*270
viewWidth		=	1920/3;
viewHeight		=	1080/3;
windowScale		=	2;

base_width = viewWidth * windowScale;
base_height = viewHeight * windowScale;
width = base_width;
height = base_height;


//base_size = 512;
//width = browser_width;
//height = browser_height;
//canvas_fullscreen(base_size);

camX = 0;
camY = 0;
//set window size
window_set_size(viewWidth * windowScale, viewHeight * windowScale);
alarm[0] = 1;

//re-set surface and gui 
surface_resize(application_surface, viewWidth * windowScale, viewHeight * windowScale);



//shake
shake			= false;
shake_time		= 0;
shake_magnitude = 0;
shake_fade		= 0;

//enums 
enum camStates 
{
	normal,
	cell,
	zoom
}

// Methods
/// @func applyScreenShake()
applyScreenShake = function () 
{
	if (shake)
	{
		//reduce shake time by 1(every step)
		shake_time -= 1;
			
		//calculate shake magnitude
		var _xval = random_range(-shake_magnitude, shake_magnitude); 
		var _yval = random_range(-shake_magnitude, shake_magnitude);
			
		//apply the shake
		camX += _xval;
		camY += _yval;
			
		if (shake_time <= 0) 
		{
			//if shake time is zero, shake fade
			shake_magnitude -= shake_fade; 

			if (shake_magnitude <= 0) 
			{
				//if shake fade is zero, turn shake of
			    shake = false; 
			} 
		}
	}
	
}



