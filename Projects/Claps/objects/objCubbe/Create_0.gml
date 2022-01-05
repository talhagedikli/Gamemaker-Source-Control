image_blend = c_skyblue;
x = 0;
y = 0;

Control.Cm.Follow(id);

// Variables
gp				= vec2(x div GRID_WIDTH, y div GRID_HEIGHT);
look			= vec2(0, 0);
targetGrid		= look;
moveTimeMin 	= 5;
moveTimeMax 	= 20;
moveTime		= moveTimeMax;
moveTween		= vec2(new Tween(TweenType.CubicEaseOut, gp.x, targetGrid.x, moveTime), 
						new Tween(TweenType.CubicEaseOut, gp.x, targetGrid.y, moveTime));
moveAcceletor	= new Timer(60);
lookDir			= point_direction(0, 0, look.x, look.y);

enum PlayerStates {
	Idle,
	Look,
	Move,
}

StateChange = function(_new_state, _leave_method)
{
	if (argument[1] != undefined) _leave_method();
	self.fsm = _new_state;
}

// Methods
UpdateGp = function()
{
	gp.x = x div GRID_WIDTH;
	gp.y = y div GRID_HEIGHT;
}
ApplyGp = function()
{
	x = gp.x * GRID_WIDTH;
	y = gp.y * GRID_HEIGHT;
}
SnapToGrid = function()
{
	x = round(gp.x) * GRID_WIDTH;
	y = round(gp.y) * GRID_HEIGHT;
}

state = new SnowState("idle");

state.add("idle",
{
	enter: function()
	{
		UpdateGp();
		SnapToGrid();
		// show("grid X is", gp.x, " Grid Y is ", gp.y);
		// show("x pos is ", x, " y pos is", y);
		// show(gp.x, gp.y);
		// show(x, y);
	},
	step: function()
	{
		var in = Control.In.td;
		if (abs(in.horizontalInput) || abs(in.verticalInput))
		{
			state.change("look");
			return;
		}
		moveAcceletor.Stop();
	},
	leave: function()
	{
		
	}
});
state.add("look",
{
	enter: function()
	{
		
	},
	step: function()
	{
		var in = Control.In.td;
		var hold = abs(in.horizontalInput) || abs(in.verticalInput);
		if (!hold)
		{
			state.change("idle");
			return;
		}
		look.x = in.horizontalInput;
		look.y = in.verticalInput;
		if (in.keyRun)
		{
			targetGrid.x = gp.x + look.x;
			targetGrid.y = gp.y + look.y;
			state.change("move");
			return;
		}
		moveTime = approach(moveTime, moveTimeMax, 2);
		moveAcceletor.Stop();
		
	},
	draw: function()
	{
		
	},
	leave: function()
	{
		
	}	
});
state.add("move",
{
	enter: function()
	{
		moveAcceletor.Start();
		moveTween.x.Start(gp.x, targetGrid.x, moveTime);
		moveTween.y.Start(gp.y, targetGrid.y, moveTime);

	},
	step: function()
	{
		//x = moveTween.x.GetValue() * GRID_WIDTH;
		//y = moveTween.y.GetValue() * GRID_HEIGHT;
		moveAcceletor.OnTimeout(function()
		{
			moveTime = approach(moveTime, moveTimeMin, 2);
		});
		gp.x = moveTween.x.GetValue();
		gp.y = moveTween.y.GetValue();
		ApplyGp();

		moveTween.x.OnTimeout(function()
		{
			moveTween.x.Stop();
			moveTween.y.Stop();
			SnapToGrid();
			state.change("idle");
			return;			
		})

		//if (!moveTween.x.IsActive() && !moveTween.y.IsActive())
		//{
		//	UpdateGp();
		//	state.change("idle");
		//}
	},
	leave: function()
	{
	}
})
