event_inherited();

facing = 1;
heatTime = 30;

// Feather disable once GM1043
heatTimer = time_source_create(time_source_game, heatTime, time_source_units_frames, function()
{
	time_source_reset(self.heatTimer);
});

part_type_shape(ptAttack, pt_shape_pixel);
part_type_life(ptAttack, 10, 50);
part_type_alpha2(ptAttack, 1, 0.6);

