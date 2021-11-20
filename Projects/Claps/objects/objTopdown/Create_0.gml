Control.Manager.Camera.Follow(self.id);
motion			= new Vector2(0);
spd 			= new Vector2(0);
mSpeed			= new Vector2(3);
dir 			= 0;
accel			= 0.3;
decel			= 0.4;
dashTween		= new Tween(TweenType.QuartEaseOut);


state			= new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		
	},
	step: function()
	{
		var in = Control.Manager.Input.td;
		if (abs(in.horizontalInput))
		{
			motion.x = approach(motion.x, mSpeed.x, accel);
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
	}
})
state.add("dash", {
	enter: function()
	{
		var in = Control.Manager.Input.td;
		dashTween.Start(x, x + in.horizontalInput * 120, 20);
	},
	step: function()
	{
		x = dashTween.GetValue();
		dashTween.OnTimeout(function()
		{
			dashTween.Stop();
			state.change("normal");
		})
	}
})