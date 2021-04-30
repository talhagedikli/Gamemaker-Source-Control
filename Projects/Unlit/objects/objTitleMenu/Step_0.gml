/// @description 
keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
keyAccept = keyboard_check_pressed(vk_space);

//Store number of options in current menu
opLength = array_length(option[menuLevel]);

//move through the menu
pos	+=	keyDown - keyUp;

if (pos >= opLength) { pos = 0 };
if (pos < 0) { pos = opLength - 1 };

//using the options
if (keyAccept) {
	
	var cml = menuLevel;
	
	switch (menuLevel) {
	//Pause menu
	case 0:	
		switch (pos) {
		//Start Game
		case 0: menuLevel = 2; break;
		//Settings
		case 1: menuLevel = 1; break;
		//Quit Game
		case 2: game_end(); break;
		}
	break;
	
	//Settings menu
	case 1:
		switch (pos) {
		//Window size
		case 0: break;
		//Resolution
		case 1: break;
		//Brightness
		case 2: break;
		//Back
		case 3: menuLevel = 0; break;
			
	
		}
	break;
	
	//Start Game menu
	case 2:
		switch (pos) {
		//World
		case 0: room_goto(rWorld); break;
		//Deck
		case 1: room_goto(rTest); break;
		//Back
		case 2: menuLevel = 0; break;
		}
	break;
	}

	//Set position back to 0
	if (cml != menuLevel) { pos = 0 };

	//Correct option length
	opLength = array_length(option[menuLevel]);

}
		





