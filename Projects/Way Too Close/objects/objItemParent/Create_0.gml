event_inherited();
item			= new Item();
checkItemIndex	= function(_list, _name)
{
	var i = 0; repeat(array_length(_list))
	{
		var val = _list[i];
		if (val.name == item.name)
		{
			return i;
			break;
		}
		i++;
	}
	return undefined;
}

sorted		= false;
typeSort	= function(_a, _b)
{
	return _a.type - _b.type;
}


pick = function()
{
	// Inventory
	var ind = undefined;
	with (objPlayer)
		{
		ind = other.checkItemIndex(inventory, other.item.name);
		if (!is_undefined(ind))
		{
			// Note: Idk why but it automaticly updates wepons count too 
			inventory[ind].count++;
		}
		else
		{
			array_push(inventory, other.item);
			if (other.item.type == ITEM.WEPON) array_push(wepons, other.item);
			array_sort(inventory, other.typeSort);
		}
	}
	// Effect
	blend.x		= c_yellow;
	pickSound	= item.sound;
	var s = audio_play_sound(pickSound, 1, false);
	audio_sound_pitch(s, choose(1., 1.05));
	// Fade out and destroy itself
	fadeOut = true;
}
