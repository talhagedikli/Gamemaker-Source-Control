/// @description 
switched = false;
currentRoom = rTitle;

#macro GRID_W 8
#macro GRID_H 8

checkRoom = function()
{
	if (currentRoom != room) {
		currentRoom = room;
		return true;
	}
	return false;
};


state = new SnowState(room_get_name(rTitle));
state
	.history_enable()
	.set_history_max_size(15)
	
	.add(room_get_name(rTitle), {	// ----------TITLE
	enter: function() 
	{
	},
	step: function()
	{
	},
	leave: function() 
	{
	}
})
	
	.add(room_get_name(rWorld), {	// ----------WORLD
	enter: function() 
	{
	},
	step: function()
	{
	

	},
	leave: function() 
	{
	}
})



