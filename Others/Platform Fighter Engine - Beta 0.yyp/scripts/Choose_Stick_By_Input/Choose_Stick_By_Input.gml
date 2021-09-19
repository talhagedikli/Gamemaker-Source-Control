///@func Choose_Stick_By_Input(input)
///@param input
///Allows the right stick to override the left stick
function Choose_Stick_By_Input(argument0) {
	var _default = Lstick;
	var _override = Rstick;

	//Check the right stick iput
	if (scs_right_stick_input == argument0)
		{
		if (stick_flicked(_override, DIR.any, buff, false))
			{
			return _override;
			}
		}
	return _default;


}
