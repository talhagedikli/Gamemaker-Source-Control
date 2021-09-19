/// @description DRAW <Run by obj_player_renderer>
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	//Tethering
	if (state == PLAYER_STATE.ledge_tether)
		{
		var _accent = palette_get_color(palette, 1);
		draw_line_width_color(x, y, ledge_id.x, ledge_id.y, 2, _accent, _accent);
		draw_circle_color(ledge_id.x, ledge_id.y, 2, _accent, _accent, false);
		}
		
	//Player
	if (sprite_exists(anim_sprite))
		{
		Player_Shader_Set();
		Player_Draw_Self();
		shader_reset();
		}
	
	//Shielding
	if (state == PLAYER_STATE.shielding)
		{
		var _size = (shield_hp / shield_max_hp) * shield_size_multiplier;
		draw_sprite_ext(spr_shield, 0, x + shield_shift_x, y + shield_shift_y, _size, _size, 0, image_blend, image_alpha);
		_size *= (1 + sin(obj_game.current_frame / 10) * 0.05);
		draw_sprite_ext(spr_shield_wave, 0, x + shield_shift_x, y + shield_shift_y, _size, _size, 0, image_blend, image_alpha);
		}
		
	//Respawning
	if (state == PLAYER_STATE.respawning)
		{
		shader_set(shd_fade);
		shader_set_uniform_f(shader_get_uniform(shd_fade, "fade_amount"), 1 + (sin(obj_game.current_frame / 10) * 0.05)); 
		draw_sprite_ext(spr_respawn_platform, 0, x, bbox_bottom, sprite_scale, sprite_scale, 0, image_blend, image_alpha);
		shader_reset();
		}
		
	//Attack Script Drawing
	if (attack_draw_script != -1 && script_exists(attack_draw_script))
		{
		script_execute(attack_draw_script);
		}
		
	//Off screen view
	if (!point_in_rectangle(x, y, obj_game.cam_x, obj_game.cam_y, obj_game.cam_x + obj_game.cam_w, obj_game.cam_y + obj_game.cam_h) && !is_dead())
		{
		var _coords = get_position_in_view(x, y, 32, obj_game.cam_x, obj_game.cam_y, obj_game.cam_w, obj_game.cam_h);
		var _dir = point_direction(room_width div 2, room_height div 2, x, y);
		var _scale = clamp(2 - ((point_distance(_coords[0], _coords[1], x, y) / camera_boundary)), 0.1, 2);
		var _dis = 20 * _scale;
		draw_sprite_ext(spr_offscreen_pointer, 0, _coords[0] + lengthdir_x(_dis, _dir), _coords[1] + lengthdir_y(_dis, _dir), _scale, _scale, _dir, c_white, 1);
		draw_sprite_ext(spr_offscreen_view, 0, _coords[0], _coords[1], _scale, _scale, 0, c_white, 1);
		
		//Player sprite
		if (sprite_exists(anim_sprite))
			{
			Player_Shader_Set();
			Player_Draw_Self(_coords[0], _coords[1], (_scale / 2));
			shader_reset();
			}
		}
	
	/* DEBUG */
	if (show_collision_boxes)
		{
		draw_sprite_ext(mask_index, 0, x, y, image_xscale, image_yscale, image_angle, collision_box_draw_color, image_alpha);
		}
	if (debug)
		{
		draw_set_font(fnt_consolas);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		
		//X and Y
		draw_text(x - 48, y - 64, "X: " + string(x));
		draw_text(x - 48, y - 48, "Y: " + string(y));
		
		//Draw hitbox group lists
		/*
		for(var i = 0; i < ds_list_size(collided); i++)
			{
			for(var m = 0; m < ds_list_size(collided[| i]); m++)
				{
				draw_text(x + 48, y + m * 32, collided[| i]);
				}
			}
		*/
		//Control stick
		draw_circle(x, y, 32, true);
		draw_circle(x + stick_get_value(Lstick, DIR.horizontal) * 32, y + stick_get_value(Lstick, DIR.vertical) * 32, 6, false);
		//Previous states
		for(var i = 0; i < ds_list_size(state_log); i++)
			{
			draw_text(x + 16, y - 160 + (12 * i), Get_Player_State_Name(state_log[| i]));
			}
		//*/
		}
		
	if (game_surface_enable) surface_reset_target();
	}