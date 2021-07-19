event_inherited();
item		= new Item();

pick = function()
{
	ds_list_add(other.inventory, item);
	if (item.type == ITEM.WEPON) ds_list_add(other.wepons, item);
	blend.x		= c_yellow;
	pickSound	= item.sound;
	var s = audio_play_sound(pickSound, 1, false);
	audio_sound_pitch(s, choose(1., 1.05));
	fadeOut = true;
}
