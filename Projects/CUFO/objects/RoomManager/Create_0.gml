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
spawnPos = function(spr)
{
	return new Vector2(room_width + sprite_get_width(spr), 
				irandom_range(sprite_get_height(spr), room_height - sprite_get_height(spr)));
}
state	= "rTitle";
changed	= true;

checkRoom = function()
{
	if (room_get_name(room) != state)
	{
		state_change(room_get_name(room));
	}
}
info		= noone;
info = [
	new Typewriter("Press X to Shoot"),
	new Typewriter("Press Z to Dash"),
	new Typewriter("Press R to Restart"),
	new Typewriter("Press Escape to Quit")
];
infoTimer	= new Timer();
infoIndex	= 0;
infoAlpha	= new Timer();

obstacleTimer		= new Timer();
obstacleDelay		= 300;
abilityTimer		= new Timer();
abilityDelay		= 1200;
enemyTimer			= new Timer();
enemyDelay			= 1200;

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
	draw_gui: function()
	{
		var gw = GUI_W, gh = GUI_H;
		draw_set_aling(fa_left, fa_bottom);
		var scl = 2, sh = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), al = array_length(info);
		var i = al - 1; repeat(al)
		{
			if (i =! al - 1)
			{
				if (info[i + 1].done)
				{
					draw_text_transformed(0, gh - i * (sh * scl), info[i].write(), 2, 2, 0);
				}
			}
			else
			{
				draw_text_transformed(0, gh - i * (sh * scl), info[i].write(), 2, 2, 0);	
			}
			i--;
		}	
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
		abilityTimer.start(abilityDelay);
		enemyTimer.start(enemyDelay);
	},
	step: function()
	{
		// Obstacle spawn
		obstacleTimer.on_timeout(function()
		{
			var s = spawnPos(sprObstacles);
			instance_create_layer(s.x, s.y,
									"Obstacles", objObstacles);
			obstacleTimer.reset(obstacleDelay / global.difficulty);
		});
		obstacleTimer.run();		
		// EnemySpawn
		enemyTimer.on_timeout(function()
		{
			var s = spawnPos(sprEnemies);
			instance_create_layer(s.x, s.y,
									"Obstacles", objEnemies);
			enemyTimer.reset(enemyDelay / global.difficulty);
		});
		enemyTimer.run();
		// Ability Spawn
		abilityTimer.on_timeout(function()
		{
			var s = spawnPos(sprAbilities);
			instance_create_layer(s.x, s.y,
									"Obstacles", objAbilities);
			abilityTimer.reset();
		});
		abilityTimer.run();
	},
	leave: function() 
	{
	}
});




