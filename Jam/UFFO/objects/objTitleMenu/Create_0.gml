/// @description 

enum menus {
	main,
	start,
	settings,
	quit,
	length
}

writer = new Typewriter("");
alphaTimer	= new Timer();
alphaTimer.start(180, true);

menu = [
	["START", "SETTINGS", "QUIT"],		// Main
	["1 PLAYER", "2 PLAYERS", "BACK"],			// Start
	["VOLUME", "RESOLUTION", "BACK"],	// Settings
	[ ]									// Quit
];


menuLevel		= menus.main;
lastMenuLevel	= menuLevel;
pos = 0;