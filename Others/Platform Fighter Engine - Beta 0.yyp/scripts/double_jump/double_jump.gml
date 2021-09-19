///@func double_jump()
///@desc Executes a mid air jump, including the horizontal speed boost
function double_jump() {
	//State
	set_state(PLAYER_STATE.aerial);

	//Speeds
	vsp = -double_jump_speed;
	vsp_frac = 0;
	double_jumps--;
	jump_is_dash_jump = false;
	jump_is_midair_jump = true;

	//Horizontal Speed change
	if (stick_tilted(Lstick, DIR.horizontal))
		{
		//hsp = min(abs(hsp), max_air_speed) * sign(stick_get_value(Lstick, DIR.horizontal));
		hsp = clamp(hsp + (double_jump_horizontal_accel * sign(stick_get_value(Lstick, DIR.horizontal))), -max_air_speed, max_air_speed);
		hsp_frac = 0;
		}
	
	//VFX
	create_fx(spr_dust_air_jump, 1, 0, 14, x, y, 2, 0);


}
