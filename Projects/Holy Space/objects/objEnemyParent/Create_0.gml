event_inherited();
hp	= 1;
hurtSound = aHurt;
getDamage	= function(_dmg)
{
	blend.x	= c_red;
	hp		-= _dmg;
	var s = audio_play_sound(hurtSound, 1, false);
	audio_sound_pitch(s, choose(0.95, 1., 1.05));
	screen_shake(4, 1, 20);
	if (hp <= 0) fadeOut = true;
}