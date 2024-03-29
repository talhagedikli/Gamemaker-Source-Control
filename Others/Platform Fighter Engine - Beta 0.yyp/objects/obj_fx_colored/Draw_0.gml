/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	if (fx_allow_fade)
		{
		var _f = background_get_clear_amount();
		palette_shader_rgb_set(palette_sprite, owner.player_color, 0.0, 1.0, _f); 
		}
		
	var _alpha = fade ? lerp(0, image_alpha, lifetime / total_life) : image_alpha;
	draw_sprite_ext(fx_index, fx_frame, floor(x), floor(y), fx_xs, fx_ys, fx_ang, image_blend, _alpha);
	
	if (fx_allow_fade)
		{
		shader_reset();
		}
		
	if (game_surface_enable) surface_reset_target();
	}