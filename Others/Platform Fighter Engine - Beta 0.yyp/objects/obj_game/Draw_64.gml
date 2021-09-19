/// @description HUD
//Draw player status
var _fade = background_get_clear_amount();

if (show_hud)
	{
	for(var i = 0; i < number_of_players; i++)
		{
		//Get accent color
		var _accent = c_white;
		var _player = instance_find(obj_player, i);
		_accent = palette_get_color(_player.palette, 0);
	
		//X and Y positions
		var _x = status_bar_space * (i + 1);
		var _y = player_status_y;
	
		//Fade out status bars if any players are under them
		var _collide_fade = 0;
		if (collision_rectangle(cam_x + _x - 64, cam_y + _y - 32, cam_x + _x + 64, cam_y + _y + 32, obj_player, false, true))
			{
			_collide_fade = 0.5;
			}
	
		//Status bar back
		draw_sprite_ext
			(
			spr_player_status,
			0,
			_x, 
			_y, 
			2,
			2,
			0,
			_accent,
			_fade - _collide_fade
			);
		
		palette_shader_simple_rgb_set(_player.palette_sprite, _player.player_color);
	
		//Portrait sprite
		draw_sprite_ext
			(
			_player.portrait,
			0,
			_x, 
			_y, 
			2,
			2,
			0,
			c_white,
			_fade - _collide_fade
			);
		
		//Stocks
		if (_player.stock <= 5)
			{
			for(var m = 0; m < _player.stock; m++)
				{
				draw_sprite_ext
					(
					_player.stock_sprite,
					0,
					_x + (m * 18) + 48,
					_y - 48,
					2,
					2,
					0,
					c_white,
					_fade - _collide_fade 
					);
				}
			}
		//Abbreviated stock
		else
			{
			draw_sprite_ext
				(
				_player.stock_sprite,
				0,
				_x + 66,
				_y - 48,
				2,
				2,
				0,
				c_white,
				_fade - _collide_fade
				);
			//Text
			shader_reset();
			draw_set_font(fnt_consolas);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_alpha(round(_fade));
			draw_text_outline_simple(status_bar_space * (i + 1) + 80, player_status_y - 48, to_string("- ", _player.stock));
			draw_set_alpha(1);
			}
	
		shader_reset();
	
		//Status bar front
		draw_sprite_ext
			(
			spr_player_status,
			1,
			_x,
			_y,
			2,
			2,
			0,
			_accent,
			_fade - _collide_fade
			);
		
		//Damage
		var _percent = !is_stamina_match() ? _player.damage : _player.stamina;
		draw_text_sprite
			(
			46 + _x,
			_y,
			string(_percent),
			spr_damage_font,
			34,
			_player.damage_text_x,
			_player.damage_text_y,
			2,
			calculate_damage_color(_player.damage),
			_fade - _collide_fade
			);
		
		//Run the character HUD script
		if (script_exists(_player.hud_script))
			{
			script_execute(_player.hud_script, _x, _y, _player, (_fade - _collide_fade));
			}
		}
	}

//Timer
if (is_time_match() && countdown <= count_time)
	{
	var _time = (global.match_time - (game_time / game_get_speed(gamespeed_fps) / 60));
	var _time_left = string_format(floor(_time), 3, 0);
	var _time_right = string_replace_all(string_format(floor(frac(_time) * 100 * (60 / 100)), 2, 0), " ", "0");
	draw_set_font(fnt_time);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_text_outline_simple(camera_width div 2, 16, _time_left + " ");
	draw_set_halign(fa_center);
	draw_text_outline_simple(camera_width div 2, 16, ":");
	draw_set_halign(fa_left);
	draw_text_outline_simple(camera_width div 2, 16, " " + _time_right);
	}

//Startup sequence
if (countdown > 0)
	{
	//Countdown
	var _frame = countdown div count_time;
	var _scale = lerp(2.2, 2, (countdown % count_time) / count_time);
	var _alpha = lerp(0, 1, (countdown % count_time) / count_time);
	draw_sprite_ext(spr_countdown, _frame, camera_width div 2, camera_height div 2, _scale, _scale, 0, c_white, _alpha);
	}
	
//Ending sequence
if (state == GAME_STATE.ending)
	{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
	var _scale = 2;
	var _alpha = lerp(0, 2, endcount / end_time);
	draw_sprite_ext(spr_finish, 0, camera_width div 2, camera_height div 2, _scale, _scale, 0, c_white, _alpha);
	}

//Pause Menu
if (state == GAME_STATE.paused)
	{
	//Frame Advance
	if (frame_advance_active)
		{
		draw_set_font(fnt_consolas);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		draw_text(32, 16, "Controlling Player: " + string(pause_menu_owner.player_number));
		draw_text(32, 32, "Total Frames: " + string(current_frame));
		draw_text(32, 48, "Frame Number: " + string(frames_advanced));
		draw_text(32, 64, "Press Start/Enter to go to the next frame");
		draw_text(32, 80, "Press Select/Backspace to exit frame advance");
		}
	else
		{
		//Menu
		draw_set_alpha(0.5);
		draw_rectangle_color(camera_width - UI_pause_menu_size, 0, camera_width, camera_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_font(fnt_time);
		draw_set_halign(fa_right);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		for(var i = 0; i < array_length_1d(pause_menu_choices); i++)
			{
			var _x = camera_width - 32;
			var _y = 64 + (i * 64);
			//Current choice
			if (pause_menu_current == i)
				{
				draw_roundrect_color_ext(camera_width - UI_pause_menu_size + 8, _y - 24, camera_width - 8, _y + 24, UI_radius, UI_radius, UI_accent_color, UI_accent_color, false);
				draw_set_color(UI_window_color);
				}
			else
				{
				draw_set_color(UI_text_color);
				}
			draw_text(_x, _y, pause_menu_choices[i]);
			}
		}
	}