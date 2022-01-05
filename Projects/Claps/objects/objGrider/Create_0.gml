
x = 0;
y = 0;

Control.Cm.Follow(id);

gp = vec2(x div GRID_WIDTH, y div GRID_HEIGHT);
UpdateGp = function()
{
	gp.x = x div GRID_WIDTH;
	gp.y = y div GRID_HEIGHT;
}
look = vec2(0, 0);
targetGrid = look;
moveTimeMin = 5;
moveTimeMax = 20;
moveTime = moveTimeMax;
moveTween = vec2(new Tween(TweenType.CubicEaseOut, gp.x, targetGrid.x, moveTime), 
				new Tween(TweenType.CubicEaseOut, 0, GRID_HEIGHT, 20));
moveAcceletor = new Timer(60);


state = new SnowState("idle");

state.add("idle",
{
	enter: function()
	{
		UpdateGp();
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
		moveTween.x.Start(x, targetGrid.x * GRID_WIDTH, moveTime);
	},
	step: function()
	{
		//x = moveTween.x.GetValue() * GRID_WIDTH;
		//y = moveTween.y.GetValue() * GRID_HEIGHT;
		moveAcceletor.OnTimeout(function()
		{
			moveTime = approach(moveTime, moveTimeMin, 2);
		});
		x = moveTween.x.GetValue();
		moveTween.x.OnTimeout(function()
		{
			moveTween.x.Stop();
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
