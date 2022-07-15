spd += spdIncrease;


var _xto = lengthdir_x(spd, direction);
var _yto = lengthdir_y(spd, direction);

x+=_xto;
y+=_yto;

image_xscale = max(1, spd/sprite_width);

var _dmg = instance_place(x, y, objEnemy);
if (_dmg != noone)
{
	_dmg.state = EnemyStates.knockback;
	instance_destroy();	
}