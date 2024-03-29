/// @description 
checkRoom = function()
{
	if (state.get_current_state() != room_get_name(room))
	{
		state.change(room_get_name(room));
	}
}
planetTimer		= new Timer();
planetCount		= 1;
planetDelay		= 10;
maxStarCount	= 20;

fogTimer		= new Timer();

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
// Background setup
background_map = ds_map_create();
background_map[? layer_get_id("bgSpace")] = 0.3;

state = new SnowState(room_get_name(rTitle));
state.add(room_get_name(rTitle), {	// ----------TITLE
	enter: function() 
	{
		// createStars();
		planetTimer.start(planetDelay);
	},
	step: function()
	{
		// updateStars();
		planetTimer.on_timeout(function()
		{
			if (instance_number(objPlanets) < planetCount)
			{
				var scl = 2;
				var p = instance_create_layer(room_width + sprite_get_width(sprPlanets) / 2 * scl, irandom_range(0, room_height),
											"Planets", objPlanets);
				p.image_xscale = scl;
				p.image_yscale = scl;
			}
			planetTimer.reset(planetDelay / global.difficulty);
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
		fogTimer.start(70);
		planetTimer.start(planetDelay);
	},
	step: function()
	{
		// updateStars();
		planetTimer.on_timeout(function()
		{
			if (layer_exists("bgSpace"))
			{
				var l = layer_get_id("bgSpace");
				
			}
			if (instance_number(objPlanets) < planetCount)
			{
				var scl = 2;
				var p = instance_create_layer(room_width + sprite_get_width(sprPlanets) / 2 * scl, irandom_range(room_height / 5 * 4, room_height),
											"Planets", objPlanets);
					p.image_xscale = scl;
					p.image_yscale = scl;
			}
			planetTimer.reset(planetDelay / global.difficulty);
		});
		planetTimer.run();
		
		fogTimer.on_timeout(function()
		{
			part_particles_create(global.psEffects, room_width, random_range(0, room_height), global.ptFog, 1);
			fogTimer.reset(70 / global.difficulty);
		});
		//fogTimer.run();
		if (layer_exists("bgSpace")) 
		{
		    layer_x("bgSpace", layer_get_x("bgSpace") - (1 - (global.difficulty / 10)));
		}
	},
	leave: function() 
	{
	}
});