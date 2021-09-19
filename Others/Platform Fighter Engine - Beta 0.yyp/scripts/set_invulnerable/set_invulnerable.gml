///@func hurtbox_set_inv(hurtbox, type,time)
///@param type
///@param time
function set_invulnerable() {
	//Sets two variables
	with(hurtbox)
		{
		if (inv_override)
			{
			inv_type = argument[0];
			inv_frame = argument[1];
			}
		}


}
