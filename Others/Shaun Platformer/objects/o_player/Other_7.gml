/// @description footsteps
if (sprite_index == s_player_run) 
{
audio_play_sound(a_step,1,false);
audio_sound_pitch(a_step,choose(0.8,1,1.8));
}