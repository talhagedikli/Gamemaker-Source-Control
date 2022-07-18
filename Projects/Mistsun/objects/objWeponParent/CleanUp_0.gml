event_inherited();
var i = 0; repeat(array_length(effectsArray))
{
	var _effect = effectsArray[i];
	part_type_destroy(_effect);
	i++;
}