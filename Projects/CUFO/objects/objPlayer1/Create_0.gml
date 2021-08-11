#region Create -----------------------------------------------------------------
// Init test
audio_listener_set_position(0, x, y, 0);
audio_listener_set_orientation(0, 0, 1, 0, 0, 0, 1);
//speed variables
// Motion
motion			= new Vector2(0, 0);
maxSpd			= 3;
minSpd			= 2;
accel			= 0.3;
decel			= 0.2;
// Angle
angleAccel		= 0.2;
angleDecel		= 0.07;
shipAngle		= 0;
shipDir			= new Vector2(0, 0);
// Dash
dashDir			= new Vector2(1, 0);
dashTween		= new Tween(TWEENTYPE.CIRCEASEOUT);
dashBuffer		= 2;
dashDurMax		= 120;
dashDur 		= dashDurMax;
dashRate		= dashDur / dashDurMax;
dashType		= "pressDash";
canDash			= false;
// Shoot
shootTimer		= new Timer();
shootDelay		= 10;
wepons			= [];
weponIndex		= 0;
shooting		= false;
// Self
hpMax			= 5;
hp				= hpMax;
showInv			= false;
fadeOut			= false;

exhaustTimer	= new Timer();
ghostTimer		= new Timer();


#endregion----------------------------------------------------------------------

#region Functions --------------------------------------------------------------
// Distance and area functions
// Array sorting functions


updateShipSpeed = function()
{
	if (InputManager.p1.keyDown)
	{
		motion.y = approach(motion.y, maxSpd, accel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
		part_type_gravity(global.ptBolis, 0.05, shipAngle - 180);
	}
	else if (InputManager.p1.keyUp)
	{
		motion.y = approach(motion.y, -maxSpd, accel);
	}
	else
	{
		motion.y = approach(motion.y, 0, decel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
		part_type_gravity(global.ptBolis, 0.05, shipAngle - 180);
	}
	
	if (InputManager.p1.keyRight)
	{
		motion.x = approach(motion.x, maxSpd, accel);
		part_type_gravity(global.ptExhaust, 0.05, shipAngle - 180);
		part_type_gravity(global.ptBolis, 0.05, shipAngle - 180);
	}
	else if (InputManager.p1.keyLeft)
	{
		motion.x = approach(motion.x, -minSpd, accel);
	}
	else
	{
		motion.x = approach(motion.x, 0, decel);
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
wepon			= new Single();


#endregion----------------------------------------------------------------------

#region State ------------------------------------------------------------------
state = new SnowState("move");
state.add("move", {
	enter: function()
	{
		exhaustTimer.start(10);
	},
	step: function()
	{
		// Move and rotate
	 	updateShipSpeed();
		shipDir.set(InputManager.p1.horizontalInput, InputManager.p1.verticalInput);
	 	motion.x = clamp(motion.x, - maxSpd, maxSpd);
	 	motion.y = clamp(motion.y, - maxSpd, maxSpd);
		// Get Damage
		if (place_meeting(x, y, objObstacles))
		{
			state.change("death");
		}
		// Pick Ability
		var a = instance_place(x, y, objAbilities);
		if (instance_exists(a))
		{
			with self
				a.pick();	
		}
		// Shoot State
	 	//if (InputManager.p1.keyShootPressed && !shooting) state.change("shoot");
	 	if (InputManager.p1.keyShootPressed && !shooting)
	 	{
			shooting = true;
			squash_and_stretch(1.2, 0.95);
	 		shootTimer.start(wepon.delay);
			with(self)
				wepon.use();
	 	}
	 	else if (InputManager.p1.keyShoot)
	 	{
	 		shootTimer.on_timeout(function()
	 		{
				squash_and_stretch(1.2, 0.95);
				with (self)
					wepon.use();
	 			shooting = false;
	 			shootTimer.reset();
	 		});
			shootTimer.run();
	 	}
	 	else
	 	{
	 		shootTimer.stop();
	 	}
		
	 	// Cycle wepons
	 	// Dash state

		if (InputManager.p1.keyDash)
		{
			if (dashDur > dashBuffer)
			{
				if (canDash)
				{
					if (abs(InputManager.horizontalInput) || abs(InputManager.verticalInput)) dashDir.set(InputManager.p1.horizontalInput, -InputManager.p1.verticalInput);
					else (dashDir.set(sign(motion.x), 0));
					state.change(dashType);
				}
			}
			canDash = false;
		}
		else
		{
		dashDur += 0.3;
		dashDur = clamp(dashDur, 0, dashDurMax);
			canDash = true;
		}

	 	x += motion.x;
	 	y += motion.y;
		image_alpha = flerp(image_alpha, 1, 0.05);
	}
});
state.add("pressDash", {
	enter: function()
	{
		dashTween.start(0, 10, 15);
		ghostTimer.start(5);
	},
	step: function()
	{
		image_alpha = flerp(image_alpha, 0.5, 0.05);
	 	motion.x = lengthdir_x(dashTween.value, dashDir.angle());
	 	motion.y = lengthdir_y(dashTween.value, dashDir.angle());
	 	//motion.x = clamp(motion.x, - maxSpd * 2, maxSpd * 2);
	 	//motion.y = clamp(motion.y, - maxSpd * 2, maxSpd * 2);
	 	//dashDir = dashDir != 0 ? -1 : 0;
	 	ghostTimer.on_timeout(function()
	 	{
	 		part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
	 		part_type_sprite(global.ptGhostDash, sprite_index, false, false, false);
	 		part_type_alpha3(global.ptGhostDash, 0.3, 0.5, 0);
			
			part_type_gravity(global.ptBolis, 0.1, 180 - shipDir.angle());
	 		
			part_particles_create(global.psEffects, x, y, global.ptGhostDash, 1);
	 		part_particles_create(global.psEffects, random_range(0, room_width),
						irandom_range(0, room_height), global.ptBolis, 1);
			ghostTimer.reset();
	 	});
		ghostTimer.run();

	 	x += motion.x;
	 	y += motion.y;
	 	if (dashTween.done)
	 	{
			dashTween.stop();
			state.change("move");
	 	};
		dashTween.run();
	},
	leave: function()
	{
	}
});
state.add("holdDash", {
	enter: function()
	{
		ghostTimer.start(5);
	},
	step: function()
	{
	 	motion.x = approach(motion.x, maxSpd * 2 * dashDir.x, accel * 2);
	 	motion.y = approach(motion.y, maxSpd * 2 * dashDir.y, accel * 2);
		image_alpha = flerp(image_alpha, 0.5, 0.05);
		dashDur--;
		dashDur = clamp(dashDur, 0, dashDurMax);
	 	motion.x = approach(motion.x, lengthdir_x(maxSpd * 2, dashDir.angle()), accel);
	 	motion.y = approach(motion.y, lengthdir_y(maxSpd * 2, dashDir.angle()), accel);
	 	motion.x = clamp(motion.x, - maxSpd * 2, maxSpd * 2);
	 	motion.y = clamp(motion.y, - maxSpd * 2, maxSpd * 2);
	 	//dashDir = dashDir != 0 ? -1 : 0;
	 	ghostTimer.on_timeout(function()
	 	{
	 		part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
	 		part_type_sprite(global.ptGhostDash, sprite_index, false, false, false);
	 		part_type_alpha3(global.ptGhostDash, 0.3, 0.5, 0);
			
			part_type_gravity(global.ptBolis, 0.1, 180 - shipDir.angle());
	 		
			part_particles_create(global.psEffects, x, y, global.ptGhostDash, 1);
	 		part_particles_create(global.psEffects, random_range(0, room_width),
						irandom_range(0, room_height), global.ptBolis, 1);
			ghostTimer.reset();
	 	});
		ghostTimer.run();

	 	x += motion.x;
	 	y += motion.y;
	 	if (!InputManager.p1.keyDash || dashDur <= dashBuffer)
	 	{
	 		ghostTimer.stop();
			state.change("move");
	 	};			
	},
	leave: function()
	{
	}
});
state.add("shoot", {
	enter: function()
	{
	 		shootTimer.start(wepon.delay);
			with self
				wepon.use();
			shooting = true;
			//part_type_speed(global.ptShoot, 2 - motion.y, 3 - motion.y, 0, 0);
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
	},
	step: function()
	{
		//part_type_speed(global.ptShoot, 2 - motion.y, 3 - motion.y, 0, 0);
	 	updateShipSpeed();
		switchWepon();

		shootTimer.on_timeout(function()
	 	{
			if (!InputManager.p1.keyShoot) 
			{
				state.change("move", function()
				{
					shootTimer.stop();
					shooting = false;
				});
			}
			else
			{
				with(self)
					wepon.use();
				//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
		 		shootTimer.reset();
			}
	 	});
		shootTimer.run();

		if (InputManager.p1.keyDash)
	 	{
			dashDir.set(InputManager.p1.horizontalInput, -InputManager.p1.verticalInput);
			state.change("dash");
		}
		x += motion.x;
	 	y += motion.y;
	}
});
state.add("death", {
	enter: function()
	{
		Control.state.change("end");
	},
	step: function()
	{
		image_alpha -= 0.1;
		if (image_alpha <= 0) instance_destroy();
	}
});
#endregion //-------------------------------------------------------------------
Camera.following = self;

