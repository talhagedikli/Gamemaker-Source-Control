/// @description Called by obj_game

if (explosion_time > 0)
	{
	explosion_time--;
	if (explosion_time <= 0)
		{
		instance_destroy();
		exit;
		}
	}
else if (attached == noone)
	{
	vsp = min(vsp + grav, max_fall_speed);
	
	repeat(abs(vsp))
		{
		if (!on_ground()) then y += sign(vsp);
		else
			{
			vsp = 0;
			grounded = true;
			break;
			}
		}
		
	//Attach to players nearby
	if (!grounded)
		{
		//Get collisions with nearby players
		ds_list_clear(global.col_list);
		if (collision_circle_list(x, y, 20, obj_player, false, true, global.col_list, true))
			{
			for(var i = 0; i < ds_list_size(global.col_list); i++)
				{
				var _inst = global.col_list[| i];
				//Cannot attach to owner
				if (_inst != noone && _inst != owner)
					{
					//Cannot attach to dead players
					with(_inst)
						{
						if (!is_dead())
							{
							other.attached = _inst;
							break;
							}
						}
					}
				}
			}
		}
	}
else
	{
	//Follow the player, unless it is already exploding
	if (explosion_time == -1)
		{
		x = attached.x;
		y = attached.y;
		}
	}
	
//Animation
if (explosion_time > 0)
	{
	visible = false;
	}
else if (grounded)
	{
	image_index += 0.1;
	if (image_index > 3 || image_index < 2) then image_index = 2;
	}
else
	{
	image_index += 0.1;
	if (image_index > 1) then image_index = 0;
	}
	
//Destroy if the owner is dead or the attached player is dead
with(owner)
	{
	if (is_dead())
		{
		instance_destroy(other);
		exit;
		}
	}
with(attached)
	{
	if (is_dead())
		{
		instance_destroy(other);
		exit;
		}
	}
	
//Destroy if it falls under the stage
if (bbox_top > room_height)
	{
	instance_destroy();
	exit;
	}