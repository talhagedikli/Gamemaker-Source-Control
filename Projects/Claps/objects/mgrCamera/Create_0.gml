//width and height 480*270
defWidth		=	1920/3;
defHeight		=	1080/3;
windowScale		=	2;

following		= noone;

//spd variables
followSpd		= 0.1;

//cam width and height
viewWidth		= defWidth;
viewHeight		= defHeight;

//first set to default
camW = viewWidth;
camH = viewHeight;

camX = 0;
camY = 0;

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
// display_set_gui_size(viewWidth * windowScale, viewHeight * windowScale);

//shake
shake			= false;
shake_time		= 0;
shake_magnitude = 0;
shake_fade		= 0;

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

state = new SnowState("normal");
state.add("normal", {
	step: function()
	{
		var xTo, yTo;
		if (instance_exists(following))
		{
			xTo = round(following.x) - (camW / 2);
			yTo = round(following.y) - (camH / 2);
		}
		else
		{
			xTo = x;
			yTo = y;
		}
		
		//camX = abs(difX) < EPSILON ? targetX : lerp(camX, targetX, followSpd);
		// camX = 0;
		// camY = 0;
		camX = flerp(camX, xTo, followSpd);
		camY = flerp(camY, yTo, followSpd);
		//camY = abs(difY) < EPSILON ? targetY : lerp(camY, targetY, followSpd);
		applyScreenShake();
		camX = clamp(camX, -shake_magnitude, room_width - camW + shake_magnitude);
		camY = clamp(camY, -shake_magnitude, room_height - camH + shake_magnitude);		
	}
});
