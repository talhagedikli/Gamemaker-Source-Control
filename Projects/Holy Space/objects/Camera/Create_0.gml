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
window_set_size(viewWidth*windowScale, viewHeight*windowScale);
alarm[0] = 1;

//re-set surface and gui 
surface_resize(application_surface, viewWidth * windowScale, viewHeight * windowScale);
display_set_gui_size(viewWidth* windowScale, viewHeight* windowScale);


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

state = new SnowState("normal");

state.history_enable(true);
state.set_history_max_size(5);

state.add("normal", {
	enter: function()
	{
		
	},
	step: function()
	{
		if (instance_exists(following))
		{
			var xTo, yTo;
			xTo = round(following.x) - (camW / 2);
			yTo = round(following.y) - (camH / 2);
			//camX = abs(difX) < EPSILON ? targetX : lerp(camX, targetX, followSpd);
			camX = 0;
			camY = 0;
			//camX = flerp(camX, xTo, followSpd);
			//camY = flerp(camY, yTo, followSpd);
			//camY = abs(difY) < EPSILON ? targetY : lerp(camY, targetY, followSpd);
			applyScreenShake();
		}		
	},
	leave: function()
	{
		
	}
});

state.add("cell", {
	enter: function()
	{
		
	},
	step: function()
	{
		if (instance_exists(following))
		{
			var xTo, yTo;
			xTo = (following.x div viewWidth) * viewWidth;
			yTo = (following.y div viewHeight) * viewHeight;
			var difX, difY;
			difX = (xTo - camX);
			difY = (yTo - camY);
			camX = abs(difX) < 1 ? xTo : camX + difX / 15;
			camY = abs(difY) < 1 ? yTo : camY + difY / 15;
		}
		//screen shake script to apply it
		applyScreenShake();		
	},
	leave: function()
	{
		
	}
});

state.add("zoom", {
	enter: function()
	{
		
	},
	step: function()
	{
		if (instance_exists(following))
		{
			//if zoomed in, make camera smaller
			newW = defaultW / 2;
			newH = defaultH / 2;
			camX = flerp(camX, targetX, followSpd);
			camY = flerp(camY, targetY, followSpd);
		}		
	},
	leave: function()
	{
		
	}
});




