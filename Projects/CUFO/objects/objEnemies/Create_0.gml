direction		= 180;
speed			= random_range(0.5, 1.5) * (global.difficulty / 2);
var c			= choose(global.starfieldColor, c_dkgray, c_gray, c_white);
color			= merge_color(c_white, c, 0.4)
angleSpd		= choose(0, 1, 2, 3);
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

/// @func getDamage()
getDamage = function()
{
	if (hp > 0)
	{
		hp--;
	}
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
		shootTimer[image_index].start(60);
		cleanTimers();

	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var i = 0; repeat(3)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.owner = self;
				b.direction = i;
				b.image_angle = i;
				b.sprite_index	= sprEnemyBullets;
				b.speed += speed;
				i+= 90;
			}
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();
	}
});
state.add("1", {
	enter: function()
	{
		shootTimer[image_index].start(60);
		cleanTimers();
	},
	step: function()
	{
		shootTimer[image_index].on_timeout(function()
		{
			playShootSound();
			var i = 0; repeat(4)
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
state.add("2", {
	enter: function()
	{
		shootTimer[image_index].start(60);		
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
		shootTimer[image_index].start(60);
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
				b.speed += speed;
				i += 90;
			}
			shootTimer[image_index].reset();
		});
		shootTimer[image_index].run();		
	}
});

