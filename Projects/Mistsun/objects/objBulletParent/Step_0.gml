spd += spdIncrease;

var _xto = lengthdir_x(spd, direction);
var _yto = lengthdir_y(spd, direction);

x +=_xto;
y +=_yto;

image_xscale = max(1, spd/sprite_width);

var _inst = instance_place(x, y, objEnemyRed);
if (_inst != noone)
{
	_inst.knockbackDir		= image_angle;
	_inst.knockbackPower	= knockbackPower;
	_inst.knocbackTime		= knocbackTime;
	_inst.state				= EnemyStates.knockback;
	instance_destroy();
}