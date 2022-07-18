// Feather disable GM1013
// Feather disable GM1010
// Feather disable GM1009
// Feather disable GM1043


function Wepon() constructor
{
	#region INIT
	instance_index	= instanceof(self);
	sprite_index	= undefined;
	image_xscale	= 1;
	image_yscale	= 1;
	owner			= instance_exists(objPlayer) ? objPlayer.id : noone;
	ptAttack		= part_type_create();	// Must be cleaned
	attackSound		= undefined;
	state			= WeponStates.idle;
	facing			= 1;

	//effectsArray = [];
	//array_push(effectsArray, ptAttack);
	
	// Methods
	stateChange = function(_state)
	{
		self.state = _state;
	}
	getState = function()
	{
		return self.state;
	}
	drawSelf = function()
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	#endregion
	
	#region STATES
	idle			= function() { };
	reload			= function() { };
	attack			= function() { };
	#endregion

	#region EVENTS
	Create = function()
	{

	}
	Draw = function()
	{
		// drawSelf();
	}
	Step = function()
	{
		if (state == WeponStates.idle)
		{
			self.idle();
		}
		else if (state == WeponStates.reload)
		{
			self.reload();
		}
		else if (state == WeponStates.attack)
		{
			self.attack();	
		}
	}
	Cleanup = function()
	{
		part_type_destroy(ptAttack);
	}
	#endregion
}

function Gun()		: Wepon() constructor
{
	#region INIT
	numofBullets	= undefined;
	bulletSpread	= undefined;
	
	recoilPower		= undefined;
	recoilAngle		= undefined;
	
	attackSound		= undefined;
	reloadSound		= undefined;
	
	reloadTime		= 15;
	reloadTween = new Tween(TweenType.QuartEaseOut, 0, 0, reloadTime);
	
	runningLoopDurMin		= 30;
	runningLoopDurMax		= 90;
	runningLoopMarginMax	= 2; // Means animcurvevalue*value
	runningLoopMarginMin	= 0.8; // Means animcurvevalue*value
	runningCurve			= new Animcurve(acGuns, "running", runningLoopDurMax);
	runningCurve.start();
	
	heatTime		= 0;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	
	// Methods
	playSound = function(_soundid, _priority, _loop, _pitchRange)
	{
		if (_soundid != undefined)
		{
			var _snd = audio_play_sound(_soundid, _priority, _loop);	
			audio_sound_pitch(_snd, _pitchRange);
		}		
	}
	playAttackSound		= function()
	{
		if (attackSound != undefined)
		{
			var _snd = audio_play_sound(attackSound, 5, false);	
			audio_sound_pitch(_snd, random_range(0.9, 1.1));
		}
	}
	playReloadSound		= function()
	{
		if (reloadSound != undefined)
		{
			var _snd = audio_play_sound(reloadSound, 5, false);	
			audio_sound_pitch(_snd, random_range(0.9, 1.1));
		}
	}
	walkingEffect		= function()	// #Optimize
	{
		if (runningCurve.isFinished())
		{
			runningCurve.reset();
			runningCurve.start();
		}
		else
		{
			var _dur = runningCurve.getDuration();
			if (owner.moving == true) 
			{
				if (_dur != runningLoopDurMin) 
				{
					runningCurve.reset();
					runningCurve.setDuration(runningLoopDurMin);
					runningCurve.start();
					
				}
			}
			else 
			{
				if (_dur != runningLoopDurMax)
				{
					runningCurve.reset();
					runningCurve.setDuration(runningLoopDurMax);
					runningCurve.start();
				}
			}			
		}

		y += owner.moving == true ? runningLoopMarginMax*runningCurve.getValue() : runningLoopMarginMin*runningCurve.getValue();		
	}
	followOwner			= function()
	{
		var _gunFacingX = sign(mouse_x-owner.x);
		var _gunFacingY = sign(mouse_y-owner.y);
	
		var _margin = 8;
		var _x = owner.x + facing*(sprite_width*0.15) + owner.spd*real(INPUT.horizontalInput);
		var _y = owner.y - owner.sprite_height*0.25 + owner.spd*real(INPUT.verticalInput);
		x = lerp(x, _x, 0.4);
		y = lerp(y, _y, 0.4);
		
	}
	faceMouse			= function()
	{
		var _pdir = point_direction(owner.x, owner.y, mouse_x, mouse_y);
		var _gdir = point_direction(x, y, mouse_x, mouse_y);
		image_angle = _gdir;
		direction	= image_angle;
		if (_pdir<90 || _pdir>270)
		{
			facing = 1;
		}
		else
		{
			facing = -1;
		}
		image_yscale = facing;		
	}
	createAttackEffect	= function()
	{
		var _x = x + lengthdir_x(sprite_width*1.5, image_angle);	
		var _y = y + lengthdir_y(sprite_height*1.5, image_angle);
		var _m = 5;
		// part_type_direction(ptAttack, 80, 100, 0, 0);
		// part_type_speed(ptAttack, 0.5, 1.2, -0.01, 0);
		part_type_gravity(ptAttack, 0.05, random_range(image_angle-_m, image_angle+_m)+90*facing);
		//part_particles_create(global.PSEffects, _x, _y, ptAttack, 1);
	}
	shoot				= function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	recoil				= function() 
	{
		var _recoilAngle = random_range(image_angle-160, image_angle-200);
		var _power = random_range(recoilPower*0.8, recoilPower);
		x += lengthdir_x(_power, _recoilAngle);
		y += lengthdir_y(_power, _recoilAngle);	
	}
	#endregion
	
	#region STATES
	idle			= function() 
	{
		faceMouse();
		followOwner();
		walkingEffect();
		
		// Change State
		var _tsstate = time_source_get_state(heatTimer);
		if (INPUT.keyShoot && (_tsstate == time_source_state_initial || _tsstate == time_source_state_stopped))
		{
			stateChange(WeponStates.attack);
		}
		if (INPUT.keyReloadPressed)
		{
			reloadTween.start(image_angle, image_angle + 360);
			playReloadSound();
			stateChange(WeponStates.reload);	
		}
	}
	reload = function()
	{
		if (reloadTween.getState() != time_source_state_stopped)
		{
			image_angle = reloadTween.getValue();
			direction = image_angle;			
		}
		else
		{
			reloadTween.reset();
			stateChange(WeponStates.idle);
		}
		followOwner();
	}
	attack = function()
	{
		var _tstate = time_source_get_state(heatTimer);
		if (_tstate == time_source_state_initial)
		{
			shoot();
			recoil();
			// playAttackSound();
			playSound(sndPistolShot, 5, false, random_range(0.9, 1.1));
			createAttackEffect();
			time_source_start(heatTimer);
		}
		else if (_tstate == time_source_state_stopped)
		{
			time_source_reset(heatTimer);
		}
		followOwner();
		faceMouse();
		
		// Change state
		if (!INPUT.keyShoot)
		{
			stateChange(WeponStates.idle);
		}
		if (INPUT.keyReloadPressed)
		{
			reloadTween.start(image_angle, image_angle + 360);
			playReloadSound();
			stateChange(WeponStates.reload);	
		}
	}
	#endregion
	
	#region EVENTS
	// There will be events
	#endregion
}

function Pistol()	: Gun() constructor
{
	#region INIT
	sprite_index = sprPistol;
	
	heatTime		= 15;
	bulletSpread	= 2;
	numofBullets	= 1;
	recoilPower			= 5;
	attackSound		= sndPistolShot;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	part_type_shape(ptAttack, pt_shape_pixel);
	part_type_life(ptAttack, 10, 50);
	part_type_size(ptAttack, 3, 5, -0.1, 0);
	part_type_color2(ptAttack, c_gray, c_dkgray);
	part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);
	
	// Methods
	shoot = function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	#endregion
	
	#region STATES

	#endregion
	
	#region EVENTS
	// There will be events of this object
	#endregion
}

function Shotgun()	: Gun() constructor
{
	#region INIT
	// Variables
	sprite_index = sprShotgun;
	
	bulletSpread = 7;
	heatTime = 45;
	recoilPower = 7;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	numofBullets = 3;
	part_type_shape(ptAttack, pt_shape_pixel);
	part_type_life(ptAttack, 10, 50);
	part_type_size(ptAttack, 3, 5, -0.1, 0);
	part_type_color2(ptAttack, c_gray, c_dkgray);
	part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);
	
	// Methods
	shoot = function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	#endregion
	
	#region STATES

	#endregion
	
	#region EVENTS
	// There will be events
	#endregion
}

function Thompson()	: Gun() constructor
{
	#region INIT
	// Variables
	sprite_index = sprThompson;
	
	recoilPower = 3;
	bulletSpread = 3;
	heatTime = 6;
	numofBullets = 1;
	attackSound = sndThompsonShot;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	part_type_shape(ptAttack, pt_shape_pixel);
	part_type_life(ptAttack, 10, 50);
	part_type_size(ptAttack, 3, 5, -0.1, 0);
	part_type_color2(ptAttack, c_gray, c_dkgray);
	part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);
	
	// Methods
	shoot = function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	#endregion
	
	#region STATES
	
	#endregion
	
	#region EVENTS
	// There will be events
	#endregion
}

function Rifle()	: Gun() constructor
{
	#region INIT
	// Variables
	sprite_index = sprRifle;
	recoilPower = 30;
	bulletSpread = 1;
	heatTime = 60;
	numofBullets = 1;
	attackSound = sndThompsonShot;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	part_type_shape(ptAttack, pt_shape_pixel);
	part_type_life(ptAttack, 10, 50);
	part_type_size(ptAttack, 3, 5, -0.1, 0);
	part_type_color2(ptAttack, c_gray, c_dkgray);
	part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);
	
	// Methods
	shoot = function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	#endregion
	
	#region STATES
	
	#endregion
	
	#region EVENTS
	// There will be events
	#endregion
}

function Crossbow()	: Gun() constructor
{
	#region INIT
	// Variables
	sprite_index = sprRifle;
	recoilPower = 25;
	bulletSpread = 1;
	heatTime = 50;
	numofBullets = 1;
	attackSound = sndThompsonShot;
	heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
	});
	part_type_shape(ptAttack, pt_shape_pixel);
	part_type_life(ptAttack, 10, 50);
	part_type_size(ptAttack, 3, 5, -0.1, 0);
	part_type_color2(ptAttack, c_gray, c_dkgray);
	part_type_alpha3(ptAttack, 0.7, 0.9, 0.2);
	
	// Methods
	shoot = function()
	{
		repeat (numofBullets)
		{
			var _x			= x + lengthdir_x(sprite_width, image_angle);
			var _y			= y + lengthdir_y(sprite_width, image_angle);
			var _b			= instance_create_layer(_x, _y, "Bullets", objBulletClass, new SmallBullet());
			_b.image_angle	= random_range(image_angle-bulletSpread, image_angle+bulletSpread);
			_b.direction	= _b.image_angle;
		}
	}
	#endregion
	
	#region STATES

	#endregion
	
	#region EVENTS
	// There will be events
	#endregion
}






























/*
function Sword() : Wepon() constructor
{
	#region INIT
	// Variables
	sprite_index	= sprSword;
	facing			= 1;
	heatTime		= 10;
	attackAngle		= 60;
	attacking		= false;
	position		= 1;
	angleTween		= new Tween(TweenType.QuartEaseOut, 0, 0, heatTime, false);
	heatTimer		= time_source_create(time_source_game, heatTime, time_source_units_frames, function()
	{
		time_source_reset(self.heatTimer);
	});	
	
	// Methods
	followOwner = function()
	{
		var _marginx = lengthdir_x(owner.sprite_width*0.3, image_angle);
		var _marginy = lengthdir_y(owner.sprite_height*0.3, image_angle);
		var _x = owner.x + owner.spd*real(INPUT.horizontalInput) + _marginx;
		var _y = owner.y - owner.sprite_height*0.25 + _marginy;
		x = lerp(x, _x, 0.2);
		y = lerp(y, _y, 0.2);	
	}
	
	shootEffect = function(_num)
	{
		var _x = x + lengthdir_x(sprite_width*1.5, image_angle);	
		var _y = y + lengthdir_y(sprite_height*1.5, image_angle);
		
		part_type_direction(ptAttack, 80, 100, 0, 0);
		part_type_speed(ptAttack, 0.5, 1.2, -0.01, 0);
		// part_particles_create(global.PSEffects, _x, _y, ptAttack, _num);
	}
	#endregion
	
	#region STATES
	idle = function()
	{
		var _horizontalInput	= INPUT.horizontalInput;// Will be -1, 0 or 1
		var _verticalInput		= INPUT.verticalInput;
		var _keyShoot			= INPUT.keyShoot;
		var _pdir = point_direction(x, y, mouse_x, mouse_y);
		
	
		// var _ta = _pdir + swingAngle*facin ?
		if (_pdir<90 || _pdir>270) 
		{
			position = 1;
		}
		else
		{
			position = -1;
		}
		
		image_angle = _pdir + position*facing*attackAngle;
		direction = image_angle;
		
		followOwner();
		
		if (INPUT.keyShoot)
		{
			facing *= -1;
			angleTween.start(image_angle, _pdir+position*facing*attackAngle);
			stateChange(WeponStates.attack);
		}
	}
	
	
	attack = function()
	{
		var _horizontalInput	= INPUT.horizontalInput;// Will be -1, 0 or 1
		var _verticalInput		= INPUT.verticalInput;
		var _keyShoot			= INPUT.keyShoot;
		var _pdir				= point_direction(x, y, mouse_x, mouse_y);
		
		image_angle = angleTween.getValue();
		direction = image_angle;
		
		followOwner();
		
		if (angleTween.isFinished())
		{
			angleTween.reset();
			stateChange(WeponStates.idle);
		}
	}
	#endregion
	
	#region EVENTS
	#endregion
}
*/

