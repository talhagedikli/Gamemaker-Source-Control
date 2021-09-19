// roomManager = 
// {
// 	checkRoom : function()
// 	{
// 		if (state.get_current_state() != room_get_name(room))
// 		{
// 			state.change(room_get_name(room));
// 		}
// 	},
// 	state : new SnowState(room_get_name(rTitle))
// 	.add(room_get_name(rTitle), {	// ----------TITLE
// 		enter: function() 
// 		{
// 			if (!instance_exists(objTitleMenu)) instance_create_layer(x, y, layer, objTitleMenu);
// 		},
// 		step: function()
// 		{
// 		},
// 		leave: function() 
// 		{
// 		}
// 	})
		
// 	.add(room_get_name(rWorld), {	// ----------WORLD
// 		enter: function() 
// 		{
// 		},
// 		step: function()
// 		{
// 		},
// 		leave: function() 
// 		{
// 		}
// 	}),
// }

// global.clock.add_cycle_method(function()
// {
// 	roomManager.state.step();
// 	roomManager.checkRoom();
// });