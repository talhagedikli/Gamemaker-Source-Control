//width and height 480*270
viewWidth		=	1920/2;
viewHeight		=	1080/2;
windowScale		=	1;

following		= instance_exists(objPlayer) ? objPlayer : noone;

//spd variables
followSpd		= 0.1;
zoomSpd			= 0.05;

//cam width and height
defaultW = viewWidth;
defaultH = viewHeight;

//first set to default
camW = defaultW;
camH = defaultH;

camX = 0;
camY = 0;

//to switch target
newW = 0;
newH = 0;

//camera target
if (instance_exists(following)) 
{
	targetX	= following.x - camW/2;
	targetY	= following.y - camH/2;
}
//set window size
window_set_size(viewWidth * windowScale, viewHeight * windowScale);
alarm[0] = 1;

//re-set surface and gui 
surface_resize(application_surface, viewWidth * windowScale, viewHeight * windowScale);
//display_set_gui_size(viewWidth, viewHeight);


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

/// @func updateCameraSize()
updateCameraSize = function (_w, _h) 
{
	camW = flerp(camW, _w, zoomSpd);
	camH = flerp(camH, _h, zoomSpd);
}






