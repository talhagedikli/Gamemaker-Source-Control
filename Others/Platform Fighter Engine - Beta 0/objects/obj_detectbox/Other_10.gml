/// @description <Run by obj_game>
if (destroy || lifetime == 0)
	{
	instance_destroy();
	exit;
	}
	
//Overlay Sprite
overlay_frame = (overlay_frame + overlay_speed) % sprite_get_number(overlay_sprite);

//Nothing happens if the owner is somehow destroyed
if (instance_exists(owner))
	{
	//Move with the player
	x = xstart + (owner.x - owner_xstart);
	y = ystart + (owner.y - owner_ystart);
	
	//Check for a collision with any hurtboxes
	var _num = instance_place_list(x, y, obj_hurtbox, list, false);
	if (_num > 0)
		{
		//Loop through all hit hurtboxes, an execute a script for each
		for(var i = 0; i < _num; i++)
			{
			var _hurtbox = list[| i];
			//Hitboxes cannot hit their owners
			if (_hurtbox.owner == noone || _hurtbox.owner == owner) then continue;
			//Hitboxes cannot hit someone who has already been hit
			var _col_list = owner.collided[| hitbox_group];
			var _already_hit = false;
			for(var m = 0; m < ds_list_size(_col_list); m++)
				{
				if (_hurtbox.owner == _col_list[| m])
					{
					_already_hit = true;
					break;
					}
				}
			//Run the detectbox hit script
			if (!_already_hit)
				{
				with(_hurtbox.owner)
					{
					script_execute(_hurtbox.detectbox_hit, other.id, _hurtbox);
					}
				}
			//Exit out if the detectbox is destroyed in the event
			if (!instance_exists(id)) then exit;
			}
		}
	//Clear the DS
	//Detectboxes may be destroyed on collision, so this is necessary
	if (ds_exists(list, ds_type_list))
		{
		ds_list_clear(list);
		}
	else 
		{
		exit;
		}
	}
	
//When the user is in hitlag, the time on the hitboxes doesn't count down
if (owner.self_hitlag_frame <= 0)
	{
	lifetime--;
	}
//Destroy if the player was hit
if (owner.state != PLAYER_STATE.attacking)
	{
	destroy = true;
	}