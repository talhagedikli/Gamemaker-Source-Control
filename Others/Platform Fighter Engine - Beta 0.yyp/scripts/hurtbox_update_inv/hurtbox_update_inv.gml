///@func hurtbox_update_inv()
function hurtbox_update_inv() {

	if (inv_type != INV.normal && inv_frame <= 0)
		{
		inv_type = INV.normal;
		inv_override = true;
		}	
	inv_frame = max(--inv_frame, 0);


}
