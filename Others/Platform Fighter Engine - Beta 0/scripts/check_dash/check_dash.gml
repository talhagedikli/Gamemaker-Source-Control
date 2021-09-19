///@func check_dash()
///@desc Transition to dash state (which then goes to the running state)
//If the control stick is past a threshold
var _frame = stick_find_frame(Lstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
if (_frame != -1)
	{
	//Change the facing direction
	change_facing(Lstick, _frame);
	//Set the state to dashing and stop the script.
	set_state(PLAYER_STATE.dashing);
	//VFX
	var _fx = create_fx(spr_dust_dash, 1, 0, 33, x, bbox_bottom - 1, 2, 0, "FX_Layer_Below");
	_fx.fx_xs = 2 * facing;
	return true;
	}
return false;