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
destroy = function()
{
	var a = audio_play_sound(aDestroy, 1, false);
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
		angleSpd = 0;
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
		angleSpd = 2;
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
		shootTimer[image_index].start(30);
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
		shootTimer[image_index].start(40);
		image_xscale = -1;
		cleanTimers();
	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var b = instance_create_layer(bbox_left, y, layer, objBullet);
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
	}
});
state.add("4", {
	enter: function()
	{
		shootTimer[image_index].start(50);
		image_xscale = -1;
		cleanTimers();
	},
	step: function()
	{
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
		shootTimer[image_index].start(45);
		direction = y < room_height / 2 ? irandom_range(180, 225) : irandom_range(135, 180);
		speed	= 2.5;
		image_xscale = -1;
		cleanTimers();
	},
	step: function()
	{
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