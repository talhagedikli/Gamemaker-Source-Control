/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	//Fade value
	var _f = background_get_clear_amount();
	
	//Set up the shader and draw
	palette_shader_set(owner.palette_sprite, owner.player_color, 0.0, 1.0, _f, false);
	var _scale = scale + (sin(obj_game.current_frame / 20) * 0.2);
	draw_sprite_ext(spr_fspec_cloudburst_cloud, 0, x, y, _scale, _scale, 0, c_white, 1);
	draw_sprite_ext(spr_fspec_cloudburst_dust, frame, x, y, scale, scale, 0, c_white, 1);
	shader_reset();
	
	if (game_surface_enable) surface_reset_target();
	}