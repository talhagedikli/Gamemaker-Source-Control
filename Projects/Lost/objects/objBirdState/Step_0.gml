player_inputs();

//positions of following objects
var _fX = following.x;
var _fY = following.y;

xSpeed		= 0.05;
ySpeed		= 0.03;

//positions of where it is going to
var _xTo = _fX - following.facing*15;
var _yTo = _fY - 25;

//distance between following object and object we seek
var _gapX = abs(x - _xTo);
var _gapY = abs(y - _yTo);

//distance between following object and the object
var _disX = abs(x - _fX);
var _disY = abs(y - _fY);


//range circle
//var _inRange = collision_circle(x, y - sprite_yoffset/2, 25, following, false, true);

switch (state)
{
	case states.seek:
		if (instance_exists(following))
		{
			//X POSITION
			if (_gapX < epsilon) 
			{
				stopX = true;
			}
		
			if (_disX > 24)
			{
				stopX = false;
			}
		
			if (stopX == false) 
			{	
				x = lerp(x, _xTo, xSpeed);
			}

			//Y POSITION
		
			y = lerp(y, _yTo, ySpeed);
		
			if (following.currentState == states.crouch)
			{
				targetY = _yTo + 24;
				nextState = states.vertwave;
				state = states.swappos;
				
			}
		
			if (_gapY <= epsilon and _disX < 24)
			{
				time = 0;
				state = states.vertwave;
			}

		}
	break;
	
	case states.swappos:
		_yTo = targetY;
		_gapX = abs(x - _xTo);
		_gapY = abs(y - _yTo);
		
		ySpeed = 0.1;
		
		if (_gapY >= epsilon)							y = lerp(y, _yTo, ySpeed);
		else											state = states.vertwave;
		//
		if (following.currentState != states.crouch)	state = states.seek;
			
	break;
	
	case states.vertwave:
		_gapX = abs(x - _xTo);
		_gapY = abs(y - _yTo);
		
		if (_disX > 24) 
		{
			state = states.seek;
		}
		if (following.currentState != states.crouch)	
		{
			nextState = states.seek;
			targetY = _yTo;
			state = states.swappos;
		}
		time += 2;
		time = time mod 360;
		
		y = lerp(y, _yTo + yMargin*dsin(time), ySpeed);
		
	break;
	
}

