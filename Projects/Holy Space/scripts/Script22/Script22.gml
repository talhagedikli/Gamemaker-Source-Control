function Wepon(func) constructor
{
	name	= ""; 
	sprite	= noone;
	info	= "";
}

function Single() : Wepon() constructor
{
	name	= "Single";
	sprite	= sprBullet;
	info	= "";
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
	sprite	= sprBullet;
	info	= "";
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