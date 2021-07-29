//function Wepon() constructor
//{
//	name	= ""; 
//	sprite	= noone;
//	info	= "";
//	delay	= 10;
//}

//function Single() : Wepon() constructor
//{
//	name	= "Single";
//	sprite	= sprSingleBullet;
//	info	= "";
//	delay	= 10;
//	static use = function()
//	{
//		with (objPlayer)
//		{
//			var b = instance_create_layer(x, y, layer, objBullet);
//			b.direction		= image_angle;
//			b.image_angle	= image_angle;
//			b.speed			= maxSpd + motion;
//		}
//	}
//}

//function Triple() : Wepon() constructor
//{
//	name	= "Triple";
//	sprite	= sprTripleBullet;
//	info	= "";
//	delay	= 25;
//	static use = function()
//	{
//		with (objPlayer)
//		{
//			var b1 = instance_create_layer(x, y, layer, objBullet);
//			var b2 = instance_create_layer(x, y, layer, objBullet);
//			var b3 = instance_create_layer(x, y, layer, objBullet);
//			b1.direction		= image_angle;
//			b1.image_angle		= image_angle;
//			b1.speed			= maxSpd  + motion;	
//			b2.direction		= image_angle + 30;
//			b2.image_angle		= image_angle + 30;
//			b2.speed			= maxSpd  + motion;	
//			b3.direction		= image_angle - 30;
//			b3.image_angle		= image_angle - 30;
//			b3.speed			= maxSpd + motion;
//		}
//	}
//}

//function Sphere() : Wepon() constructor
//{
//	name	= "Sphere";
//	sprite	= sprSphereBullet;
//	info	= "";
//	delay	= 30;
//	static use = function()
//	{
//		with (objPlayer)
//		{
//			var i = image_angle; repeat(4)
//			{
//				var b = instance_create_layer(x, y, layer, objBullet);
//				b.direction		= i;
//				b.image_angle	= i;
//				b.speed			= maxSpd + (i == image_angle ? motion : 0);	
//				i += 90;
//			}
//		}
//	}
//}

//function Tornado() : Wepon() constructor
//{
//	name	= "Tornado";
//	sprite	= sprTornadoBullet;
//	info	= "";
//	delay	= 35;
//	static use = function()
//	{
//		randomize();
//		var _angleSpd = choose(2, -2);
//		with (objPlayer)
//		{
//			var i = image_angle; repeat(4)
//			{
//				var b = instance_create_layer(x, y, layer, objRotatingBullet);
//				b.direction		= i;
//				b.image_angle	= i;
//				b.speed			= maxSpd;
//				b.angleSpd		= _angleSpd;
//				i += 90;
//			}
//		}
//	}
//}









