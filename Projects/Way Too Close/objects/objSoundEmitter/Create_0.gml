emitter = 0;

if (useSound != noone)
{
	if !audio_is_playing(useSound)
	{
		emitter = audio_emitter_create();
		audio_emitter_position(emitter, x, y, 0);
		audio_falloff_set_model(audio_falloff_exponent_distance);
		audio_emitter_falloff(emitter, fallStart, maxDist, 1);
		audio_play_sound_on(emitter, useSound, true, 1);
	}
}
if (showDist)	visible = true;
else			visible = false;