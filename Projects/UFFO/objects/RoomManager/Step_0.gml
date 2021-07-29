var init = state_init;
if (state == "rTitle")
{
	init(function()
	{
		var i = 0; repeat(maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
			i++;
		}
	});
	var pc = part_particles_count(global.psBackground);
	if (pc < maxStarCount)
	{
		part_particles_create(global.psBackground, irandom_range(room_width/5, room_width + room_width / 3), 
							irandom_range(0, room_height), global.ptStar, 1);
	}
	
	
}
else if (state == "rWorld")
{
	init(function()
	{
		part_particles_clear(global.psBackground);
		var i = 0; repeat(maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
			i++;
		}
	});
	var pc = part_particles_count(global.psBackground);
	if (pc < maxStarCount)
	{
		part_particles_create(global.psBackground, irandom_range(room_width/5, room_width + room_width / 3), 
							irandom_range(0, room_height), global.ptStar, 1);
	}
	log(pc);
}


checkRoom();



