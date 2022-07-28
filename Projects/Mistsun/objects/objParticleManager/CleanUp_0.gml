var i = 0; repeat(array_length(partTypes))
{
	var pt = partTypes[i];
	if (part_type_exists(pt))
	{
		part_type_destroy(pt);
	}
	i++;
}

part_system_destroy(global.PSEffects);