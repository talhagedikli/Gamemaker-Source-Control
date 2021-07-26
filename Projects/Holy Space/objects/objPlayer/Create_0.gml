#region Create -----------------------------------------------------------------
// Init
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
animation_init();
//speed variables
shipAngle		= 0;
shipDir			= 0;
motion			= 0;
maxSpd			= 3;
minSpd			= 1;
accel			= 0.12;
decel			= 0.05;
angleAccel		= 0.2;
angleDecel		= 0.07;
shootTimer		= new Timer();
shootDelay		= 10;

// Inventory
hpMax			= 5;
hp				= hpMax;
showInv			= false;

// Attack 
colliding		= noone;

// Area and distance
enum DIR 
{
	RIGHT,
	UP,
	LEFT,
	DOWN
}

//show(dirfind(area));
touching		= false;
exhaustTimer	= new Timer();
ghostTimer		= new Timer();
wepons			= [];
weponIndex		= 0;
// Particles
//ptExhaust = part_type_create();
//part_type_shape(ptExhaust, pt_shape_pixel);
//part_type_life(ptExhaust, 30, 40);
//part_type_scale(ptExhaust, 1.5, 1.5);
//part_type_alpha3(ptExhaust, 0.7, 1, 0);
//part_type_gravity(ptExhaust, 0.05, shipAngle - 180);	// Dynamic


#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions
// Wepon constructor


	

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
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
	}
	else if (InputManager.keyDown)
	{
		motion = approach(motion, -minSpd, accel);
	}
	else
	{
		motion = approach(motion, 0, decel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
	}
}

/// @func shoot()
shoot = function()
{
	var b = instance_create_layer(x, y, layer, objBullet);
	b.direction		= image_angle;
	b.image_angle	= image_angle;
	b.speed			= maxSpd + motion;
}
/// @func tripleShot()
tripleShot = function()
{
	var b1 = instance_create_layer(x, y, layer, objBullet);
	var b2 = instance_create_layer(x, y, layer, objBullet);
	var b3 = instance_create_layer(x, y, layer, objBullet);
	b1.direction		= image_angle;
	b1.image_angle		= image_angle;
	b1.speed			= maxSpd  + motion;	
	b2.direction		= image_angle + 30;
	b2.image_angle		= image_angle + 30;
	b2.speed			= maxSpd  + motion;	
	b3.direction		= image_angle - 30;
	b3.image_angle		= image_angle - 30;
	b3.speed			= maxSpd + motion;
}

array_push(wepons, new Single());
array_push(wepons, new Triple());
wepon			= wepons[weponIndex];


#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
state = new SnowState("move");

state.history_enable();
state.set_history_max_size(15);
state.event_set_default_function("init", function() 
{
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
});

state.add("move", {
	enter: function() 
	{
		exhaustTimer.start(10);
	},
	step: function()
	{
		updateShipDir();
		updateShipSpeed();
		motion = clamp(motion, - maxSpd, maxSpd);

		exhaustTimer.on_timeout(function()
		{
			part_particles_create_color(global.partSystem, x, y, global.ptExhaust, c_blue_hosta, 1);
			exhaustTimer.reset();
		});
		// Shooting
		if (InputManager.keyShootPressed)
		{
			shootTimer.start(shootDelay);
			wepon.use();
		}
		else if (InputManager.keyShoot)
		{
			shootTimer.on_timeout(function()
			{
				wepon.use();
				shootTimer.reset();
			});
		}
		else
		{
			shootTimer.stop();
		}
		if (InputManager.keySwitchPressed)
		{
			weponIndex++;
			weponIndex = weponIndex mod array_length(wepons);
		}
		wepon = wepons[weponIndex];
		// Dash state
		if (InputManager.keyDash) state.change("dash", function()
		{
			exhaustTimer.stop();
		});
		shipAngle	+= shipDir;
		image_angle = floor(shipAngle);
		x += lengthdir_x(motion, shipAngle);
		y += lengthdir_y(motion, shipAngle);
	}
	
});

state.add("dash", {
	enter: function() 
	{
		ghostTimer.start(5);
	},
	step: function() 
	{
		motion = approach(motion, maxSpd * 2, accel * 2);
		motion = clamp(motion, - maxSpd * 2, maxSpd * 2);
		ghostTimer.on_timeout(function()
		{
			part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
			part_particles_create(global.partSystem, x, y, global.ptGhostDash, 1);
			ghostTimer.reset();
		});
		x += lengthdir_x(motion, shipAngle);
		y += lengthdir_y(motion, shipAngle);
		if (!InputManager.keyDash) state.change("move", function()
		{
			ghostTimer.stop();
			shipDir = 0;
			motion	= maxSpd;
		});
	},
	leave: function()
	{
		// Code here
	}
});

state.add("shoot", {
	enter: function() 
	{
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


#endregion //-------------------------------------------------------------------

Camera.following = self;

global.clock.variable_interpolate("x", "iotaX");
global.clock.variable_interpolate("y", "iotaY");

global.clock.add_cycle_method(function() {
	
});

