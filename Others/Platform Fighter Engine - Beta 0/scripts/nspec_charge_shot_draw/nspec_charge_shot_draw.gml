//Neutral Special - Draw
//Charging up
if (attack_phase == 1)
	{
	var _scale = 0.5 + (nspec_charge_shot_charge / 150) * 1.5;
	
	palette_shader_set(palette_sprite, player_color, 0.0, 1.0, fade_value, projectile_outline, c_black);
	draw_sprite_ext
		(
		spr_nspec_charge_shot_projectile, 
		obj_game.current_frame div 3, 
		x + (32 * facing), 
		y, 
		_scale, 
		_scale, 
		0, 
		c_white, 
		1
		);
	shader_reset();
	}