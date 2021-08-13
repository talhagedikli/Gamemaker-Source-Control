randomize();
owner		= noone;
angleSpd	= 1;
fadeOut		= false;
nearest		= noone;
startPos	= new Vector2(x, y);
damage		= 1;

speed		= 2;
direction	= 0;
image_speed = 0;

// Tracking missle
nearest 	= noone;
trackTarget	= noone;
velocity	= speed;
turnSpeed	= 5;

// Effects
squash_and_stretch(3, 2);

// Functions
normalizeScale = function()
{
	image_xscale = approach(image_xscale, 1, 0.1);
	image_yscale = approach(image_yscale, 1, 0.1);	
}
destroy = function()
{
	part_particles_create(global.psEffects, x, y, global.ptBulletDestroy, random_range(2, 7));
	state.change("death");
}
outside = function(_instance = self)
{
	with (_instance)
	{
		return (bbox_right < 0 || bbox_left > room_width || bbox_top < 0 || bbox_bottom > room_height);
	}
}

state = new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		angleSpd	= 0;
		damage		= 1;
	},
	step: function()
	{
		if (outside()) alarm[0] = 10;
	}
});
state.add("rotating", {
	enter: function()
	{
		damage = 0.7;
	},
	step: function()
	{
		image_angle += angleSpd;
		direction	= image_angle;
		if (abs(startPos.x - x) < 1 && abs(startPos.y - y) < 1) alarm[0] = 10;
	}
});
state.add("tracking", {
	enter: function()
	{
		var ch = Camera.viewHeight, cw = Camera.viewWidth;
		angleSpd	= 0;
		damage		= 0.3;
		var w = ch * 3 / 2, h = cw * 3 / 2;
		nearest		= collision_rectangle(x, y - h, x + owner.image_xscale * w, y + h, trackTarget, false, true);
		if (instance_exists(nearest))
		{
			if (outside(nearest)) nearest = noone;
		}
		direction	= 0;
		image_angle = direction;
	},
	step: function()
	{
		if (instance_exists(nearest))
		{
			var pointDiff	= point_direction(x, y, nearest.x, nearest.y);
			var angleDir	= dsin(pointDiff -	direction);
			if(angleDir > 0)
			{
				direction += turnSpeed;
			}
			else if(angleDir < 0)
			{
				direction -= turnSpeed;
			}			
			image_angle = direction;
		}
		x = x + (dcos(direction) * velocity);
		y = y - (dsin(direction) * velocity);
		if (outside()) alarm[0] = 10;
	}
});
state.add("death", {
	enter: function()
	{
			
	},
	step: function()
	{
		image_alpha -= 0.1;
		if (image_alpha <= 0) instance_destroy();	
	}
});