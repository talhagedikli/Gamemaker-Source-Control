///Checks for smash attacks or aerials
//If one stick is set to attack it overrides the direction of the other stick
var _stick = Choose_Stick_By_Input(INPUT.smash);
//If the smash button was pressed
//Also checks the Special Control Setting A+B Smash
if (button(INPUT.smash, buff) ||
	(scs_AB_smash && button(INPUT.attack, buff, false) && button(INPUT.special, buff, false)))
	{
	//If the player is on the ground
	if (on_ground())
		{
		if (_stick == Rstick)
			{
			if (stick_flicked(Rstick, DIR.up, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Usmash"]);
				}
			else
			if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Dsmash"]);
				}
			else
				{
				//Change direction 
				var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
				if (_frame == -1) then _frame = 0;
				change_facing(Rstick, _frame);
				attack_start(my_attacks[? "Fsmash"]);
				}
			}
		else
			{
			if (stick_tilted(Lstick, DIR.up))
				{
				attack_start(my_attacks[? "Usmash"]);
				}
			else
			if (stick_tilted(Lstick, DIR.down))
				{
				attack_start(my_attacks[? "Dsmash"]);
				}
			else
				{
				//Change direction 
				change_facing(Lstick);
				attack_start(my_attacks[? "Fsmash"]);
				}
			}
		return true;
		}
	else
	//If the player is in the air
		{
		if (_stick == Rstick)
			{
			if (stick_flicked(Rstick, DIR.up, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Uair"]);
				}
			else
			if (stick_flicked(Rstick, DIR.down, buff, true, STICK_CHECK_TYPE.backwards))
				{
				attack_start(my_attacks[? "Dair"]);
				}
			else
				{
				var _frame = stick_find_frame(Rstick, false, true, DIR.horizontal, undefined, undefined, buff, false);
				if (_frame == -1) then _frame = 0;
				if (stick_flicked(Rstick, DIR.horizontal, buff, true, STICK_CHECK_TYPE.backwards))
					{
					//Is the control stick in the direction the player is facing?
					if (sign(stick_get_value(Rstick, DIR.horizontal, _frame)) == sign(facing))
						{
						attack_start(my_attacks[? "Fair"]);
						}
					else
						{
						attack_start(my_attacks[? "Bair"]);
						}
					}
				else
					{
					attack_start(my_attacks[? "Nair"]);
					}
				}
			}
		else
			{
			if (stick_tilted(Lstick, DIR.up))
				{
				attack_start(my_attacks[? "Uair"]);
				}
			else
			if (stick_tilted(Lstick, DIR.down))
				{
				attack_start(my_attacks[? "Dair"]);
				}
			else
			if (stick_tilted(Lstick, DIR.horizontal))
				{
				//Is the control stick in the direction the player is facing?
				if (sign(stick_get_value(Lstick, DIR.horizontal)) == sign(facing))
					{
					attack_start(my_attacks[? "Fair"]);
					}
				else
					{
					attack_start(my_attacks[? "Bair"]);
					}
				}
			else
				{
				attack_start(my_attacks[? "Nair"]);
				}
			}
		return true;
		}
	}
return false;