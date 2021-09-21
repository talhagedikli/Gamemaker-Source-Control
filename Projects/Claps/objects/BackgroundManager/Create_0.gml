/// @description 
checkRoom = function()
{
	if (state.get_current_state() != room_get_name(room))
	{
		state.change(room_get_name(room));
	}
}

state = new SnowState(room_get_name(rTitle));
state.add(room_get_name(rTitle), {	// ----------TITLE
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
	
state.add(room_get_name(rWorld), {	// ----------WORLD
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

global.gameplayClock.add_cycle_method(function()
{
	state.step();
	checkRoom();
});