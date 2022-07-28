
var _xto = lengthdir_x(spd, direction);
var _yto = lengthdir_y(spd, direction);
//var _inst = instance_position(x, y, objEnemyParent);


spd += spdIncrease;




x +=_xto;
y +=_yto;

//var _inst = collision_point(x, y, objEnemyParent, false, true);
var _inst = collision_line(x, y, x + _xto, y + _yto, objEnemyParent, false, true);
//var _inst = instance_place(x, y, objEnemyParent);
if (_inst != noone)
{
	var _dist = distance_to_object(_inst.id);
	x = x + lengthdir_x(_dist, image_angle);
	y = y + lengthdir_y(_dist, image_angle);
	_inst.knockbackDir		= image_angle;
	_inst.knockbackPower	= knockbackPower;
	_inst.knocbackTime		= knocbackTime;
	_inst.stateChange(EnemyStates.knockback);
	createDestroyEffect(x, y, irandom_range(6, 12));
	instance_destroy();
}
image_xscale = max(1, spd/sprite_width);
