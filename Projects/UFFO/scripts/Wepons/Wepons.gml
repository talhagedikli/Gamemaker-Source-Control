function Wepon() constructor
{
	name	= ""; 
	sprite	= noone;
	index	= 0;
	info	= "";
	delay	= 10;
}

function Single() : Wepon() constructor
{
	name	= "Single";
	sprite	= sprBullets;
	index	= 0;
	info	= "";
	delay	= 10;
	static use = function()
	{
		with (objPlayer)
		{
			var b = instance_create_layer(x, y, layer, objBullet);
			b.direction		= image_angle;
			b.image_angle	= image_angle;
			b.speed			= maxSpd + motion;
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
	static use = function()
	{
		with (objPlayer)
		{
			var b1 = instance_create_layer(x, y, layer, objBullet);
			var b2 = instance_create_layer(x, y, layer, objBullet);
			var b3 = instance_create_layer(x, y, layer, objBullet);
			b1.direction		= image_angle;
			b1.image_angle		= image_angle;
			b1.speed			= maxSpd  + motion;	
			b2.direction		= image_angle + 30;
			b2.image_angle		= image_angle + 30;
			b2.speed			= maxSpd  + motion;	
			b3.direction		= image_angle - 30;
			b3.image_angle		= image_angle - 30;
			b3.speed			= maxSpd + motion;
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
	static use = function()
	{
		with (objPlayer)
		{
			var i = image_angle; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd + (i == image_angle ? motion : 0);	
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
	static use = function()
	{
		randomize();
		var _angleSpd = choose(2, -2);
		with (objPlayer)
		{
			var i = image_angle; repeat(4)
			{
				var b = instance_create_layer(x, y, layer, objBullet);
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd / 2 + motion;
				b.angleSpd		= _angleSpd;
				b.state.change("rotating");
				i += 90;
			}
		}
	}
}









