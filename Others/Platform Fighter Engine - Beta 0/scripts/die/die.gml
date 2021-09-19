///@func die()
///@desc Knocks out a player and destroys their hitboxes
attack_stop();
hitboxes_destroy_attached_all();
camera_shake(death_cam_shake);
hit_sfx_play(snd_hit_explosion);

//Knockout state
//* Star KO / Screen KO
var _ko = true;
if (y < 0)
	{
	if (obj_game.current_frame % star_ko_chance == 0)
		{
		set_state(PLAYER_STATE.star_ko);
		_ko = false;
		}
	else
	if (obj_game.current_frame % screen_ko_chance == 0)
		{
		set_state(PLAYER_STATE.screen_ko);
		_ko = false;
		}
	}
if (_ko)
	{
	set_state(PLAYER_STATE.knocked_out);
	
	//VFX
	if (!is_stamina_match() && check_blastzones(0, 0, room_width, room_height))
		{
		var _col = palette_get_color(palette, 0);
		var _fx = create_fx(spr_hit_fx_ko_explosion, 1, 0, 47, x, y, 4, point_direction(x, y, room_width / 2, room_height / 2));
		_fx.image_blend = _col;
		var _fx = create_fx(spr_hit_fx_ko_explosion, 1, 0, 47, x, y, 3, point_direction(x, y, room_width / 2, room_height / 2));
		_fx.fx_ys *= -1;
		_fx.image_blend = _col;
		}
	else
		{
		var _col = palette_get_color(palette, 0);
		var _fx = create_fx(spr_hit_fx_final_hit, 1, 0, 34, x, y, 2, irandom(360));
		_fx.image_blend = _col;
		}
	
	//Stock matches
	if (is_stock_match())
		{
		stock--;
		}

	//Reset damage
	damage = 0;
	
	//Reset stamina
	stamina = global.match_stamina;
	
	//Lose if no stamina left
	/*
	if (is_stamina_match() && !is_stock_match() && !is_time_match())
		{
		state_frame = -1;
		set_state(PLAYER_STATE.lost);
		}
	*/

	//Lose if no stocks left
	if (is_stock_match() && stock <= 0)
		{
		state_frame = -1;
		stock = 0;
		set_state(PLAYER_STATE.lost);
		}
	else if (!is_stock_match() && is_time_match())
		{
		with(ko_property)
			{
			points++;
			}
		ko_property = noone;
		points--;
		}
	}
//*/
//Variable reset
jump_is_dash_jump = false;
jump_is_midair_jump = false;

//Invulnerability
hurtbox_set_inv(hurtbox, INV.invincible, state_frame);