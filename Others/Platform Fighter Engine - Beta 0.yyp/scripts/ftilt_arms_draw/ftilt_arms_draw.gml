function ftilt_arms_draw() {
	//Forward Tilt - Draw
	if (attack_phase == 1)
		{
		//Line
		var _c = palette_get_color(palette, 0);
		draw_line_width_color(x + (16 * facing), y + 4, x + ftilt_arms_x, y + ftilt_arms_y, 4, _c, _c);
	
		palette_shader_set(palette_sprite, player_color, 0.0, 1.0, fade_value, false);
		draw_sprite_ext(spr_ftilt_arms_end, 0, x + ftilt_arms_x, y + ftilt_arms_y, 2 * facing, 2, 0, c_white, 1);
		shader_reset();
		}
	else if (attack_phase == 2)
		{
		//Line
		var _c = palette_get_color(palette, 0);
		draw_line_width_color(x + (16 * facing), y + 4, x + ftilt_arms_x, y + ftilt_arms_y, 4, _c, _c);
	
		palette_shader_set(palette_sprite, player_color, 0.0, 1.0, fade_value, false);
		draw_sprite_ext(spr_ftilt_arms_end, 0, x + ftilt_arms_x, y + ftilt_arms_y, 2 * facing, 2, 0, c_white, 1);
		shader_reset();
		}


}
