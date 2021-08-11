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
obstacleDelay	= 200;
abilityTimer	= new Timer();
abilityDelay	= 600;
enemyTimer		= new Timer();
enemyDelay		= 1000;

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
		var adelay = 60 * 10;
		obstacleTimer.start(obstacleDelay);
		abilityTimer.start(60);
		enemyTimer.start(enemyDelay);
	},
	step: function()
	{
		// Obstacle spawn
		obstacleTimer.on_timeout(function()
		{
			instance_create_layer(room_width + sprite_get_width(sprObstacles), random_range(0, room_width), 
									"Obstacles", objObstacles);
			obstacleTimer.reset(obstacleDelay / global.difficulty);
		});
		obstacleTimer.run();		
		// EnemySpawn
		enemyTimer.on_timeout(function()
		{
			instance_create_layer(room_width + sprite_get_width(sprEnemies), random_range(0, room_width), 
									"Obstacles", objEnemies);
			enemyTimer.reset(enemyDelay / global.difficulty);
		});
		enemyTimer.run();
		// Ability Spawn
		abilityTimer.on_timeout(function()
		{
			instance_create_layer(room_width + sprite_get_width(sprAbilities), random_range(0, room_width), 
									"Obstacles", objAbilities);
			abilityTimer.reset();
		});
		abilityTimer.run();
	},
	leave: function() 
	{
	}
});




