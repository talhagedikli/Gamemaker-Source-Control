/// @description Called by obj_game
if (--lifetime <= 0) then instance_destroy();

image_index += 0.3;

if (mode == 0)
	{
	if (!collision(x + hsp, y, flags_create(FLAG.solid)))
		{
		x += hsp;
		}
	else
		{
		repeat(abs(hsp))
			{
			if (!collision(x + sign(hsp), y, flags_create(FLAG.solid)))
				{
				x += sign(hsp);
				}
			else
				{
				mode = 1;
				break;
				}
			}
		}
		
	repeat(abs(vsp))
		{
		if (!collision(x, y + sign(vsp), flags_create(FLAG.solid)))
			{
			y += sign(vsp);
			}
		else
			{
			mode = 1;
			break;
			}
		}
	}
else if (mode == 1)
	{
	//Hitbox
	if (!created_hitbox)
		{
		created_hitbox = true;
		create_windbox(0, 0, 1.5, 1.5, 0, 1, 90, lifetime, HITBOX_SHAPE.circle, 0, FLIPPER.fixed, true, true, false, 100, false);
		}
	scale = lerp(scale, 2, 0.1);
	if (lifetime <= 10)
		{
		mode = 2;
		}
	}
else if (mode == 2)
	{
	scale = lerp(scale, 0, 0.3);
	}
	
frame += 0.3;