///@func hitbox_register_hit(hitbox, [blocked])
///@param hitbox
///@param [blocked]
///@desc Registers either a hit or a block for a given hitbox and the owner of the hitbox
/// Run this script from the player that is being hit
function hitbox_register_hit() {

	var _hitbox = argument[0];
	var _blocked = argument_count > 1 ? argument[1] : false;

	if (!_blocked)
		{
		//Mark the hitbox as having hit something
		_hitbox.has_hit = true;
		_hitbox.owner.any_hitbox_has_hit = true;
		//The hit will count toward a KO in a timed match
		ko_property = _hitbox.owner;
		}
	else
		{
		//Mark the hitbox as having been blocked
		_hitbox.has_been_blocked = true;
		_hitbox.owner.any_hitbox_has_been_blocked = true;
		}

	//Add the hit player to the collided list of the attacking player
	ds_list_add(_hitbox.owner.collided[| _hitbox.hitbox_group], id);


}
