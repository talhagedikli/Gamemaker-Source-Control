var enemy_count = instance_number(o_enemy_parent);

if (instance_exists(o_skeleton) and enemy_count < o_skeleton.kills/4)
{
    if (enemy_count > 5)
	{
		exit;
	}
	
	var enemy = choose(o_knight, o_crow, o_crow);
	if o_skeleton.kills > 20 and not instance_exists(o_boss)
	{
		enemy = choose(o_crow, o_crow, o_knight, o_knight, o_boss);
	}
	var new_x = random_range(220, room_width - 220);
	
	while (point_distance(new_x, 0, o_skeleton.x, 0)<200) {
	    new_x = random_range(220, room_width-220); 
	}
	
	instance_create_layer(new_x, o_skeleton.y, "Instances", enemy);
}