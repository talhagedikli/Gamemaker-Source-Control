part_system_destroy(global.PS);

surface_free_safe(surPS);

foreach(global.Particles, function(val)
{
	var t = val.Type();
	part_type_destroy(t);
	if (part_type_exists(t)) show("ERROR: part type not destroyed");
});
