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

dashDir			= 1;

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




#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions
// Array sorting functions


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
state = "move";
changed = true;

//array_push(wepons, new Single());
//array_push(wepons, new Triple());
//array_push(wepons, new Sphere());
//array_push(wepons, new Tornado());
//wepon			= wepons[weponIndex];


#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
xxx = new SnowState("move");
xxx.add("move", {
	enter: function()
	{
		exhaustTimer.start(10);
	},
	step: function()
	{
		updateShipDir();
	 	updateShipSpeed();
	 	motion = clamp(motion, - maxSpd, maxSpd);
	 	if (abs(InputManager.keyUp))
	 	{
			exhaustTimer.on_timeout(function()
			{
	 			part_particles_create_color(global.psEffects, x, y, global.ptExhaust, c_fuchsia, 1);
				exhaustTimer.reset();
			});
			exhaustTimer.run();
	 	}
	 	// Shooting
	 	//if (InputManager.keyShootPressed)
	 	//{
	 	//	shootTimer.start(wepon.delay);
	 	//	shooting = true;
	 	//	wepon.use();
	 	//}
	 	//else if (InputManager.keyShoot)
	 	//{
	 	//	shootTimer.on_timeout(function()
	 	//	{
	 	//		wepon.use();
	 	//		shootTimer.reset();
	 	//	});
	 	//}
	 	//else
	 	//{
	 	//	shootTimer.stop();
	 	//	shooting = false;
	 	//}
	 	// Cycle wepons
	 	if (InputManager.keySwitchPressed)
	 	{
	 		//weponIndex++;

	 		//weponIndex = weponIndex mod array_length(wepons);
	 	}
	 	// Dash state
	 	if (InputManager.keyDash)
	 	{
			dashDir = InputManager.verticalInput != 0 ? -InputManager.verticalInput : dashDir;
			xxx.change("dash");
	 	};

	 	shipAngle	+= shipDir;
	 	image_angle = floor(shipAngle);
	 	x += lengthdir_x(motion, shipAngle);
	 	y += lengthdir_y(motion, shipAngle);
	}
});
xxx.add("dash", {
	enter: function()
	{
		ghostTimer.start(5);
	},
	step: function()
	{
	 	motion = approach(motion, dashDir * maxSpd * 2, accel * 2);
	 	motion = clamp(motion, - maxSpd * 2, maxSpd * 2);
	 	ghostTimer.on_timeout(function()
	 	{
	 		part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
	 		part_particles_create(global.psEffects, x, y, global.ptGhostDash, 1);
	 		ghostTimer.reset();
	 	});
		ghostTimer.run();
		part_type_gravity(global.ptExhaust, 0.1, shipAngle - 180);
	 	x += lengthdir_x(motion, shipAngle);
	 	y += lengthdir_y(motion, shipAngle);
	 	if (!InputManager.keyDash)
	 	{
	 		ghostTimer.stop();
	 		shipDir = 0;
	 		motion	= dashDir * maxSpd;
			xxx.change("move");
	 	};			
	}
});
#endregion //-------------------------------------------------------------------
Camera.following = self;

