/// @description 
checkRoom = function()
{
	if (state.get_current_state() != room_get_name(room))
	{
		state.change(room_get_name(room));
	}
}
planetTimer		= new Timer();
planetDelay		= 400;
maxStarCount	= 20;

createStars		= function()
{
	var i = 0; repeat(maxStarCount)
	{
		part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
							irandom_range(0, room_height), global.ptStar, 1);
		i++;
	}
}
updateStars		= function()
{
	var pc = part_particles_count(global.psBackground);
	if (pc < maxStarCount)
	{
		part_particles_create(global.psBackground, irandom_range(room_width/6, room_width + room_width / 3), 
							irandom_range(0, room_height), global.ptStar, 1);
	}		
}



state = new SnowState(room_get_name(rTitle));
state.add(room_get_name(rTitle), {	// ----------TITLE
	enter: function() 
	{
		createStars();
		planetTimer.start(planetDelay);
	},
	step: function()
	{
		updateStars();
		planetTimer.on_timeout(function()
		{
			if (instance_number(objPlanets) < 3)
			{
				instance_create_layer(room_width + sprite_get_width(sprPlanets), irandom_range(0, room_height),
											"Effects", objPlanets);
			}
			planetTimer.reset();
		});
		planetTimer.run();
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
		updateStars();
		planetTimer.on_timeout(function()
		{
			//if (part_particles_count(global.psPlanets) < 3)
			//{
			//	part_particles_create(global.psPlanets, room_width + sprite_get_width(sprPlanets), 
			//							irandom_range(0, room_height), global.ptPlanets, 1);
			//}
			if (instance_number(objPlanets) < 3)
			{
				instance_create_layer(room_width + sprite_get_width(sprPlanets), irandom_range(0, room_height),
											"Effects", objPlanets);
			}
			planetTimer.reset();
		});
		planetTimer.run();
		log(instance_number(objPlanets));

	},
	leave: function() 
	{
	}
});