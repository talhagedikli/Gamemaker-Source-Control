switched = checkRoom();
if (switched)
{
	state.change(room_get_name(room));
	currentRoom = room;	
}

state.step();

//var init = state_init;
//if (state == "rTitle")
//{
//	init(function()
//	{
//		var i = 0; repeat(maxStarCount)
//		{
//			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
//								irandom_range(0, room_height), global.ptStar, 1);
//			i++;
//		}
//	});
//	var pc = part_particles_count(global.psBackground);
//	if (pc < maxStarCount)
//	{
//		part_particles_create(global.psBackground, irandom_range(room_width/6, room_width + room_width / 3), 
//							irandom_range(0, room_height), global.ptStar, 1);
//	}
//}
//else if (state == "rWorld")
//{
//	init(function()
//	{
//		var pc = part_particles_count(global.psBackground);
//		//part_particles_clear(global.psBackground);
//		while(pc < maxStarCount)
//		{
//			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
//								irandom_range(0, room_height), global.ptStar, 1);
//		}
//	});
//	var pc = part_particles_count(global.psBackground);
//	if (pc < maxStarCount)
//	{
//		part_particles_create(global.psBackground, irandom_range(room_width/6, room_width + room_width / 3), 
//							irandom_range(0, room_height), global.ptStar, 1);
//	}
//	log(pc);
//}




