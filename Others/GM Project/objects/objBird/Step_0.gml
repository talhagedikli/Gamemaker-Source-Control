player_inputs();

//positions of following objects
var _fX = following.x;
var _fY = following.y;

xSpeed		= 0.05;
ySpeed		= 0.03;

//positions of where it is going to
var _xTo = _fX - following.facing*15;
var _yTo = _fY - 30;


//distance between following object and object we seek
var _gapX = abs(x - _xTo);
var _gapY = abs(y - _yTo);

//distance between following object and the object
var _disX = abs(x - _fX);
var _disY = abs(y - _fY);

//animation curves
curvePos += curveSpd;
curvePos = curvePos mod 1;

//x pos
var _curveStruct = animcurve_get(curveAsset);
var _channel = animcurve_get_channel(_curveStruct, "x");
var _valueX = animcurve_channel_evaluate(_channel, curvePos);

//y pos
var _curveStruct = animcurve_get(curveAsset);
var _channel = animcurve_get_channel(_curveStruct, "y");
var _valueY = animcurve_channel_evaluate(_channel, curvePos);


if (instance_exists(following))
{
	//time variables (from 0 to 360)
	time += 1;
	time = time mod 360;
	
	//X POSITION
	if (_gapX < epsilon) 
	{
		//if it reaches its x position, stop 
		stopX = true;
	}
	
	if (_disX > 24)
	{
		//
		stopX = false;
		lastAngle = image_angle;
	}

	
	if (stopX == false) 
	{	
		//track the player if distance between them lower than 24
		x = lerp(x, _xTo, xSpeed);
	}

	//Y POSITION
	//General calculations
	if (_gapY <= yMargin and following.currentState != states.crouch)
	{
		//wave or dance
		y = lerp(y, _yTo + yMargin*dsin(time), ySpeed);
	}
	else
	{
		//keep track to player
		y = lerp(y, _yTo, ySpeed);
	}
	
	//crouch state
	if (following.currentState == states.crouch)
	{
		ySpeed = ySpeed*3;
		_yTo = _yTo + 24;
		y = lerp(y, _yTo, ySpeed);
			
	}




	
}