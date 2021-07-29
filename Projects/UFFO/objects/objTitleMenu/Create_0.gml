/// @description 

enum menus {
	main,
	start,
	settings,
	quit,
	length
}

alphaTimer	= new Timer();
alphaTimer.start(180, true);

menu = [
	["START", "SETTINGS", "QUIT"],		// Main
	[ ],								// Start
	["VOLUME", "RESOLUTION", "BACK"],	// Settings
	[ ]									// Quit
];


menuLevel = menus.main;
pos = 0;










