///@param x
///@param y
///@param creator
///@param sprite
///@param knockback
///@param lifespan
///@param damage
///@param xscale
function create_hitbox(_x, _y, _creator, _sprite, _knockback, _lifespan, _damage, _xscale){
	var hitbox = instance_create_layer(_x, _y, "Instances", o_hitbox);
	
	hitbox.sprite_index = _sprite;
	hitbox._creator = _creator;
	hitbox._knockback = _knockback;
	hitbox.alarm[0] = _lifespan;
	hitbox._damage = _damage;
	hitbox.image_xscale = _xscale 
	
}