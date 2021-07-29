#region Create -----------------------------------------------------------------
// Init
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
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
fadeOut			= false;
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
shooting		= false;

state			= "move";
changed			= true;

change = function(target, func)
{
	func();
	state = target;
	changed = true;
}

init	= function(func)
{
	if (changed)
	{
		func();
		changed = false;
	}
}

#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions
// Array sorting functions
typeSort	= function(_a, _b)
{
	return _a.type - _b.type;
}

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


array_push(wepons, new Single());
array_push(wepons, new Triple());
array_push(wepons, new Sphere());
array_push(wepons, new Tornado());
wepon			= wepons[weponIndex];


#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
//state = new SnowState("move");

//state.add("move", {
//	enter: function() 
//	{
//		exhaustTimer.start(10);
//	},
//	step: function()
//	{
//		updateShipDir();
//		updateShipSpeed();
//		motion = clamp(motion, - maxSpd, maxSpd);
//		exhaustTimer.on_timeout(function()
//		{
//			if (abs(InputManager.keyUp))
//			{
//				part_particles_create_color(global.partSystem, x, y, global.ptExhaust, c_fuchsia, 1);
//			}
//			exhaustTimer.reset();
//		});
//		// Shooting
//		if (InputManager.keyShootPressed)
//		{
//			shootTimer.start(wepon.delay);
//			shooting = true;
//			wepon.use();
//		}
//		else if (InputManager.keyShoot)
//		{
//			shootTimer.on_timeout(function()
//			{
//				wepon.use();
//				shootTimer.reset();
//			});
//		}
//		else
//		{
//			shootTimer.stop();
//			shooting = false;
//		}
//		// Cycle wepons
//		if (InputManager.keySwitchPressed)
//		{
//			weponIndex++;
//			weponIndex = weponIndex mod array_length(wepons);
//		}
//		wepon = wepons[weponIndex];
//		// Dash state
//		if (InputManager.keyDash) state.change("dash", function()
//		{
//			exhaustTimer.stop();
//		});

//		shipAngle	+= shipDir;
//		image_angle = floor(shipAngle);
//		x += lengthdir_x(motion, shipAngle);
//		y += lengthdir_y(motion, shipAngle);
//	}
	
//})

//.add("dash", {
//	enter: function() 
//	{
//		ghostTimer.start(5);
//	},
//	step: function() 
//	{
//		motion = approach(motion, maxSpd * 2, accel * 2);
//		motion = clamp(motion, - maxSpd * 2, maxSpd * 2);
//		ghostTimer.on_timeout(function()
//		{
//			part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
//			part_particles_create(global.partSystem, x, y, global.ptGhostDash, 1);
//			ghostTimer.reset();
//		});
//		x += lengthdir_x(motion, shipAngle);
//		y += lengthdir_y(motion, shipAngle);
//		if (!InputManager.keyDash) state.change("move", function()
//		{
//			ghostTimer.stop();
//			shipDir = 0;
//			motion	= maxSpd;
//		});
//	},
//	leave: function()
//	{
//		// Code here
//	}
//});

//state.add("death", {
//	enter: function() 
//	{
		
//	},
//	step: function() 
//	{
//		motion			= 0;
//		image_angle		= image_angle;
//		image_alpha -= 0.01;
//		if (image_alpha <= 0)
//		{
//			instance_destroy();
//		}
//	},
//	leave: function()
//	{
//		// Code here
//	}
//});


#endregion //-------------------------------------------------------------------

Camera.following = self;

