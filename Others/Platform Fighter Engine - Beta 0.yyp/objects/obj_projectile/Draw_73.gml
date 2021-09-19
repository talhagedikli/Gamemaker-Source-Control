/// @description
if (surface_exists(obj_game.game_surface))
	{
	if (game_surface_enable) surface_set_target(obj_game.game_surface);
	
	var _f = background_get_clear_amount();
		
	palette_shader_set(owner.palette_sprite, owner.player_color, 0.0, 1.0, _f, projectile_outline, c_black);
	draw_sprite_ext(overlay_sprite, overlay_frame, x, y, overlay_facing * overlay_scale, overlay_scale, overlay_angle, overlay_color, overlay_alpha);
	shader_reset();
		
	if (show_hitboxes)
		{
		draw_self();
		draw_arrow
			(
			x,
			y,
			x + lengthdir_x(base_knockback * hitbox_draw_angle_multiplier, drawing_angle),
			y + lengthdir_y(base_knockback * hitbox_draw_angle_multiplier, drawing_angle),
			20
			);
		}
	if (game_surface_enable) surface_reset_target();
	}