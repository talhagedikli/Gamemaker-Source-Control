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
	if (InputManager.p1.keyRight)
	{
		shipDir = flerp(shipDir, -maxSpd, angleAccel);
	}
	else if (InputManager.p1.keyLeft)
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
	if (InputManager.p1.keyUp)
	{
		motion = approach(motion, maxSpd, accel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
		part_type_gravity(global.ptBolis, 0.05, shipAngle - 180);
	}
	else if (InputManager.p1.keyDown)
	{
		motion = approach(motion, -minSpd, accel);
	}
	else
	{
		motion = approach(motion, 0, decel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
		part_type_gravity(global.ptBolis, 0.05, shipAngle - 180);
	}
}

switchWepon = function()
{
	if (InputManager.p1.keySwitchPressed)
	{
	 	weponIndex++;
	 	weponIndex	= weponIndex mod array_length(wepons);
	 	wepon		= wepons[weponIndex];
	}	
}
state = "move";
changed = true;

array_push(wepons, new Single());
array_push(wepons, new Triple());
array_push(wepons, new Sphere());
array_push(wepons, new Tornado());
wepon			= wepons[weponIndex];


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
	 	if (abs(InputManager.p1.keyUp))
	 	{
			exhaustTimer.on_timeout(function()
			{
	 			part_particles_create_color(global.psEffects, x, y, global.ptExhaust, c_fuchsia, 1);
				exhaustTimer.reset();
			});
			exhaustTimer.run();
	 	}
	 	 //Shooting
	 	//if (InputManager.p1.keyShootPressed && !shooting) xxx.change("shoot");
	 	if (InputManager.p1.keyShootPressed && !shooting)
	 	{
	 		shootTimer.start(wepon.delay);
			wepon.use();
			shooting = true;
	 	}
	 	else if (InputManager.p1.keyShoot)
	 	{
	 		shootTimer.on_timeout(function()
	 		{
	 			wepon.use();
	 			shootTimer.reset();
	 			shooting = false;
	 		});
			shootTimer.run();
	 	}
	 	else
	 	{
	 		shootTimer.stop();
	 	}
	 	// Cycle wepons
		switchWepon();
	 	// Dash state
	 	if (InputManager.p1.keyDash)
	 	{
			dashDir = InputManager.p1.verticalInput != 0 ? -InputManager.p1.verticalInput : dashDir;
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
	 		part_type_sprite(global.ptGhostDash, sprite_index, false, false, false);
	 		part_particles_create(global.psEffects, x, y, global.ptGhostDash, 1);
	 		part_particles_create(global.psEffects, random_range(0, room_width),
						irandom_range(0, room_height), global.ptBolis, 1);
			ghostTimer.reset();
	 	});
		ghostTimer.run();
		part_type_gravity(global.ptBolis, 0.1, shipAngle - 180);

	 	x += lengthdir_x(motion, shipAngle);
	 	y += lengthdir_y(motion, shipAngle);
	 	if (!InputManager.p1.keyDash)
	 	{
	 		ghostTimer.stop();
	 		shipDir = 0;
	 		motion	= dashDir * maxSpd;
			xxx.change("move");
	 	};			
	}
});
xxx.add("shoot", {
	enter: function()
	{
	 		shootTimer.start(wepon.delay);
			wepon.use();
			shooting = true;
	},
	step: function()
	{
		updateShipDir();
	 	updateShipSpeed();
		switchWepon();
	 	motion = clamp(motion, - maxSpd, maxSpd);
		shootTimer.on_timeout(function()
	 	{
			if (!InputManager.p1.keyShoot) 
			{
				xxx.change("move", function()
				{
					shootTimer.stop();
					shooting = false;
				});
			}
			else
			{
				wepon.use();
		 		shootTimer.reset();
			}
	 	});
		shootTimer.run();
		shipAngle	+= shipDir;
	 	image_angle = floor(shipAngle);
		x += lengthdir_x(motion, shipAngle);
	 	y += lengthdir_y(motion, shipAngle);
	}
});
#endregion //-------------------------------------------------------------------
Camera.following = self;

