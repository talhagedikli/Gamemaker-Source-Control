var _inst = other.id;
if (_inst != noone)
{
	_inst.knockbackDir		= image_angle;
	_inst.knockbackPower	= knockbackPower;
	_inst.knocbackTime		= knocbackTime;
	_inst.state				= EnemyStates.knockback;
	createDestroyEffect(x, y, irandom_range(6, 12));
	instance_destroy();
}