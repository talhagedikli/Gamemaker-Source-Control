///@func Get_Input_Name(input)
///@param input
switch(argument0)
	{
	case INPUT.attack:	return "Attack";
	case INPUT.grab:	return "Grab";
	case INPUT.jump:	return "Jump";
	case INPUT.pause:	return "Pause";
	case INPUT.shield:	return "Shield";
	case INPUT.smash:	return "Smash";
	case INPUT.special: return "Special";
	case INPUT.taunt:	return "Taunt";
	default: return "";
	}