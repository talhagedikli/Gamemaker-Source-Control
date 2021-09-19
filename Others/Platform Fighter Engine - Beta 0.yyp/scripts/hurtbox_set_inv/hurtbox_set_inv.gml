///@func hurtbox_invulnerability(hurtbox, type, time, [overridable])
///@param hurtbox
///@param type
///@param time
///@Param [overridable]
function hurtbox_set_inv() {

	var _hurtbox = argument[0];
	var _type = argument[1];
	var _time = argument[2];
	var _override = argument_count > 3 ? argument[3] : true;

	with(_hurtbox)
		{
		if (inv_override || !_override)
			{
			inv_type = _type;
			inv_frame = _time;
			inv_override = _override;
			}
		}


}
