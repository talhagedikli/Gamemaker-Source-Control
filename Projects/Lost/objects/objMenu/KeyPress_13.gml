switch (menuIndex)
{
	case 0:
	audio_play_sound(aSelect, 1, false);
	global.xSpawnTarget = 96;
	global.ySpawnTarget = 288;
	transition_start(rmOne, sqFadeOut, sqFadeIn);
	break;
	
	case 2:
	game_end();
}