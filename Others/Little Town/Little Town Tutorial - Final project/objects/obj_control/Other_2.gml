/// @description Setup and variables

// Game variables
global.playerControl = true;
townBGMvolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);
global.gameOver = false;
global.gameStart = false;

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
	
// Sequence states
enum seqState {
	notPlaying,
	waiting,
	playing,
	finished,
	}
// Sequence variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;

// NPC states
enum npcState {
	normal,
	done,
	}