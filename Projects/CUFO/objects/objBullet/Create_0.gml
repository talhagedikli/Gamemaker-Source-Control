randomize();
owner		= noone;
angleSpd	= 2;
fadeOut		= false;
nearest		= noone;
startPos	= new Vector2(x, y);
speed		= 2;
direction	= 0;
image_speed = 0;

// Effects


squash_and_stretch(3, 1.5);

normalizeScale = function()
{
	image_xscale = approach(image_xscale, 1, 0.03);
	image_yscale = approach(image_yscale, 1, 0.03);	
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
// //sprite_index = owner.object_index == objAllyParent ? sprAllyBullets : sprEnemies;
// with (self)
// {
state = new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		angleSpd = 0;
		
	},
	step: function()
	{
		if (outside()) alarm[0] = 10;
	}
});
state.add("rotating", {
	enter: function()
	{
		
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
		var ch = Camera.viewHeight;
		angleSpd	= 0;
		nearest		= collision_rectangle(x, y - ch/2, x + ch, y + ch/2, objObstacles, false, true);
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
			direction	= approach(direction, point_direction(x, y, nearest.x, nearest.y), 1);
			image_angle = direction;
		}
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
// }




