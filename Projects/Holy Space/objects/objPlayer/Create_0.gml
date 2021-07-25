#region Create -----------------------------------------------------------------
// Init
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
animation_init();
//speed variables
shipAngle	= 0;
shipDir		= 0;
motion		= 0;
maxSpd		= 3;
minSpd		= 1;
accel		= 0.12;
decel		= 0.05;
angleAccel	= 0.2;
angleDecel	= 0.1;

// Inventory
hpMax		= 5;
hp			= hpMax;
inventory	= ["talha", "bera", "yasir"];
showInv		= false;

// Attack 
colliding	= noone;

// Area and distance
enum DIR 
{
	RIGHT,
	UP,
	LEFT,
	DOWN
}

//show(dirfind(area));
collisions	= ds_list_create();
touching	= false;

// Particles
ptExhaust = part_type_create();
part_type_shape(ptExhaust, pt_shape_pixel);
part_type_life(ptExhaust, 30, 40);
part_type_scale(ptExhaust, 1.5, 1.5);
part_type_alpha3(ptExhaust, 0.7, 1, 0);
part_type_gravity(ptExhaust, 0.05, shipAngle - 180);	// Dynamic


#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions

// Array sorting functions
typeSort	= function(_a, _b)
{
	return _a.type - _b.type;
}

/// @func updateShipDir()
updateShipDir = function()
{
	if (InputManager.keyRight)
	{
		shipDir = flerp(shipDir, -maxSpd, angleAccel);
	}
	else if (InputManager.keyLeft)
	{
		shipDir = flerp(shipDir, maxSpd, angleAccel);
	}
	else
	{
		shipDir = flerp(shipDir, 0, angleDecel);
	}	
}

/// @func updateShipSpeed()
updateShipSpeed = function()
{
	if (InputManager.keyUp)
	{
		motion = approach(motion, maxSpd, accel);
		part_type_gravity(ptExhaust, 0.05, shipAngle - 180);
	}
	else if (InputManager.keyDown)
	{
		motion = approach(motion, -minSpd, accel);
	}
	else
	{
		motion = approach(motion, 0, decel);
		part_type_gravity(ptExhaust, 0.05, shipAngle - 180);
	}
}

#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
state = new SnowState("idle");

state.history_enable();
state.set_history_max_size(15);
state.event_set_default_function("init", function() 
{
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
});

state.add("idle", {
	enter: function() 
	{
		DoLater(10, function(data)
		{
			part_particles_create(global.partSystem, x, y, ptExhaust, 1);
		}, noone, false);
	},
	step: function()
	{
		updateShipDir();
		updateShipSpeed();
		shipAngle += shipDir;
		image_angle = shipAngle;
		direction = image_angle;
		x += lengthdir_x(motion, shipAngle);
		y += lengthdir_y(motion, shipAngle);
	}
});

// var arr = [0, 1, 2];
// var m = 2;
// foreach(arr as (val, ind)
// {
// 	show(val * m);
// })
	
state.add("move", {
	enter: function() 
	{
		DoLater(moveDur*4/5, function(data)
		{
			// Code
			show(data.msg);
		},
		{ 
			nextState	: "attack",
			msg		 	: "nothing"
		}, true);
		
		//alarm[0] = moveDur*4/5;			// 10
	},
	step: function() 
	{
		// Code here
	},
	leave: function()
	{
		// Code here
	}
});

state.add("attack", {
	enter: function()
	{
		// Code here
	},
	step: function()
	{
		// Code here
	}
});

#endregion //-------------------------------------------------------------------

Camera.following = self;

global.clock.variable_interpolate("x", "iotaX");
global.clock.variable_interpolate("y", "iotaY");

global.clock.add_cycle_method(function() {
	
});

