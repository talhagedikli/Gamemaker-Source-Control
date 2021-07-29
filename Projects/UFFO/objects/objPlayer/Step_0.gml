//xxx.call("step");
 if (state == "move")
 {
 	state_init(function()
 	{
 		exhaustTimer.start(10);
 	});
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
 	if (InputManager.keyDash) state_change("dash", function()
 	{
		// Code here
 	});

 	shipAngle	+= shipDir;
 	image_angle = floor(shipAngle);
 	x += lengthdir_x(motion, shipAngle);
 	y += lengthdir_y(motion, shipAngle);
 }
 else if (state == "dash")
 {
 	state_init(function()
 	{
 		ghostTimer.start(5)
 	});
 	motion = approach(motion, maxSpd * 2, accel * 2);
 	motion = clamp(motion, - maxSpd * 2, maxSpd * 2);
 	ghostTimer.on_timeout(function()
 	{
 		part_type_orientation(global.ptGhostDash, image_angle, image_angle, 0, 0, 1);
 		part_particles_create(global.psEffects, x, y, global.ptGhostDash, 1);
 		ghostTimer.reset();
 	});
	ghostTimer.run();

 	x += lengthdir_x(motion, shipAngle);
 	y += lengthdir_y(motion, shipAngle);
 	if (!InputManager.keyDash) state_change("move", function()
 	{
 		ghostTimer.stop();
 		shipDir = 0;
 		motion	= maxSpd;
 	});	
 }