/// @description Setup and variables

// Game variables
global.playerControl = true;

// Player states
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
	}
	
// Item states
enum itemState {
	idle,
	taken,
	used,
	puttingBack,
	}