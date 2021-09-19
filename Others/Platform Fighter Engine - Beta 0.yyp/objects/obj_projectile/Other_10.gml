/// @description
if (destroy || lifetime <= 0)
	{
	instance_destroy();
	exit;
	}
	
//Overlay Sprite
overlay_frame = (overlay_frame + overlay_speed) % sprite_get_number(overlay_sprite);

//Friction and Gravity
hsp = approach(hsp, 0, fric);
vsp += grav;

//Move
if (!pass_through_blocks)
	{
	projectile_move_x(hbounce, bounce_multiplier);
	projectile_move_y(vbounce, bounce_multiplier);
	}
else
	{
	x += hsp;
	y += vsp;
	}

//Check for a collision with any hurtboxes
var _num = instance_place_list(x, y, obj_hurtbox, list, false);
if (_num > 0)
	{
	//Loop through all hit players, an execute a script for each
	for(var i = 0; i < _num; i++)
		{
		var _hurtbox = list[| i];
		//Hitboxes cannot hit their owners
		if (_hurtbox.owner == noone || _hurtbox.owner == owner) then continue;
		//Hitboxes cannot hit someone who has already been hit
		var _col_list = collided;
		var _already_hit = false;
		for(var m = 0; m < ds_list_size(_col_list); m++)
			{
			if (_hurtbox.owner == _col_list[| m])
				{
				_already_hit = true;
				break;
				}
			}
		//Run the projectile hit script
		if (!_already_hit)
			{
			with(_hurtbox.owner)
				{
				script_execute(_hurtbox.projectile_hit, other.id, _hurtbox);
				}
			}
		}
	}
	
//Clear the DS
ds_list_clear(list);

//Timer
lifetime--;