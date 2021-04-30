if not instance_exists(o_skeleton) exit;
var dir = point_direction(x, y, o_skeleton.x, o_skeleton.y);
var acceleration = 0.1;
motion_add(dir, acceleration);

var max_speed = 4;

if (speed > max_speed)
{
    speed = max_speed
}
