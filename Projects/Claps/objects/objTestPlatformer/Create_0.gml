motion		= new Vector2(0);
motionDir	= point_direction(0, 0, motion.x, motion.y);
facing		= 1;
accel		= 0.3;
decel		= 0.5;
mSpeed		= 3;
grav		= 0.05;
onGround	= false;
moving		= false;

upperVfxTimer	= new xTimer();
ghostDashTimer	= new xTimer();


updateMotion	= function()
{
	var im = Control.Manager.Input;
	if (im.p.keyRight)
	{
		motion.x = approach(motion.x, mSpeed, accel);
	}
	else if (im.p.keyLeft)
	{
		motion.x = approach(motion.x, -mSpeed, accel);
	}
	else
	{
		motion.x = approach(motion.x, 0, decel);
	}
	if (motion.x =! 0)
	{
		facing	= sign(motion.x);
		moving = false;
	}
	else
	{
		moving = true;
	}
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
applyJump			= function()
{
	
}
applyDirection		= function()
{
	image_angle = dir;
	direction	= dir;		
}
applyMotion			= function()
{
	x	+= motion.x;
	y	+= motion.y;	
}

createUpperVfx		= function(_x, _y)
{
	var n = choose(1, 1, 2, 2, 3);
	part_particles_create(global.PS, _x + random_range(-6, 6), _y + random_range(-1, 2), global.Particles.upper.Type(), n);
	// global.Particles.upper.Emit(_x + random_range(-6, 6), _y + random_range(-1, 2), n, 10);
}

applyGravity		= function()
{
	if (!place_meeting(x, y + 1, objBlock))
	{
		motion.y += grav;
	}
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
			if (moving)
			{
				global.Particles.ghostDash.Sprite(sprite_index, false, false, false);
				part_particles_create(global.PS, x, y, global.Particles.ghostDash.Type(), 1);
				//ghostDashTimer.reset();
			}
		});
		updateMotion();
		applyGravity();
		check_collisions_pixel_perfect(objBlock, motion);
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

