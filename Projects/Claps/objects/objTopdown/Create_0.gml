//Control.Manager.camera.Follow(self.id);
Control.Cm.Follow(self.id);
motion			= vec2(0);
facing			= 1;
spd 			= vec2(0);
mSpeed			= vec2(3);
dir 			= 0;
accel			= 0.3;
decel			= 0.4;
dashPower		= 8;
dashDur			= 10;
dashTween		= new Tween(TweenType.BackEaseOut, 0, dashPower, dashDur);
state			= new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		
	},
	step: function()
	{
		var in = Control.In.td;
		if (abs(in.horizontalInput))
		{
			motion.x = approach(motion.x, mSpeed.x, accel);
			facing = in.horizontalInput;
		}
		else
		{
			motion.x = approach(motion.x, 0, decel);
		}
		if (abs(in.verticalInput))
		{
			motion.y = approach(motion.y, mSpeed.y, accel);
		}
		else
		{
			motion.y = approach(motion.y, 0, decel);
		}
		if (abs(in.keyDashPressed))
		{
			state.change("dash");
		}
		if (abs(in.verticalInput) || abs(in.horizontalInput))
		{
			dir = point_direction(0, 0, in.horizontalInput, in.verticalInput);
		}
		spd.x = round(lengthdir_x(abs(motion.x), dir));
		spd.y = round(lengthdir_y(abs(motion.y), dir));
		var bl = instance_place(x, y, objRounder);
		if (instance_exists(bl))
		{
			bl.image_blend = c_red;
		}
		check_collisions_pixel_perfect(objBlock, spd);
	}
	
})
state.add("dash", {
	enter: function()
	{
		var in = Control.In.td;
		spd.x = 0;
		spd.y = 0;
		dashTween.Start();
	},
	step: function()
	{
		var dis = dashTween.GetValue() - x;
		var d = point_direction(0, 0, facing, Control.In.td.verticalInput);
		
		//var tarx = lengthdir_x(dashTween.GetValue(), d) - x;
		//var tary = lengthdir_y(dashTween.GetValue(), d) - y;
		

		spd.x = lengthdir_x(dashTween.GetValue(), d);
		spd.y = lengthdir_y(dashTween.GetValue(), d);
		//var s = vec2(x, y);
		//s.x  = lengthdir_x(dashTween.GetValue(), d);
		//s.y  = lengthdir_y(dashTween.GetValue(), d);
		dashTween.OnTimeout(function()
		{
			dashTween.Stop();
			state.change("normal");
		})
		check_collisions_pixel_perfect(objBlock, spd);
	}
})