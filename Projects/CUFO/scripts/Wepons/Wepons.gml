function Wepon() constructor
{
	name	= ""; 
	sprite	= noone;
	index	= 0;
	info	= "";
	delay	= 10;
	count	= 0;
}

function Single() : Wepon() constructor
{
	name	= "Single";
	sprite	= sprBullets;
	index	= 0;
	info	= "";
	delay	= 6;
	count	= 1;
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			var b = instance_create_layer(bbox_right, y, layer, objBullet);
			b.direction		= random_range(-2, 2);
			b.image_angle	= b.direction;
			b.speed			= 3 * maxSpd;
		}
	}
}

function Triple() : Wepon() constructor
{
	name	= "Triple";
	sprite	= sprBullets;
	index	= 1;
	info	= "";
	delay	= 25;
	count	= 3;
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			var b1 = instance_create_layer(bbox_right, y, layer, objBullet);
			var b2 = instance_create_layer(bbox_right, y, layer, objBullet);
			var b3 = instance_create_layer(bbox_right, y, layer, objBullet);
			b1.direction		= image_angle;
			b1.image_angle		= image_angle;
			b1.speed			= maxSpd;	
			b2.direction		= image_angle + 30;
			b2.image_angle		= image_angle + 30;
			b2.speed			= maxSpd;	
			b3.direction		= image_angle - 30;
			b3.image_angle		= image_angle - 30;
			b3.speed			= maxSpd;
		}
	}
}

function Sphere() : Wepon() constructor
{
	name	= "Sphere";
	sprite	= sprBullets;
	index	= 2;
	info	= "";
	delay	= 30;
	count	= 4;
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			var i = image_angle; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd;	
				i += 90;
			}
		}
	}
}

function Tornado() : Wepon() constructor
{
	name	= "Tornado";
	sprite	= sprBullets;
	index	= 3;
	info	= "";
	delay	= 35;
	count	= 4;
	static use = function()
	{
		randomize();
		var _angleSpd = choose(2, -2);
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			var i = image_angle; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd / 2 + max(motion.x, motion.y);
				b.angleSpd		= _angleSpd;
				b.state.change("rotating");
				i += 90;
			}
		}
	}
}









