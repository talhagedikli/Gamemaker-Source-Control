motion		= new Vector2(0, 0);

state = new SnowState("move");
state.add("move", {
	enter: function()
	{
		
	},
	step: function()
	{
		
	}
});

global.clock.add_cycle_method(function()
{
	state.step();
});