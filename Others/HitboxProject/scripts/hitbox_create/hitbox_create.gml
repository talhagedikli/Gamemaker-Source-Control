function hitbox_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	_hitbox = instance_create(x,y,oHitbox);
	_hitbox.owner = id;
	_hitbox.image_xscale = argument0;
	_hitbox.image_yscale = argument1;
	_hitbox.xOffset = argument2;
	_hitbox.yOffset = argument3;
	_hitbox.life = argument4;
	_hitbox.xHit = argument5;
	_hitbox.hitStun = argument6;

	return _hitbox;



}
