/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	var _alpha = fade ? lerp(0, image_alpha, lifetime / total_life) : image_alpha;
	shader_set(shd_dust_cloud);
	shader_set_uniform_f(uni_c, color[0], color[1], color[2]);
	draw_sprite_ext(fx_index, fx_frame, floor(x), floor(y), fx_xs, fx_ys, fx_ang, c_white, _alpha);
	shader_reset();
	if (game_surface_enable) surface_reset_target();
	}