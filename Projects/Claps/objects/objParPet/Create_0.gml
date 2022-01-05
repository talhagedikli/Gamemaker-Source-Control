#macro spet = global.__selected_pet
global.__selected_pet = noone;



danceTimer = new Timer(60, false, true);
danceTween = new Tween(TweenType.BounceEaseIn, y, y - 16, 120);

state = new SnowState("idle");

state.add("idle", 
{
	enter: function()
	{
		
	},
	step: function()
	{
		danceTimer.OnTimeout(function()
		{
			danceTween.Start(y, y);
		});
		
		if (danceTween.IsActive())
		{
			log(danceTween.GetValue());
			y = danceTween.GetValue();
		}
		else
		{
			if (!danceTimer.IsActive()) danceTimer.Start(irandom_range(300, 500));
		}
	},
	leave: function()
	{
		
	}
});
//state.add("idle", 
//{
//	enter: function()
//	{
		
//	},
//	step: function()
//	{
		
//	},
//	leave: function()
//	{
		
//	}
//});