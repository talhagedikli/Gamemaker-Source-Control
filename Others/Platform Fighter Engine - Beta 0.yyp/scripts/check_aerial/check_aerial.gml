///@func check_aerial()
///@decs Transition to the aerial state if not on the ground
function check_aerial() {
	if (!on_ground())
		{
		//You're in the air
		set_state(PLAYER_STATE.aerial);
		return true;
		}
	return false;


}
