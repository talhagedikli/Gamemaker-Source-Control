/// @description Music Loop
if (music_intro_pos != 0 && music_loop_pos != 0)
	{
	var _pos = audio_sound_get_track_position(music);
	if (_pos >= music_loop_pos)
		{
		audio_sound_set_track_position(music, _pos - (music_loop_pos - music_intro_pos));
		//show_debug_message("loop"+ string(audio_sound_get_track_position(music)));
		}
	}