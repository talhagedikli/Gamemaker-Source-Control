///Checks for dash grabs
//If the grab button has been pressed
var _stick = Choose_Stick_By_Input(INPUT.grab);
if (button(INPUT.grab, buff))
	{
	if (_stick == Rstick)
		{
		//Change direction
		var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
		if (_frame == -1) then _frame = 0;
		change_facing(Rstick, _frame);
		}
	else
		{
		change_facing(Lstick);
		}
	attack_start(my_attacks[? "DashG"]);
	return true;
	}
return false;