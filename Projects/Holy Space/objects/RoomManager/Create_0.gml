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
		obstacleTimer.start(120);
	},
	step: function()
	{
		obstacleTimer.on_timeout(function()
		{
			var obs = instance_create_layer(room_width, random_range(0, room_height), "Enemies", objObstacle);
			obs.speed *= global.difficulty;
			obstacleTimer.reset(120 / global.difficulty);
		});

	},
	leave: function() 
	{
	}
})



