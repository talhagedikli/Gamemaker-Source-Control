motion		= new Vector2(0);
motionDir	= point_direction(0, 0, motion.x, motion.y);
dir			= image_angle;
dirSpeed	= 0;
dirSpeedMax = 2;
dirAccel	= 0.5;
dirDecel	= 0.1;
accel		= 0.3;
decel		= 0.5;
mSpeed		= 3;

upperVfxTimer	= new xTimer();
ghostDashTimer	= new xTimer();

updateMotionAndDir	= function()
{
	var im = Control.Manager.Input;
	//if (im.p.keyRight)
	//{
	//	motion.x = approach(motion.x, mSpeed, accel);
	//}
	//else if (im.p.keyLeft)
	//{
	//	motion.x = approach(motion.x, -mSpeed, accel);
	//}
	//else
	//{
	//	motion.x = approach(motion.x, 0, decel);
	//}
	//// Vertical
	//if (im.p.keyDown)
	//{
	//		motion.y = approach(motion.y, mSpeed, accel);
	//}
	//else if (im.p.keyUp)
	//{
	//	motion.y = approach(motion.y, -mSpeed, accel);
	//}
	//else
	//{
	//	motion.y = approach(motion.y, 0, decel);
	//}
	if (im.p.keyUp)
	{
		motion.x = approach(motion.x, mSpeed, accel);
	}
	else if (im.p.keyDown)
	{
		motion.x = approach(motion.x, -mSpeed, accel);
	}
	else
	{
		motion.x = approach(motion.x, 0, decel);
	}
	motionDir = point_direction(0, 0, sign(motion.x), sign(motion.y));	
}
updateDirection		= function()
{
	var i = Control.Manager.Input.p;
	if (i.keyLeft)
	{
		dirSpeed = approach(dirSpeed, dirSpeedMax, dirAccel);
	}
	else if (i.keyRight)
	{
		dirSpeed = approach(dirSpeed, -dirSpeedMax, dirAccel);
	}
	else
	{
		dirSpeed = approach(dirSpeed, 0, dirDecel);
	}
	dirSpeed	= clamp(dirSpeed, -dirSpeedMax, dirSpeedMax);
	dir			+= dirSpeed;
	dir			= ceil(dir);
	dir			= dir mod 361;
	log("dir: ", dir, " dirSpeed: ", dirSpeed, "x: ", x, "motion.x: ", motion.x); 
}
applyDirection		= function()
{
	image_angle = dir;
	direction	= dir;		
}
applyMotion			= function()
{
	var ld = lengthdir(new Vector2(motion.x), new Vector2(dir));
	x	+= ld.x;
	y	+= ld.y;	
}

createUpperVfx		= function(_x, _y)
{
	var n = choose(1, 1, 2, 2, 3);
	part_particles_create(global.PS, _x + random_range(-6, 6), _y + random_range(-1, 2), global.Particles.upper.Type(), n);
	// global.Particles.upper.Emit(_x + random_range(-6, 6), _y + random_range(-1, 2), n, 10);
}


state = new SnowState("move");
state.add("move", {
	enter: function()
	{
		var cm = Control.Manager.Camera;
		cm.following = self.id;
		ghostDashTimer.start(12, true);
	},
	step: function()
	{
		ghostDashTimer.on_timeout(function()
		{
			global.Particles.ghostDash.Sprite(sprite_index, false, false, false).Orientation(dir, dir, 0, false, false);
			part_particles_create(global.PS, x, y, global.Particles.ghostDash.Type(), 1);
			//ghostDashTimer.reset();
		});
		updateMotionAndDir();
		updateDirection();
		applyDirection();
		applyMotion();
	},
	leave: function()
	{
		
	}
});
state.add("dance", {
	enter: function()
	{
		
	},
	step: function()
	{
		
	},
	leave: function()
	{
		
	}
});

