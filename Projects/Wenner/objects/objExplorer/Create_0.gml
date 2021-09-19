motion			= new Vector2(0, 0);
grav			= 0.1;
travelDir		= 1;
lastTravelDir	= travelDir;
accel			= 0.1;

applyMotion = function()
{
	x += motion.x;
	y += motion.y;
}
state = new xState();
state.default_before(function ()
{
	if(InputManager.p1.keyUpPressed)
	{
		state.change("travel");
	}	
	else if(InputManager.p1.keyDownPressed)
	{
		state.change("rest");
	}
	else if (InputManager.p1.searchKeyPressed)
	{
		state.change("search");
	}
});
state.add("travel", {
	enter: function()
	{
		// show("entered move");
	},
	step: function()
	{
		if (InputManager.p1.keyRight)
		{
			travelDir = 1;
		}
		else if (InputManager.p1.keyLeft)
		{
			travelDir = -1;
		}
		motion.x = approach(motion.x, travelDir, accel);
	},
	leave: function()
	{
		lastTravelDir	= travelDir;
	}
});
state.add("rest", {
	enter: function()
	{
		travelDir = 0;
	},
	step: function()
	{
		motion.x = approach(motion.x, travelDir, accel);
	},
	leave: function()
	{
		travelDir = lastTravelDir;
	}
});
state.add("search", {
	enter: function()
	{
		// show("entered dash");
		searchxTimer = new xTimer();
		searchxTimer.start(180);
	},
	step: function()
	{
		// state.change("move");
		searchxTimer.on_timeout(function()
		{
			here;
			travelDir = irandom_range(-1, 1);
			searchxTimer.reset();
		});
		motion.x = travelDir;
	},
	leave: function()
	{
		searchxTimer.stop();
		travelDir = lastTravelDir;
		// show("leaving dash")
	}
});
state.add("combat", {
	enter: function()
	{
		// show("entered dash");
	},
	step: function()
	{
		// state.change("move");
	},
	leave: function()
	{
		// show("leaving dash")
	}
});
state.default_after(function ()
{
	applyMotion();
});

state.init("travel");