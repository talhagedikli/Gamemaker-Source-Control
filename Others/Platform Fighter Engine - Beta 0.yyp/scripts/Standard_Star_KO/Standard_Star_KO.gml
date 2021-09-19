///Standard_Star_KO
function Standard_Star_KO() {
	//Contains the standard actions for the Star KO state
	var run = true;
#region Renderer
	Player_Set_Renderer(obj_player_renderer_back);
#endregion
#region No values while dead
	set_speed(0, 0, false, false);
	hurtbox_set_inv(hurtbox, INV.invincible, 1);
#endregion
#region Fall at the top of the screen
	var _percent = (1 - state_frame / star_ko_base_time);
	x = round(lerp(x, room_width div 2, 0.01));
	y = round(_percent * star_ko_distance);
	anim_scale = (1 - _percent);
#endregion
#region Knock Out
	if (run && state_frame == 0)
		{
		//Change state
		set_state(PLAYER_STATE.knocked_out);
	
		//VFX
		create_fx(spr_shine_fastfall, 1, 0, 13, x + irandom_range(-5, 5), y + irandom_range(-5, 5), 2, 0);
	
		//Stock matches
		stock--;

		//Reset damage
		damage = 0;
	
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
		run = false;
		}
#endregion
	//No movement


}
