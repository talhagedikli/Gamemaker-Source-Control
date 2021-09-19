/// @function hitbox_destroy([hitbox_ids])
/// @description Destroys the hitboxes whose ids are entered as arguments.
/// @argument [hitbox_ids]
function hitbox_destroy() {
	var _hitbox = noone;
	for(var i = 0; i < argument_count; i++)
		{
		_hitbox = argument[i];
		if (instance_exists(_hitbox) && object_is_ancestor(_hitbox.object_index, obj_hitbox))
			{
			instance_destroy(_hitbox);
			}
		}


}
