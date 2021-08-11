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
	fadeOut = true;
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
shootTimer0 = new Timer();
shootTimer1 = new Timer();
shootTimer2 = new Timer();
shootTimer3 = new Timer();


state = new SnowState(string(image_index));
state.add("0", {
	enter: function()
	{
		shootTimer0.start(60);

	},
	step: function()
	{
		shootTimer0.on_timeout(function()
		{
			var i = 0; repeat(3)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.owner = self;
				b.image_blend = c_red;
				b.direction = i;
				b.image_angle = i;
				b.sprite_index	= sprEnemyBullets;
				b.speed += speed;
				i+= 90;
			}
			shootTimer0.reset();
		});
		shootTimer0.run();
	}
});
state.add("1", {
	enter: function()
	{
		shootTimer1.start(60);
		
	},
	step: function()
	{
		shootTimer1.on_timeout(function()
		{
			var i = 0; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.direction		= i;
				b.image_angle	= i;
				b.sprite_index	= sprEnemyBullets;	// Change it to sprEnemyBullet
				b.speed 		+= speed;
				i += 90;
			}
			shootTimer1.reset();
		});
		shootTimer1.run();
	
	}
});
state.add("2", {
	enter: function()
	{
		shootTimer2.start(60);			
	},
	step: function()
	{
		shootTimer2.on_timeout(function()
		{
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
			shootTimer2.reset();
		});
		shootTimer2.run();
	}
});
state.add("3", {
	enter: function()
	{
		shootTimer3.start(60);	
	},
	step: function()
	{
		shootTimer3.on_timeout(function()
		{
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
			shootTimer3.reset();
		});
		shootTimer3.run();		
	}
});

