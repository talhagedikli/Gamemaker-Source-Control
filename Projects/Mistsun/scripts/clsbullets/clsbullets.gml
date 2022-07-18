// Feather disable GM1013
// Feather disable GM1010
// Feather disable GM1043

function Bullet() constructor
{
	#region INITIALIZE
	instance_index = instanceof(self);
	spd				= undefined;
	spdMax			= undefined;
	spdIncrease		= undefined;
	knockbackPower	= undefined;
	knocbackTime	= undefined;
	#endregion
	
	#region EVENTS
	Create = function()
	{
		var m = function()
		{
			instance_destroy();
		}
		destroyTimer = time_source_create(time_source_game, 60*2, time_source_units_frames, m);
		time_source_start(destroyTimer);		
	}
	
	Step = function()
	{
		spd += spdIncrease;

		var _xto = lengthdir_x(spd, direction);
		var _yto = lengthdir_y(spd, direction);

		x +=_xto;
		y +=_yto;

		image_xscale = max(1, spd/sprite_width);
	}
	
	Destroy = function()
	{
		time_source_destroy(destroyTimer);	
	}
	#endregion
}

function SmallBullet() : Bullet() constructor
{
	#region INITIALIZE
	sprite_index	= sprSmallBullet;
	spd				= 10;
	spdIncrease		= 1;
	knockbackPower	= 20;
	knocbackTime	= 3;
	#endregion
	
	#region EVENTS
	__inheritedStep = Step;
	Step = function()
	{
		__inheritedStep();	// Inherited from parent constructor
		var _inst = instance_place(x, y, objEnemyParent);
		if (_inst != noone)
		{
			_inst.knockbackDir		= image_angle;
			_inst.knockbackPower	= knockbackPower;
			_inst.knocbackTime		= knocbackTime;
			_inst.state				= EnemyStates.knockback;
			instance_destroy();
		}		
	}
	#endregion
}