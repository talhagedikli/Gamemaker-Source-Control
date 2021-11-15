var in = Control.Manager.Input.Td;
if (abs(in.horizontalInput))
{
	motion.x = approach(motion.x, mSpeed.x, accel);
}
else
{
	motion.x = approach(motion.x, 0, decel);
}
if (abs(in.verticalInput))
{
	motion.y = approach(motion.y, mSpeed.y, accel);
}
else
{
	motion.y = approach(motion.y, 0, decel);
}


if (abs(in.verticalInput) || abs(in.horizontalInput))
{
	dir = point_direction(0, 0, in.horizontalInput, in.verticalInput);
}
x += lengthdir_x(motion.x, dir);
y += lengthdir_y(motion.y, dir);
check_collisions_pixel_perfect_topdown(objBlock, motion, dir);


