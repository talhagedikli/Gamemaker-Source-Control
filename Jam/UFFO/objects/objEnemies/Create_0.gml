direction		= 180;
speed			= random_range(0.5, 1.5) * (global.difficulty / 2);
var c			= choose(global.starfieldColor, c_dkgray, c_gray, c_white);
color			= merge_color(c_white, c, 0.4)
angleSpd		= 0;
hp				= 2;
fadeOut			= false;
image_blend		= c_white;
image_index		= irandom_range(0, image_number - 1);
image_speed		= 0;


newScale		= function(xscl, yscl)
{
	image_xscale	= xscl;
	image_yscale	= yscl;
}
destroy = function()
{
	audio_play_sound(aDestroy, 1, false);
	global.score	+= round(hp * 100);
	fadeOut = true;
}
playShootSound = function()
{
	var a = audio_play_sound(aShoot, 1, false);
	audio_sound_pitch(a, random_range(0.8, 1.2));	
}
leftOutRoom = function()
{
	if (bbox_right < 0) return true;
	return false;
}

getDamage = function(bullet)
{
	if (hp > 0)
	{
		hp -= bullet.damage;
	}
	bullet.destroy();
	if (hp <= 0) destroy();
	image_blend = c_red;
}

shootTimer	= array_create(image_number, new Timer());
cleanTimers = function()
{
	var i = 0; repeat(array_length(shootTimer))
	{
		if (i =! image_index) delete shootTimer[i];
	}
}

state = new SnowState(string(image_index));
state.add("0", {
	enter: function()
	{
		newScale(1.5, 1.5);
		hp = random_range(3.5, 4.9);
		point			= hp * 100;
		angleSpd = 0;
		newScale(1.5, 1.5);
		shootTimer[image_index].start(60);
		cleanTimers();
	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var i = image_angle; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.owner 		= self;
				b.direction		= i;
				b.image_angle	= i;
				b.sprite_index	= sprEnemyBullets;	// Change it to sprEnemyBullet
				b.speed 		+= speed;
				i += 90;
			}
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();
	
	}
});
state.add("1", {
	enter: function()
	{
		newScale(1.5, 1.5);
		hp = random_range(2.5, 3.2);
		point			= hp * 100;
		angleSpd = 2;
		newScale(1.5, 1.5);
		shootTimer[image_index].start(60);		
		cleanTimers();
	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var i = image_angle + 45; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.owner			= self;
				b.direction		= i;
				b.image_angle	= i;
				b.sprite_index	= sprEnemyBullets;
				b.speed += speed;
				i += 90;
			}
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();
	}
});
state.add("2", {
	enter: function()
	{
		newScale(1.5, 1.5);
		hp = random_range(3.5, 4.1);
		point			= hp * 100;
		shootTimer[image_index].start(30);
		newScale(1.5, 1.5);
		angleSpd = 0;
		cleanTimers();
	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var i = 45; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.owner			= self;
				b.direction		= i;
				b.image_angle	= i;
				b.sprite_index	= sprEnemyBullets;
				b.state.change("rotating");
				b.speed += speed;
				i += 90;
			}
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();		
	}
});
state.add("3", {
	enter: function()
	{
		newScale(-1.5, 1.5);
		hp = random_range(1.8, 2.2);
		point			= hp * 100;
		// angleSpd	= 2;
		shootTimer[image_index].start(40);
		newScale(-1.5, 1.5);
		cleanTimers();
	},
	step: function()
	{
		newScale(-1.5, 1.5);
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var b = instance_create_layer(x, y, layer, objBullet);
			b.owner			= self;
			b.trackTarget	= objAllyParent;
			b.state.change("tracking");
			b.velocity		= 1;
			b.turnSpeed 	= 0.5;
			b.direction		= 180;
			// b.image_angle	= i;
			b.sprite_index	= sprEnemyBullets;
			b.speed += speed;
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();		
		// if (instance_exists(objplayer1)) direction = approach(direction, point_direction(x, y, objPlayer1.x, objPlayer1.y), 1);
		// image_angle = direction;
	}
});
state.add("4", {
	enter: function()
	{
		newScale(-1.5, 1.5);
		hp = random_range(3.5, 4.2);
		point			= hp * 100;
		shootTimer[image_index].start(50);
		newScale(-1.5, 1.5);
		cleanTimers();
	},
	step: function()
	{
		newScale(-1.5, 1.5);
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var b = instance_create_layer(bbox_left, y, layer, objBullet);
			b.owner			= self;
			b.trackTarget	= objAllyParent;
			b.state.change("tracking");
			b.velocity		= 0.5;
			b.turnSpeed 	= 1;
			b.alarm[0]		= 120;
			b.direction		= 180;
			// b.image_angle	= i;
			b.sprite_index	= sprEnemyBullets;
			b.speed += speed;
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();		
	}
});
state.add("5", {
	enter: function()
	{
		
		hp = random_range(1.5, 2.1);
		point			= hp * 100;
		shootTimer[image_index].start(45);
		direction = y < room_height / 2 ? irandom_range(180, 225) : irandom_range(135, 180);
		speed	= 2.5;
		newScale(-1.5, 1.5);
		cleanTimers();
	},
	step: function()
	{
		newScale(-1.5, 1.5);
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var b = instance_create_layer(bbox_left, y, layer, objBullet);
			b.owner			= self;
			b.trackTarget	= objAllyParent;
			b.state.change("tracking");
			b.velocity		 = 1;
			b.turnSpeed 	= 1;
			b.direction		= 180;
			// b.image_angle	= i;
			b.sprite_index	= sprEnemyBullets;
			b.speed += speed;
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();		
	}
});