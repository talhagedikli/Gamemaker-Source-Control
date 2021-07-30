/// @description 
switched = false;
currentRoom = rTitle;
//checkRoom = function()
//{
//	if (currentRoom != room) {
//		currentRoom = room;
//		return true;
//	}
//	return false;
//};

state	= "rTitle";
changed	= true;

checkRoom = function()
{
	if (room_get_name(room) != state)
	{
		state_change(room_get_name(room));
	}
}
maxStarCount = 100;

infoText = [
	"Press Q to cycle wepons",
	"Press Z to shoot",
	"Press X to dash"
];
info		= noone;
infoTimer	= new Timer();
infoIndex	= 0;
infoAlpha	= new Timer();

obstacleTimer	= new Timer();


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
	state.add(room_get_name(rTitle), {	// ----------TITLE
	enter: function() 
	{
		var i = 0; repeat(maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
			i++;
		}
	},
	step: function()
	{
		var pc = part_particles_count(global.psBackground);
		if (pc < maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(room_width/6, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
		}		
	},
	leave: function() 
	{
	}
});
	
	state.add(room_get_name(rWorld), {	// ----------WORLD
	enter: function() 
	{
		var pc = part_particles_count(global.psBackground);
		//part_particles_clear(global.psBackground);
		while(pc < maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(0, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
		}
	},
	step: function()
	{
		var pc = part_particles_count(global.psBackground);
		if (pc < maxStarCount)
		{
			part_particles_create(global.psBackground, irandom_range(room_width/6, room_width + room_width / 3), 
								irandom_range(0, room_height), global.ptStar, 1);
		}
		log(pc);
	},
	leave: function() 
	{
	}
});




