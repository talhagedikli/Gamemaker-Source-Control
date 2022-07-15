if (state == PlayerStates.idle)
{
	var _horizontalInput	= INPUT.horizontalInput;// Will be -1, 0 or 1
	var _verticalInput		= INPUT.verticalInput;
	var _keyShoot			= INPUT.keyShoot;
	var _pdir = point_direction(x, y, mouse_x, mouse_y);

	var _mdir = point_direction(0, 0, _horizontalInput, _verticalInput);
	var _xto, _yto;


	if (abs(_horizontalInput) || abs(_verticalInput))
	{
		spd = approach(spd, spdMax, accel);
		facing = sign(_horizontalInput);
	}
	else
	{
		spd = approach(spd, 0, accel);
	}
	if (spd != 0)	moving = true;
	else			moving = false;
	
	_xto = lengthdir_x(spd, _mdir);
	_yto = lengthdir_y(spd, _mdir);

	changeWepon();
	//depth = -y;
	// image_angle = _pdir;
	// direction = _pdir;
	//var _jiggle = 0.4;
	//light.x = x + random_range(-_jiggle, _jiggle);
	//light.y = y + random_range(-_jiggle, _jiggle);
	x += _xto;
	y += _yto;		
}

