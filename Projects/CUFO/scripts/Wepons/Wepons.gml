function Wepon() constructor
{
	name	= ""; 
	sprite	= noone;
	sound	= noone;
	index	= 0;
	info	= "";
	delay	= 10;
	count	= 0;
}
#region Wepons
function Single() : Wepon() constructor
{
	name	= "Single";
	sprite	= sprIcons;
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
			b.owner			= self;
			b.image_index	= other.index;
			b.direction		= random_range(-2, 2);
			b.image_angle	= b.direction;
			b.speed			= 3 * maxSpd;
		}
	}
}
function Track() : Wepon() constructor
{
	name	= "Track";
	sprite	= sprIcons;
	index	= 2;
	info	= "";
	delay	= 15;
	count	= 1;
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			var b = instance_create_layer(bbox_right, y, layer, objBullet);
			b.owner			= self;
			b.state.change("tracking");
			b.speed			= 1.5 * maxSpd;
			b.image_index	= other.index;
		}
	}
}

function Triple() : Wepon() constructor
{
	name	= "Triple";
	sprite	= sprIcons;
	index	= 0;
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
			b1.owner			= self;
			b1.image_angle		= image_angle;
			b1.speed			= maxSpd;
			b1.image_index		= other.index;
			b2.owner			= self;
			b2.direction		= image_angle + 30;
			b2.image_angle		= image_angle + 30;
			b2.speed			= maxSpd;	
			b2.image_index		= other.index;
			b3.owner			= self;
			b3.direction		= image_angle - 30;
			b3.image_angle		= image_angle - 30;
			b3.speed			= maxSpd;
			b3.image_index		= other.index;
		}
	}
}

function Sphere() : Wepon() constructor
{
	name	= "Sphere";
	sprite	= sprIcons;
	index	= 1;
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
				b.owner			= self;
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd;
				b.image_index	= other.index;
				i += 90;
			}
		}
	}
}

function Tornado() : Wepon() constructor
{
	name	= "Tornado";
	sprite	= sprIcons;
	index	= 1;
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
				b.owner			= self;
				b.direction		= i;
				b.image_angle	= i;
				b.speed			= maxSpd / 2;
				b.angleSpd		= _angleSpd;
				b.image_index	= other.index;
				b.state.change("rotating");
				i += 90;
			}
		}
	}
}

#endregion

#region Bounities
function Speedup() : Wepon() constructor
{
	name	= "Speedup";
	sprite	= sprIcons;
	index	= 0;
	info	= "";
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			maxSpd = 2 * maxSpd;
		}
	}
}
function Shootrate() : Wepon() constructor
{
	name	= "Shoot Rate";
	sprite	= sprIcons;
	index	= 0;
	info	= "";
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			wepon.delay = wepon.delay / 2;
		}
	}
}

function HoldDash() : Wepon() constructor
{
	name	= "Hold Dash";
	sprite	= sprIcons;
	index	= 0;
	info	= "";
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			dashType = "holdDash";
		}
	}
}

function PressDash() : Wepon() constructor
{
	name	= "Press Dash";
	sprite	= sprIcons;
	index	= 0;
	info	= "";
	static use = function()
	{
		with (other)
		{
			//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
			dashType = "pressDash";
		}
	}
}
#endregion