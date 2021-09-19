/// @description Called by obj_game

if (--self_hitlag_frame > 0) then exit;

//Creating hitboxes
if (planted && !launched)
	{
	if (++water_time >= 100)
		{
		water_time = 0;
		with(water_hitbox_left) instance_destroy();
		with(water_hitbox_top) instance_destroy();
		with(water_hitbox_right) instance_destroy();
		//Is the owner above or on the same level?
		if (owner.y < y - 16)
			{
			//Upwards shot
			water_hitbox_left = noone;
			water_hitbox_right = noone;
			water_hitbox_top = create_windbox(0, -16, 0.3, 0.3, 0, 2, 90, 61, HITBOX_SHAPE.square, 1, FLIPPER.standard, true, true, false, 8, true);
			water_hitbox_top.hit_sfx = -1;
			hitbox_set_overlay_sprite(water_hitbox_top, spr_dspec_hydrant_water, 0, 0.5, 2, 90, c_white, 1, 1);
			}
		else
			{
			var _face = facing;
			facing = 1;
			//Sideways shots
			water_hitbox_top = noone;
			water_hitbox_left = create_windbox(-16, 0, 0.3, 0.3, 0, 6, 180, 61, HITBOX_SHAPE.square, 1, FLIPPER.fixed, true, false, true, 0, true);
			water_hitbox_left.hit_sfx = -1;
			hitbox_set_overlay_sprite(water_hitbox_left, spr_dspec_hydrant_water, 0, 0.5, 2, 180, c_white, 1, 1);
			water_hitbox_right = create_windbox(16, 0, 0.3, 0.3, 0, 6, 0, 61, HITBOX_SHAPE.square, 1, FLIPPER.fixed, true, false, true, 0, true);
			water_hitbox_right.hit_sfx = -1;
			hitbox_set_overlay_sprite(water_hitbox_right, spr_dspec_hydrant_water, 0, 0.5, 2, 0, c_white, 1, 1);
			facing = _face;
			}
		}
	//Move the active hitboxes
	hitbox_move_attached(water_hitbox_left, -4, 0);
	hitbox_move_attached(water_hitbox_top, 0, -4);
	hitbox_move_attached(water_hitbox_right, 4, 0);
	}

//Movement
if (!on_ground())
	{
	vsp = min(max_fall_speed, vsp + grav);
	}
	
if (!planted)
	{
	repeat(abs(vsp))
		{
		//If there's no solid block, move
		if (!on_ground()) then y += sign(vsp);		
		else
			{
			vsp = 0;
			planted = true;
			lifetime = 390;
			water_time = 0;
			//Destroy hitboxes
			hitbox_destroy(drop_hitbox);
			//Create solid block
			instance_set_flag(id, FLAG.solid, true);
			//Create hurtbox
			hurtbox = create_hurtbox(spr_dspec_hydrant_obj);
			with(hurtbox)
				{
				//Scale needs to be larger so projectiles can hit it through the solid block
				image_xscale = 2.5;
				image_yscale = 2.5;
				
				hurtbox_setup
					(
					dspec_hydrant_melee_hit,
					-1,
					-1,
					dspec_hydrant_melee_hit,
					-1,
					-1,
					dspec_hydrant_projectile_hit,
					);
				}
			//Move all players out of blocks just in case
			with(obj_player)
				{
				move_out_of_blocks(90);
				}
			//Visual effects
			create_fx(spr_dust_impact, 1, 0, 21, x, bbox_bottom + 1, 1, 90, "FX_Layer_Below");
			break;
			}
		}
	}
else if (launched)
	{
	if (sign(hsp) != 0) then angle -= sign(hsp) * 10;
	else angle += 10;
	projectile_move_x(true, 0.5);
	projectile_move_y(true, 0.90, false);
	}
	
//Destroy
if (--lifetime <= 0)
	{
	instance_destroy();
	}
else if (y > room_height)
	{
	instance_destroy();
	}
if (!instance_exists(owner))
	{
	log("Owner ", owner, " does not exist!");
	instance_destroy();
	}