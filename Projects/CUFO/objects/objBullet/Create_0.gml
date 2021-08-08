randomize();
owner		= noone;
angleSpd	= 2;
fadeOut		= false;
startPos	= new Vector2(x, y);
speed		= 2;
image_speed = 0;
//part_particles_create(global.psEffects, bbox_right, y, global.ptShoot, 1);
destroy = function()
{
	part_particles_create(global.psEffects, x, y, global.ptBulletDestroy, random_range(2, 7));
	fadeOut = true;
}
outside = function()
{
	return (bbox_right < 0 || bbox_left > room_width || bbox_top < 0 || bbox_bottom > room_height);
}
state = new SnowState("normal");
state.add("normal", {
	enter: function()
	{
		angleSpd = 0;
	},
	step: function()
	{
		if (outside()) destroy();
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
		if (abs(startPos.x - x) < 1 && abs(startPos.y - y) < 1) destroy();
	}
});