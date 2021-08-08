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
room_set_width(rTitle, Camera.viewWidth);
room_set_height(rTitle, Camera.viewHeight);
room_set_width(rWorld, Camera.viewWidth);
room_set_height(rWorld, Camera.viewHeight);
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
		obstacleTimer.start(60 / global.difficulty);
	},
	step: function()
	{
		obstacleTimer.on_timeout(function()
		{
			instance_create_layer(room_width + sprite_get_width(sprObstacles), random_range(0, room_width), 
									"Obstacles", objObstacles);
			obstacleTimer.reset(60 / global.difficulty);
		});
		obstacleTimer.run();
	},
	leave: function() 
	{
	}
});




