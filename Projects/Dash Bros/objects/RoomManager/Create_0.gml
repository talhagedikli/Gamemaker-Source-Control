/// @description 
switched = false;
currentRoom = rTitle;

checkRoom = function()
{
	if (currentRoom != room) {
		currentRoom = room;
		return true;
	}
	return false;
};

state = new SnowState(room_get_name(rTitle));
state.history_enable()
state.set_history_max_size(15)
	
state.add(room_get_name(rTitle), {	// ----------TITLE
	enter: function() 
	{
		// Code
	},
	step: function()
	{
		// Code
	},
	background: function()
	{
		if (layer_exists("Sky")) 
		{
			var sky = layer_background_get_id("Sky");
			layer_background_alpha(sky, abs(sin(current_time/10000)) * 0.7);
			layer_background_xscale(sky, 0.1);
			layer_background_yscale(sky, 0.1);
		}		
	},
	leave: function() 
	{
		// Code
	}
})
	
state.add(room_get_name(rWorld), {	// ----------WORLD
	enter: function() 
	{
		// Create some blocks
		randomize();
		while (!place_meeting(x, y, objBlock) && !place_meeting(x, y, objPlayer) && instance_number(objBlock) < 50 ) 
		{ 
			var bl = instance_create_layer(irandom(room_width div 32) * 32, 
								irandom(room_height div 32) * 32, "Collisions", objBlock);
			bl.image_xscale = irandom_range(1, 4);
			bl.image_yscale = irandom_range(1, 4);
		}
	},
	step: function()
	{
		// Code
	},
	background: function()
	{
		// Code	
	},
	leave: function() 
	{
		// Code
	}
})

backgroundState = new SnowState(room_get_name(rTitle));

backgroundState.add(room_get_name(rTitle), {
	
	
});


backgroundState.add(room_get_name(rTitle), {
	
	
});










