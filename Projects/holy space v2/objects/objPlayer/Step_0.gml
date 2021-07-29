//x = clamp(bbox_left, 0, room_width);
//state.step();
if (state == "move")
{
	init(function()
	{
		exhaustTimer.start(10);
	});
		updateShipDir();
		updateShipSpeed();
		motion = clamp(motion, - maxSpd, maxSpd);
		exhaustTimer.on_timeout(function()
		{
			if (abs(InputManager.keyUp))
			{
				part_particles_create_color(global.partSystem, x, y, global.ptExhaust, c_fuchsia, 1);
			}
			exhaustTimer.reset();
		});
		// Shooting
		if (InputManager.keyShootPressed)
		{
			shootTimer.start(wepon.delay);
			shooting = true;
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
			shooting = false;
		}
		// Cycle wepons
		if (InputManager.keySwitchPressed)
		{
			weponIndex++;
			weponIndex = weponIndex mod array_length(wepons);
		}
		wepon = wepons[weponIndex];
		// Dash state
		if (InputManager.keyDash) change("dash", function()
		{
			exhaustTimer.stop();
		});

		shipAngle	+= shipDir;
		image_angle = floor(shipAngle);
		x += lengthdir_x(motion, shipAngle);
		y += lengthdir_y(motion, shipAngle);
}
else if (state == "dash")
{
	init(function()
	{
		ghostTimer.start(5)
	});
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
	if (!InputManager.keyDash) change("move", function()
	{
		ghostTimer.stop();
		shipDir = 0;
		motion	= maxSpd;
	});	
}