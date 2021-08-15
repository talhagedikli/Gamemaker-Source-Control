if (leftOutRoom()) instance_destroy();
if (fadeOut)
{
	image_alpha -= 0.1;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

if (image_blend != color)
{
	image_blend = merge_color(image_blend, color, 0.05);
}
effectTimer.on_timeout(function()
{
	// part_type_speed(global.ptShine, 0.2 + speed, 0.5 + speed, 0, 0);
	// part_type_direction(global.ptShine, direction - 90, direction - 90, 0, 0);
	part_particles_create(global.psEffects, random_range(bbox_right, bbox_left), y, global.ptShine, 1);
	effectTimer.reset();
});
effectTimer.run();

state.step();
//image_angle += angleSpd;
//image_alpha = dsin(current_time / 7) * 0.2 + 0.7;
